function [Ylra] = LRApred(X, testNum, dx, lra_vec,circuit)% dx is the dimension of the circuit

    com = 'Ylra = g(';
    for i = 1:(circuit-1)
        com = strcat(com, 'X(:,', num2str(i), '),');
    end
    com = strcat(com, 'X(:,', num2str(circuit), '));');
    g = matlabFunction(lra_vec); % matlabFunction can do what?
    eval(com);
end