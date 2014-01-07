MASS=125

#MASS=110
#VALUE_ggH=2.844E-01
#VALUE_qqH=2.543E-01
#VALUE_WH=3.372E-01
#VALUE_ZH=3.272E-01
#VALUE_VH=3.335E-01
#
#MASS=120
#VALUE_ggH=7.101E-01
#VALUE_qqH=6.853E-01
#VALUE_WH=7.494E-01
#VALUE_ZH=7.438E-01
#VALUE_VH=7.473E-01
#
#MASS=130
#VALUE_ggH=1.305E+00
#VALUE_qqH=1.349E+00
#VALUE_WH=1.234E+00
#VALUE_ZH=1.246E+00
#VALUE_VH=1.238E+00
#
#MASS=140
#VALUE_ggH=1.865E+00
#VALUE_qqH=2.051E+00
#VALUE_WH=1.577E+00
#VALUE_ZH=1.626E+00
#VALUE_VH=1.595E+00

#VALUE_ggH=1
#VALUE_qqH=1
#VALUE_WH=1
#VALUE_ZH=1
#VALUE_VH=1



cd LIMITS-131128-hww/bbb-float/cmb/$MASS
combineCards.py -S htt_ee_0_7TeV=htt_ee_0_7TeV.txt htt_ee_0_8TeV=htt_ee_0_8TeV.txt htt_ee_1_7TeV=htt_ee_1_7TeV.txt htt_ee_1_8TeV=htt_ee_1_8TeV.txt htt_ee_2_7TeV=htt_ee_2_7TeV.txt htt_ee_2_8TeV=htt_ee_2_8TeV.txt htt_ee_3_7TeV=htt_ee_3_7TeV.txt htt_ee_3_8TeV=htt_ee_3_8TeV.txt htt_ee_4_7TeV=htt_ee_4_7TeV.txt htt_ee_4_8TeV=htt_ee_4_8TeV.txt htt_em_0_7TeV=htt_em_0_7TeV.txt htt_em_0_8TeV=htt_em_0_8TeV.txt htt_em_1_7TeV=htt_em_1_7TeV.txt htt_em_1_8TeV=htt_em_1_8TeV.txt htt_em_2_7TeV=htt_em_2_7TeV.txt htt_em_2_8TeV=htt_em_2_8TeV.txt htt_em_3_7TeV=htt_em_3_7TeV.txt htt_em_3_8TeV=htt_em_3_8TeV.txt htt_em_4_7TeV=htt_em_4_7TeV.txt htt_em_4_8TeV=htt_em_4_8TeV.txt htt_em_5_8TeV=htt_em_5_8TeV.txt htt_et_1_7TeV=htt_et_1_7TeV.txt htt_et_1_8TeV=htt_et_1_8TeV.txt htt_et_2_7TeV=htt_et_2_7TeV.txt htt_et_2_8TeV=htt_et_2_8TeV.txt htt_et_3_7TeV=htt_et_3_7TeV.txt htt_et_3_8TeV=htt_et_3_8TeV.txt htt_et_5_7TeV=htt_et_5_7TeV.txt htt_et_5_8TeV=htt_et_5_8TeV.txt htt_et_6_7TeV=htt_et_6_7TeV.txt htt_et_6_8TeV=htt_et_6_8TeV.txt htt_et_7_8TeV=htt_et_7_8TeV.txt htt_mm_0_7TeV=htt_mm_0_7TeV.txt htt_mm_0_8TeV=htt_mm_0_8TeV.txt htt_mm_1_7TeV=htt_mm_1_7TeV.txt htt_mm_1_8TeV=htt_mm_1_8TeV.txt htt_mm_2_7TeV=htt_mm_2_7TeV.txt htt_mm_2_8TeV=htt_mm_2_8TeV.txt htt_mm_3_7TeV=htt_mm_3_7TeV.txt htt_mm_3_8TeV=htt_mm_3_8TeV.txt htt_mm_4_7TeV=htt_mm_4_7TeV.txt htt_mm_4_8TeV=htt_mm_4_8TeV.txt htt_mt_1_7TeV=htt_mt_1_7TeV.txt htt_mt_1_8TeV=htt_mt_1_8TeV.txt htt_mt_2_7TeV=htt_mt_2_7TeV.txt htt_mt_2_8TeV=htt_mt_2_8TeV.txt htt_mt_3_7TeV=htt_mt_3_7TeV.txt htt_mt_3_8TeV=htt_mt_3_8TeV.txt htt_mt_4_7TeV=htt_mt_4_7TeV.txt htt_mt_4_8TeV=htt_mt_4_8TeV.txt htt_mt_5_7TeV=htt_mt_5_7TeV.txt htt_mt_5_8TeV=htt_mt_5_8TeV.txt htt_mt_6_7TeV=htt_mt_6_7TeV.txt htt_mt_6_8TeV=htt_mt_6_8TeV.txt htt_mt_7_8TeV=htt_mt_7_8TeV.txt htt_tt_0_8TeV=htt_tt_0_8TeV.txt htt_tt_1_8TeV=htt_tt_1_8TeV.txt htt_tt_2_8TeV=htt_tt_2_8TeV.txt vhtt_0_7TeV=vhtt_0_7TeV.txt vhtt_0_8TeV=vhtt_0_8TeV.txt vhtt_1_7TeV=vhtt_1_7TeV.txt vhtt_1_8TeV=vhtt_1_8TeV.txt vhtt_3_7TeV=vhtt_3_7TeV.txt vhtt_3_8TeV=vhtt_3_8TeV.txt vhtt_4_7TeV=vhtt_4_7TeV.txt vhtt_4_8TeV=vhtt_4_8TeV.txt vhtt_5_7TeV=vhtt_5_7TeV.txt vhtt_5_8TeV=vhtt_5_8TeV.txt vhtt_6_7TeV=vhtt_6_7TeV.txt vhtt_6_8TeV=vhtt_6_8TeV.txt vhtt_7_7TeV=vhtt_7_7TeV.txt vhtt_7_8TeV=vhtt_7_8TeV.txt vhtt_8_7TeV=vhtt_8_7TeV.txt vhtt_8_8TeV=vhtt_8_8TeV.txt &> cards.txt
text2workspace.py -b cards.txt -o ./workspace.root -m $MASS --default-morphing shape2 -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose \
--PO 'map=^.*h(bb|tt|cc|mm).*/(gg|qq|tt|[WZV])H$:r[1,-5,5]' \
--PO 'map=^.*/(gg|qq|tt|[WZV])H_h(bb|tt|cc|mm)$:r[1,-5,5]' \
--PO 'map=^.*/(gg|qq|tt|[WZV])H_hww(\d+\.*\d*)*$:BRww=BRww[2,0,50]'
#--PO "map=^.*/ggH_hww(\d+\.*\d*)*$:Relmu_ggH_hww=Relmu_ggH_hww[$VALUE_ggH]" \
#--PO "map=^.*/qqH_hww(\d+\.*\d*)*$:Relmu_qqH_hww=Relmu_qqH_hww[$VALUE_qqH]" \
#--PO "map=^.*/WH_hww(\d+\.*\d*)*$:Relmu_WH_hww=Relmu_WH_hww[$VALUE_WH]" \
#--PO "map=^.*/ZH_hww(\d+\.*\d*)*$:Relmu_ZH_hww=Relmu_ZH_hww[$VALUE_ZH]" \
#--PO "map=^.*/VH_hww(\d+\.*\d*)*$:Relmu_VH_hww=Relmu_VH_hww[$VALUE_VH]" 
combine -M MaxLikelihoodFit -m $MASS  --robustFit=1 --preFitValue=1. --X-rtd FITTER_NEW_CROSSING_ALGO --minimizerAlgoForMinos=Minuit2 --minimizerToleranceForMinos=0.1 --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --minimizerAlgo=Minuit2 --minimizerStrategy=0 --minimizerTolerance=0.1 --cminFallbackAlgo "Minuit2,0:1."  --rMin -5 --rMax 5   ./workspace.root --out=out
python $CMSSW_BASE/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -A -a --stol 0.99 --stol 0.99 --vtol 99. --vtol2 99. -f text out/mlfit.root  > out/mlfit.txt
cat out/mlfit.txt | grep BRww
rm workspace.root cards.txt
cd -




