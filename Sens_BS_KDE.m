%clear;
warning off;
%circuit = 144; % circuit dimension
%addpath('sram_18d_mc');

format long
analysis.circuitName = 'sram144d';
analysis.path = pwd;
analysis.hspicepath = '/usr/eda/synopsys/hspice_J201409/hspice/bin/hspice';
analysis.circuitPath = ['./AIS/circuits/', analysis.circuitName];
addpath(analysis.circuitPath);
addpath([pwd, '/AIS']);
addpath([pwd, '/AIS/HspiceToolbox']);
addpath([pwd, '/AIS/utility']);
addpath([pwd, '/AIS/utility/spkmeans']);
[analysis.model.mean, analysis.model.sigma] = getMeanSigma(analysis);
global nDim;
nDim = size(analysis.model.mean,2);
circuit = nDim;

pfailMC = 1.5e-5; % target failurerate
nTest = 1e7;
normTest = randn(nTest, circuit);
threshold = 3.0e-9;

nSim = 1e3;
min_r = -3.5*ones(1,nDim);
max_r = 3.5*ones(1,nDim);
[normTrain,Xnorm] = lhs_mod(nSim,min_r,max_r);%normTrain is the input, Xnorm 
sample = repmat(analysis.model.mean,[nSim,1])+normTrain.*repmat(analysis.model.sigma,[nSim,1]);
Ytrain = runSimulation(sample,nSim,analysis);

% hyper parameter
dx = circuit;
Imax = 50*dx; 
R = 1; p = 6;  % Rank and polynomial degree
k=1;

pfail = []; 

step = 200; 
pfailtotal = [];

nCandid = 3e3;
min_r = -3.5*ones(1,nDim);
max_r = 3.5*ones(1,nDim);
T = 50;
%%generate a list of random test samples
normC_list = []
    for nu = 1:T
        [normC,temp] = lhs_mod(nCandid,min_r,max_r);
        normC_list = [normC_list;normC];
    end
    stream = RandStream('mlfg6331_64');
    options = statset('UseParallel',1,'UseSubstreams',1,'Streams',stream);
    nK = 50;
    [idx_list, C] = kmeans(normC_list, nK,'Options',options,'MaxIter',200, ...
                'Display','final','Replicates',50);
%%
trainSize = [];

%% train model
for i = 1:T
    normC = normC_list((i-1)*nCandid+1:i*nCandid,:);
    idx = idx_list((i-1)*nCandid+1:i*nCandid);
    Yfinal = [];
    trainsize = size(normTrain, 1);
    
    [origin_lra_list, z] = LRAtrain_with_z(normTrain, Ytrain, R, p, Imax, i);
    origin_lra_vec = origin_lra_list(end);
    disp(length(Ytrain))
    % prediction
    origin_Ytestpre = LRApred(normTest, nTest, dx, origin_lra_vec, circuit);
    Yexceed = origin_Ytestpre(origin_Ytestpre >= threshold);
    pfail = length(Yexceed)/nTest;
    if (pfail==0)
        break;
    end
    pfailtotal = [pfailtotal, pfail];    % pfailtotal should be 1 more than pfail 
    FOM = std(pfailtotal)/mean(pfailtotal);
    if (FOM<=0.1 && i>T) 
        break;
    end
    for b = 1:5
        bootsize = 1;
        [bootstat, bootsam] = bootstrp(bootsize,[],normTrain(:,1)');
        bootnorm = normTrain(bootsam',:);
        booty = Ytrain(bootsam');
        lra_list = LRAtrain(bootnorm, booty, R, p, Imax, b);
        lra_vec = lra_list(end);

        Ycluspre = LRApred(normC, nCandid, dx, lra_vec, circuit);
        Yfinal = [Yfinal, Ycluspre];  
    end

    SEM = std(Yfinal,0,2)./sqrt(size(Yfinal,2));
    ts = tinv([0.025 0.975],size(Yfinal,2)-1);
    ci = SEM*ts + repmat(mean(Yfinal,2),[1,2]);
    Ymean = mean(Yfinal, 2);
    ciLength = ci(:,2)-ci(:,1);
    weight = abs(Ymean-threshold)./ciLength;
    weight_reverse = 1./weight;
    %% add KDE like sampling method
    addNorm = [];
    for j = 1:nK
        weight_C = weight_reverse(idx==j);
        sampleWeight = weight_C/sum(weight_C);
        sampleWeight = sampleWeight';
        sampleCum = cumsum(sampleWeight);
        temp = rand;
        sampleIndex = find(sampleCum >= temp, 1);
        mu = normC(sampleIndex, :);
        sigma = analysis.model.sigma;
        sample = mvnrnd(mu, sigma, 1);
        addNorm = [addNorm; sample];
    end   
    addsize = size(addNorm,1);
    add = repmat(analysis.model.mean,[addsize,1]) ...
              + addNorm.*repmat(analysis.model.sigma,[addsize,1]);
    addY = runSimulation(add, addsize, analysis);
    normTrain = [normTrain; addNorm]; 
    Ytrain = [Ytrain; addY];
    trainSize = [trainSize, size(Ytrain)];
end
time = toc;
p = mod(count,10);
q = (count-p)/10;

name = length(Ytrain);
filename = strcat('/home2/soc/xcz/tensor/LRA18d-6-12/data/result144_',char(48+q), char(48+p));
save(filename);

%% analysis sensitivities of all the input dimensions
id = cell(circuit,1);
for m = 1:circuit
    id{m} = m;
end
[V, S] = lra_sensitivities(z, 1, id);
FOM_total = []
for i = 2:25
    FOM_total = [FOM_total;std(pfailtotal(1:i))/mean(pfailtotal(1:i))];
end