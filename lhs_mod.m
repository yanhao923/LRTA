function [X_scale, X_norm] = lhs_mod(n, min_ranges_p, max_ranges_p)
p = length(min_ranges_p);

[M,N]=size(min_ranges_p);
if M<N
    min_ranges_p_ = min_ranges_p';
end
[M,N] = size(max_ranges_p);
if M<N
    max_ranges_p_ = max_ranges_p';
end

slope = max_ranges_p - min_ranges_p;
offset = min_ranges_p;

SLOPE = ones(n,p);

for i = 1:p
    SLOPE(:,i) = ones(n,1).*slope(i);
    OFFSET(:,i) = ones(n,1).*offset(i);
end

X_norm = lhsnorm(n,p);
X_scale = SLOPE.*X_norm + OFFSET;
end
