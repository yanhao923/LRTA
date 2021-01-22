function [lra_list, z_] = LRAtrain_with_z(X, Y, R, p,Imax,k)
[N,dx] = size(X);
f_He = Hermite(p);
err_tol = 1e-10;
% Imax = 50 * dx;
v = ones(N,dx,R);
z = ones(p, 1, dx, R);
Psi = cell(dx, 1);
w = ones(N, R);
for i = 1:dx
    Psitmp(:,1) = ones(N,1);
    for j = 2:p
        f = inline(f_He(j));
        Psitmp(:,j) = f(X(:,i));
    end
    Psi{i} = Psitmp;
end
Yres = Y;
for r = 1:R
    err0 = 1e-4;
    I = 1;
    while 1
        i = mod(I,dx);
        if i == 0 && I > 0
            i = dx;
        end
        Vtmp = v(:,:,r);
        Vtmp(:,i) = [];
        c = prod(Vtmp,2);
        CPsi = repmat(c,1,p) .* Psi{i};
        z(:,:,i,r) = linsolve(CPsi'*CPsi, CPsi'*Yres);
        v(:,i,r) = Psi{i} * z(:,:,i,r);
        err = mean((Yres - c.*v(:,i,r)).^2) / var(Yres);
        if I <= Imax && abs(err0-err)>1e-9
            err0 = err;
            fprintf('***build: R: %d/%d, Iter: %d/%d, samplingIter,:%d***\n', r, R, I, Imax,k);
            I = I + 1;
        else
            w(:,r) = c .* v(:,i,r);
            break;
        end
    end
    b = linsolve(w(:,1:r)'*w(:,1:r), w(:,1:r)'*Y);
    X_sym = sym(ones(1,dx));
    for i = 1:dx
        X_sym(i) = ['x' num2str(i)];
    end
    lra = 0;
    for j = 1:r
        f_w = 1;
        for k = 1:dx
            for order = 1:p
                temp(order) = subs(f_He(order),'x',X_sym(k));
            end
            f_w = f_w * (temp * z(:,:,k,j));
        end
        lra = lra + b(j) * f_w;
    end
    lra_list(r) = lra;
    hatY = w(:, 1:r) * b;
    Yres = Y - hatY;
end 
    z_ = {};
    temp = mat2cell(z,[p], [1], ones(1, dx), ones(1,R));%delete the dimensions whose number is 1
    for i = 1:dx
        z_{i,R} = temp{i};
    end

end