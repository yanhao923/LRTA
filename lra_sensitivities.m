function [V, S] = lra_sensitivities( z, b, id )
%LRA_SENSITIVITIES Summary of this function goes here
    [d R] = size(z);
    V(:, 1) = id;
    S(:, 1) = id;
    squared_mean = (prod(cellfun(@(x) x(1),z), 1)*b)^2;
    zeroprod = @(index_set, r1, r2) prod(cell2mat(cellfun(@(x,y) x(1).*y(1), z(index_set, r1), z(index_set, r2), 'un', 0)));
    prodsum = @(index_set, r1, r2) prod(cell2mat(cellfun(@(x,y) sum(x.*y), z(index_set, r1), z(index_set, r2), 'un', 0)));
    total_variance = b'*reshape(prodsum(1:d, repmat((1:R)', 1, R), repmat(1:R, R, 1))...
                     - zeroprod(1:d, repmat((1:R)', 1, R), repmat(1:R, R, 1)), R, R)*b;
    for i=1:size(S,1)
        V(i, 2) = {(b'*partial_variance_matrix(V{i,1})*b - squared_mean)/total_variance};
        S(i, 2) = {1-(b'*partial_variance_matrix(setdiff(1:d,V{i, 1}))*b - squared_mean)/total_variance};
    end

    function M = partial_variance_matrix(index_set)
        for l1 = 1:R
            for l2 = 1: R
                M(l1, l2) = prodsum(index_set, l1 ,l2)*zeroprod(setdiff(1:d, index_set), l1, l2);
            end
        end
    end

end