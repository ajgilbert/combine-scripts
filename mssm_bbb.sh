folder=mssm-lowmass-qcd-40
TERMTMP=$TERM
unset TERM
#add_bbb_errors.py 'em:7TeV:01,03,04:Fakes' --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10
#rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
#add_bbb_errors.py 'em:8TeV:01,03,04,05:Fakes' --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10
#rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
#add_bbb_errors.py 'et:7TeV:01,02,04,05:ZL,QCD>W' --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10
#rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
#add_bbb_errors.py 'et:7TeV:06:ZLL,QCD>W' --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10
#rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
add_bbb_errors.py 'et:8TeV:08:TT,QCD,W,ZTT,ZL,ZJ,VV'  --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10 --mssm
rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
add_bbb_errors.py 'et:8TeV:09:TT,QCD,W,ZTT,ZL,ZJ,VV'  --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10 --mssm
rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
#add_bbb_errors.py 'mt:7TeV:01,02,04,05:ZL,QCD>W' --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10
#rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
#add_bbb_errors.py 'mt:7TeV:06:ZLL,QCD>W' --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10
#rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
add_bbb_errors.py 'mt:8TeV:08:TT,QCD,W,ZTT,ZL,ZJ,VV'  --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10 --mssm
rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
add_bbb_errors.py 'mt:8TeV:09:TT,QCD,W,ZTT,ZL,ZJ,VV'  --normalize -f --in setups/$folder --out setups/$folder-tmp --threshold 0.10 --mssm
rm -r setups/$folder; mv setups/$folder-tmp setups/$folder
export TERM=$TERMTMP
echo $TERM


