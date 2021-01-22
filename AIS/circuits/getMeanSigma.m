%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Provide the MEAN and SIGMA as initial input data
%   toxe			vth		lint		u0		rsh	cgso		cgdo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [mean_vals, sigma_vals] = getMeanSigma(analysis)
circuitName = analysis.circuitName;
circuitPath = analysis.circuitPath;
if(strcmp(circuitName,'sram'))
    cd(circuitPath);
    getMeanSigma; 
    cd(analysis.path);
elseif(strcmp(circuitName,'sram6Tcell'))
    cd(circuitPath);
    getMeanSigma; 
    cd(analysis.path);
 elseif(strcmp(circuitName,'sram144d'))
    cd(circuitPath);
    getMeanSigma; 
    cd(analysis.path); 
 elseif(strcmp(circuitName,'sram576d'))
    cd(circuitPath);
    getMeanSigma; 
    cd(analysis.path); 
 elseif(strcmp(circuitName,'Copy_of_sram576d'))
    cd(circuitPath);
    getMeanSigma; 
    cd(analysis.path); 
elseif(strcmp(circuitName,'sa'))
    cd(circuitPath);
    getMeanSigma; 
    cd(analysis.path);
  elseif(strcmp(circuitName,'Copy_of_sram144d'))
    cd(circuitPath);
    getMeanSigma; 
    cd(analysis.path);  
else
    disp('Illegal input parameter: circuitName');
end

end