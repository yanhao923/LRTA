tic
R = 1;
p = 6;
RMSE2 = [];
sens_sort = sortrows(cell2mat(S), 2);
format long
addpath([AIS_path, '/AIS']);
%% set 4 steps, reduce 40/60/80/100 dimensions each time
pfail_reduced2 = [];
nReduced = (6:10)*50;
FOM2 = [];
num_MC = 2e4;
load('/home/soc/xuancz18/tensor/data/Y_MC_2.mat');
for i = 1:length(nReduced)
    sens_sort_order = sens_sort(nReduced(i)+1:end,1);
    sens_sort_order = sort(sens_sort_order);
    %% get the FOM of each field, from 0 to 4000
    parfor j = 2:41
        origin_lra_list = LRAtrain(normTrain(1:((j-1)*100), sens_sort_order), Ytrain(1:((j-1)*100)), R, p, Imax-20*nReduced(i), j);
        origin_lra_vec = origin_lra_list(end);
        disp('reduced dimension = ');
        disp(i);
        disp('samples = ');
        disp((j-1)*100);
        origin_Ytestpre_reduced = LRApred(normTest(:,sens_sort_order), num_MC, dx-nReduced(i), origin_lra_vec, circuit-nReduced(i));
        RMSE2(i,j) = sqrt(sum((Y_MC-origin_Ytestpre_reduced).^2));
    end 
end
toc