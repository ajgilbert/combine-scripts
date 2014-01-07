folder=pruning_results_hcp_tails

python HiggsAnalysis/HiggsToTauTau/scripts/prune-uncerts-htt.py --mass 160 --fit-results=$folder'/et/160/out/mlfit.txt' --threshold=0.1 --whitelist='_bin_' $folder/et/160
mv uncertainty-pruning-drop.txt uncertainty-pruning-drop-et.txt
mv uncertainty-pruning-keep.txt uncertainty-pruning-keep-et.txt

python HiggsAnalysis/HiggsToTauTau/scripts/prune-uncerts-htt.py --mass 160 --fit-results=$folder'/mt/160/out/mlfit.txt' --threshold=0.1 --whitelist='_bin_' $folder/mt/160
mv uncertainty-pruning-drop.txt uncertainty-pruning-drop-mt.txt
mv uncertainty-pruning-keep.txt uncertainty-pruning-keep-mt.txt

python HiggsAnalysis/HiggsToTauTau/scripts/prune-uncerts-htt.py --mass 160 --fit-results=$folder'/em/160/out/mlfit.txt' --threshold=0.1 --whitelist='_bin_' $folder/em/160
mv uncertainty-pruning-drop.txt uncertainty-pruning-drop-em.txt
mv uncertainty-pruning-keep.txt uncertainty-pruning-keep-em.txt

python HiggsAnalysis/HiggsToTauTau/scripts/prune-uncerts-htt.py --mass 160 --fit-results=$folder'/mm/160/out/mlfit.txt' --threshold=0.1 --whitelist='_bin_' $folder/mm/160
mv uncertainty-pruning-drop.txt uncertainty-pruning-drop-mm.txt
mv uncertainty-pruning-keep.txt uncertainty-pruning-keep-mm.txt

python HiggsAnalysis/HiggsToTauTau/scripts/prune-uncerts-htt.py --mass 160 --fit-results=$folder'/tt/160/out/mlfit.txt' --threshold=0.1 --whitelist='_bin_' $folder/tt/160
mv uncertainty-pruning-drop.txt uncertainty-pruning-drop-tt.txt
mv uncertainty-pruning-keep.txt uncertainty-pruning-keep-tt.txt

cat uncertainty-pruning-drop-*.txt >> uncertainty-pruning-drop.txt
cat uncertainty-pruning-keep-*.txt >> uncertainty-pruning-keep.txt
