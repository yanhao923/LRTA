%% Utility 
% write the sweep_data file for sram.sp

%% Write Input Sample File  [output] = run_file(path, sample, num)
function [output] = runSimulation(sample, num, analysis)
global simulationNum;
simulationNum = simulationNum + num;
circuitName = analysis.circuitName;
circuitPath = analysis.circuitPath;
hspicepath  = analysis.hspicepath;

if(strcmp(circuitName,'sram'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);
elseif(strcmp(circuitName,'sram6Tcell'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);
elseif(strcmp(circuitName,'Copysram6Tcell'))
cd(circuitPath);
output = run(sample, num, hspicepath);
cd(analysis.path);
elseif(strcmp(circuitName,'sa'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);
elseif(strcmp(circuitName,'sa3'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);
elseif(strcmp(circuitName,'TwoStageAmplifier_16d'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);
elseif(strcmp(circuitName,'TwoStageAmplifier_64d'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);
elseif(strcmp(circuitName,'cp22nm70d'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);   
elseif(strcmp(circuitName,'sram576d'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path);  
elseif(strcmp(circuitName,'Copy_of_sram576d'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path); 
elseif(strcmp(circuitName,'sram144d'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path); 
elseif(strcmp(circuitName,'Copy_of_sram144d'))
    cd(circuitPath);
    output = run(sample, num, hspicepath);
    cd(analysis.path); 
else
    disp('Illegal input parameter: circuitName');
end
% [output] = run_cp22nmdemo(sample, num, analysis.hspicepath);
end