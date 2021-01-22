pfail_extra = [];
for i = 100:100:900
    lra_list = LRAtrain(normTrain(1:i,:), Ytrain(1:i), R, p, Imax, i);
    lra_vec = lra_list(end);
    Ytestpre = LRApred(normTest, nTest, dx, lra_vec, circuit);
    Yexceed = origin_Ytestpre(Ytestpre <= threshold);
    pfail_extra = [pfail_extra;length(Yexceed)/nTest];
end

