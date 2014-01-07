if (( "$#" != "1" ))
then
  echo "args = [folder]"
  exit
fi
folder=$1
#cp -v /Users/Andrew/Code/CMSSW_5_3_7/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/shapes/Imperial/htt_et.inputs-sm-7TeV.root setups/$folder/et/
#cp -v /Users/Andrew/Code/CMSSW_5_3_7/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/shapes/Imperial/htt_et.inputs-sm-8TeV.root setups/$folder/et/
#cp -v /Users/Andrew/Code/CMSSW_5_3_7/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/shapes/Imperial/htt_mt.inputs-sm-7TeV.root setups/$folder/mt/
#cp -v /Users/Andrew/Code/CMSSW_5_3_7/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/shapes/Imperial/htt_mt.inputs-sm-8TeV.root setups/$folder/mt/
#cp -v /Users/Andrew/Code/CMSSW_5_3_7/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/shapes/Imperial/htt_em.inputs-sm-7TeV.root setups/$folder/em/
#cp -v /Users/Andrew/Code/CMSSW_5_3_7/src/UserCode/ICHiggsTauTau/Analysis/HiggsTauTau/shapes/Imperial/htt_em.inputs-sm-8TeV.root setups/$folder/em/

scale2SM.py -i setups/$folder/et/htt_et.inputs-sm-7TeV.root -s 'ggH, qqH, VH, ggH_hww, qqH_hww' 110-145:5
scale2SM.py -i setups/$folder/et/htt_et.inputs-sm-8TeV.root -s 'ggH, qqH, VH, ggH_hww, qqH_hww' 110-145:5
scale2SM.py -i setups/$folder/mt/htt_mt.inputs-sm-7TeV.root -s 'ggH, qqH, VH, ggH_hww, qqH_hww' 110-145:5
scale2SM.py -i setups/$folder/mt/htt_mt.inputs-sm-8TeV.root -s 'ggH, qqH, VH, ggH_hww, qqH_hww' 110-145:5
scale2SM.py -i setups/$folder/em/htt_em.inputs-sm-7TeV.root -s 'ggH, qqH, VH, ggH_hww, qqH_hww' 110-145:5
scale2SM.py -i setups/$folder/em/htt_em.inputs-sm-8TeV.root -s 'ggH, qqH, VH, ggH_hww, qqH_hww' 110-145:5
