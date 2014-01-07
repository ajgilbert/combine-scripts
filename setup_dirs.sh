if (( "$#" != "1" ))
then
  echo "args = [folder]"
  exit
fi

folder=$1
#masses=125
masses="110-145:5"

setup-datacards.py -i setups/$folder -o aux/$folder -p '7TeV' -a sm -c 'em' --sm-categories-em='0 1 2 3 4' $masses
setup-datacards.py -i setups/$folder -o aux/$folder -p '8TeV' -a sm -c 'em' --sm-categories-em='0 1 2 3 4 5' $masses

setup-datacards.py -i setups/$folder -o aux/$folder -p '7TeV' -a sm -c 'et' --sm-categories-et='0 1 2 3 4 5 6' $masses
setup-datacards.py -i setups/$folder -o aux/$folder -p '8TeV' -a sm -c 'et' --sm-categories-et='0 1 2 3 4 5 6 7' $masses

setup-datacards.py -i setups/$folder -o aux/$folder -p '7TeV' -a sm -c 'mt' --sm-categories-mt='0 1 2 3 4 5 6' $masses
setup-datacards.py -i setups/$folder -o aux/$folder -p '8TeV' -a sm -c 'mt' --sm-categories-mt='0 1 2 3 4 5 6 7' $masses


setup-htt.py -i aux/$folder -o LIMITS/$folder -p '7TeV' -a sm -c 'em' --sm-categories-em='0 1 2 3 4' $masses
setup-htt.py -i aux/$folder -o LIMITS/$folder -p '8TeV' -a sm -c 'em' --sm-categories-em='0 1 2 3 4 5' $masses

setup-htt.py -i aux/$folder -o LIMITS/$folder -p '7TeV' -a sm -c 'et' --sm-categories-et='0 1 2 3 5 6' $masses
setup-htt.py -i aux/$folder -o LIMITS/$folder -p '8TeV' -a sm -c 'et' --sm-categories-et='0 1 2 3 5 6 7' $masses

setup-htt.py -i aux/$folder -o LIMITS/$folder -p '7TeV' -a sm -c 'mt' --sm-categories-mt='0 1 2 3 4 5 6' $masses
setup-htt.py -i aux/$folder -o LIMITS/$folder -p '8TeV' -a sm -c 'mt' --sm-categories-mt='0 1 2 3 4 5 6 7' $masses
