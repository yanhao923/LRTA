.title sram

.OPTIONS post=0
.lib './l0040ll_242_sram_v1p4.lib' tt
.include './sweep_data_mc'
.temp=25
.param SUPPLY=0.8
.param VPLUS=0.8


.SUBCKT B6T1 BL VDDA BLB WL1 VSS Q1 QB1
x1 VSS QB1 Q1 VSS dslnfetpd_ckt11 w=0.142u l=0.055u 
x2 VSS Q1 QB1 VSS dslnfetpd_ckt12 w=0.142u l=0.055u 
x3 BL WL1 Q1 VSS dslnfetwl_ckt11 w=0.110u l=0.059u 
x4 BLB WL1 QB1 VSS dslnfetwl_ckt12 w=0.110u l=0.059u 
x5 VDDA QB1 Q1 VDDA dslpfetpu_ckt11 w=0.060u l=0.055u 
x6 QB1 Q1 VDDA VDDA dslpfetpu_ckt12 w=0.060u l=0.055u 
.ENDS

.SUBCKT B6T2 BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt21 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt22 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt21 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt22 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt21 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt22 w=0.060u l=0.055u 
.ENDS

.SUBCKT B6T3 BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt31 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt32 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt31 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt32 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt31 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt32 w=0.060u l=0.055u 
.ENDS

.SUBCKT B6T4 BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt41 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt42 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt41 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt42 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt41 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt42 w=0.060u l=0.055u 
.ENDS

.SUBCKT B6T5 BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt51 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt52 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt51 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt52 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt51 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt52 w=0.060u l=0.055u 
.ENDS

.SUBCKT B6T6 BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt61 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt62 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt61 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt62 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt61 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt62 w=0.060u l=0.055u 
.ENDS

.SUBCKT B6T7 BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt71 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt72 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt71 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt72 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt71 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt72 w=0.060u l=0.055u 
.ENDS

.SUBCKT B6T8 BL VDDA BLB WL VSS Q QB
x1 VSS QB Q VSS dslnfetpd_ckt81 w=0.142u l=0.055u 
x2 VSS Q QB VSS dslnfetpd_ckt82 w=0.142u l=0.055u 
x3 BL WL Q VSS dslnfetwl_ckt81 w=0.110u l=0.059u 
x4 BLB WL QB VSS dslnfetwl_ckt82 w=0.110u l=0.059u 
x5 VDDA QB Q VDDA dslpfetpu_ckt81 w=0.060u l=0.055u 
x6 QB Q VDDA VDDA dslpfetpu_ckt82 w=0.060u l=0.055u 
.ENDS

.SUBCKT array BL VDDA BLB WL1 VSS Q1 QB1 WL Q QB
XT1 BL VDDA BLB WL1 VSS Q1 QB1 B6T1
XT2 BL VDDA BLB WL  VSS Q  QB  B6T2
XT3 BL VDDA BLB WL  VSS Q  QB  B6T3
XT4 BL VDDA BLB WL  VSS Q  QB  B6T4
XT5 BL VDDA BLB WL  VSS Q  QB  B6T5
XT6 BL VDDA BLB WL  VSS Q  QB  B6T6
XT7 BL VDDA BLB WL  VSS Q  QB  B6T7
XT8 BL VDDA BLB WL  VSS Q  QB  B6T8
.ENDS


XT1 BL VDDA BLB WL1 VSS Q1 QB1 WL Q QB array

vVDDH VDDH 0 VPLUS
vVSS VSS 0 0

Clbl BL 0 50f
Clblb BLB 0 50f

Vwl1 WL1 0 pwl(0 0 20p SUPPLY)
Vwl  WL  0 0

.ic   v(BL)=SUPPLY v(BLB)=SUPPLY 
	+ v(Q1)= 0     v(QB1)=VPLUS 
	+ v(Q)=VPLUS   v(QB)= 0

.tran 10p 100n SWEEP DATA=data
*.tran 10p 100n SWEEP Monte=10
.meas Tread trig v(WL1) val='SUPPLY/2' rise=1 targ v(BL) val='SUPPLY-0.15' fall=1

.end
  



