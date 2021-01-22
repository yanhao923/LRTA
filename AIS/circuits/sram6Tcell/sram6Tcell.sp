
.param SUPPLY=0.8
.param VPLUS=0.8

***********************SETTING*******************************
.OPTIONS accurate post=1 converge=1
.include "./sweep_data_mc"
************************END**********************************

.SUBCKT B6T BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt1 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt2 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt1 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt2 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt1 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt2 w=0.060u l=0.055u 
.ENDS B6T

*.SUBCKT NOR2 VDD VSS VOUT A B
*Xp1 N B VDD VDD plvt11ll_ckt w=500n l=40n
*Xp2 OUT A N VDD plvt11ll_ckt w=500n l=40n
*Xn1 OUT A VSS VSS nlvt11ll_ckt w=120n l=40n
*Xn2 OUT B VSS VSS nlvt11ll_ckt w=120n l=40n
*.ENDS NOR2

*.SUBCKT ReadPath VDD VSS BL WL Q RB GBL BLB QB VDDH
XT1 BL VDDH BLB WL VSS Q QB B6T
*XT2 VDD VSS RB BL VSS NOR2
*Xn1 GBL RB VSS VSS nlvt11ll_ckt w=1u l=40n
*.ENDS ReadPath


*x1 VDD VSS BL WL Q RB GBL BLB QB VDDH ReadPath
*vVDD VDD 0 SUPPLY
vVDDH VDDH 0 VPLUS
vVSS VSS 0 0

*Crb RB 0 3.4f
Clbl BL 0 50f
Clblb BLB 0 50f
*Cgbl GBL 0 31f

*Vwl wl 0 pwl(0 0 300p 0.814 3.77n 0.814 4.07n 0)

Vwl WL 0 pwl(0 0 20p SUPPLY)
*.tran 10p 50n sweep SUPPLY 0.5 1.1 0.1

.lib './smic40ll/l0040ll_242_sram_v1p4.lib' tt

.ic v(BL)=SUPPLY v(BLB)=SUPPLY v(Q)=0 v(QB)=VPLUS
*.probe v(*) 
.temp 25

.tran 10p 50n SWEEP DATA=data

.meas Tread trig v(wl) val='SUPPLY/2' rise=1 targ v(BL) val='SUPPLY-0.15' fall=1
.meas tran ratio param='1/ Tread'
  
.end


  



