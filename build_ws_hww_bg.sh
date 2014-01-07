# this script will produce a workspace in which the hww component floats as a background 

text2workspace.py -b em.txt -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel -o ./tmp.root -m 125 --default-morphing shape2 --PO verbose \
--PO 'map=^.*h(bb|tt|cc|mm).*/(gg|qq|tt|[WZV])H$:r[1,0,2]' \
--PO 'map=^.*/(gg|qq|tt|[WZV])H_h(bb|tt|cc|mm)$:r[1,0,2]' \
--PO 'map=^.*/(gg|qq|tt|[WZV])H_hww(\d+\.*\d*)*$:BRww=BRww[1,0,50]'

