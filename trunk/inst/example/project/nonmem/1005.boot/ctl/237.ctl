$PROB 237 phase1 2 CMT like 1004 but diff. initial on V3
$INPUT C ID TIME SEQ=DROP EVID AMT DV SUBJ HOUR TAFD TAD LDOS MDV HEIGHT WT SEX AGE DOSE FED
$DATA ../data/237.csv IGNORE=C
$SUBROUTINE ADVAN4 TRANS4
$PK
 CL=THETA(1)*EXP(ETA(1)) * THETA(6)**SEX * (WT/70)**THETA(7)
 V2 =THETA(2)*EXP(ETA(2))
 KA=THETA(3)*EXP(ETA(3))
 Q  =THETA(4)
 V3=THETA(5)
 S2=V2
 
$ERROR
 Y=F*(1+ERR(1)) + ERR(2)
 IPRE=F

$THETA
(0,10,50)     
(0,10,100)    
(0,0.2, 5)    
(0,10,50)     
(0,100,1000)  
(0,1,2)       
(0,0.75,3)    

$OMEGA BLOCK(3)
.1
.01 .1
.01 .01 .1








$SIGMA 0.1 0.1




$ESTIMATION MAXEVAL=9999 PRINT=5 NOABORT METHOD=1 INTER MSFO=./237.msf
;$COV PRINT=E
;$TABLE NOPRINT FILE=./237.tab ONEHEADER ID AMT TIME EVID PRED IPRE CWRES
;$TABLE NOPRINT FILE=./237par.tab ONEHEADER ID TIME CL Q V2 V3 KA ETA1 ETA2 ETA3

















