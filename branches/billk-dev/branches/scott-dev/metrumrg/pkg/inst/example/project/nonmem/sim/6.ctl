$PROB 6 phase1 2 CMT like 1004 but diff. initial on V3
$INPUT C ID TIME SEQ=DROP EVID AMT DV SUBJ HOUR HEIGHT WT SEX AGE DOSE FED
$DATA ../../data/derived/phase1.csv IGNORE=C
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
;
$THETA 8.205
21.46
0.0748
4.221
116.3
0.934
1.544
$OMEGA 0.2462
0.1764
0.08805
$SIGMA 0.07274
$SIMULATION ( 8001 NEW) ( 9002 UNIFORM) ONLYSIMULATION
$TABLE ID TIME DV WT SEX LDOS NOPRINT NOAPPEND FILE=sim.tab
