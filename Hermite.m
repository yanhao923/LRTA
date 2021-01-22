function [H] = Hermite(p)
    syms x; syms H;
    switch p
        case 0
            H(1) = 1;
        case 1
            H(2) = x;
        otherwise
            H(1) = 1;
            H(2) = x;
    end
    for i = 3:p
        H(i) = x*H(i-1) - (i-2)*H(i-2);
        H(i) = simplify(H(i));
    end
end

