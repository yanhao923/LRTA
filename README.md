# Source code of Low Rank Tensor Approximation and Sensitivity Analysis
## algorithms
1. Low rank tensor approximation: 

  Unlike the conventional PCE, the number of unknown coefﬁcients   grows linearly with dimension, which makes LRTA particularly promising for dealing with high-dimensional circuit problems.

2.  Global sensitivity analysis: 

  Utilize our LRTA meta-model to compute the variance-based sensitivity indices.
## Components
LRTA(folder name)
-   ---AIS (store necessary files for experiment)
    -   ---HspictToolbox (connect MATLAB and HSPICE)
    -   ---circuits(store circuit netlist named as "xxx.sp")
    -   ---utility (store function)
-    ----Bitcell_BS_KDE.m  (LRTA algorithm for bit cell)
-    ----Sens_BS_KDE.m (LRTA with sensitivity analysis)
-    ----Reduce_dimensiton.m (Reduce dimension according to the sensitivity)
-    other functions

## How to run LRTA?
- Step1. Install HSPICE and MATLAB.
- Step2. Open Bitcell_BS_KDE.m and Configure software location according to the notes in Bitcell_BS_KDE.m
- Step3. Choose the netlist file with ".sp" as suffix in folder named "circuit" and configure it in Bitcell_BS_KDE.m according to notes.
- Step4. Running Bitcell_BS_KDE.m and wait for final results named "pfail".
## see also
https://dl.acm.org/doi/pdf/10.1145/3316781.3317863

https://doi.org/10.1016/j.ress.2007.04.002
