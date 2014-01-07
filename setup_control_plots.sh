if (( "$#" != "1" ))
then
  echo "args = [folder]"
  exit
fi

folder=$1
#masses=125
masses="125"

setup-datacards.py -i setups/$folder -o aux/$folder -p '7TeV' -a sm -c 'em' --sm-categories-em='0 2 4' $masses
setup-datacards.py -i setups/$folder -o aux/$folder -p '8TeV' -a sm -c 'em' --sm-categories-em='0 2 4' $masses

setup-datacards.py -i setups/$folder -o aux/$folder -p '7TeV' -a sm -c 'et' --sm-categories-et='0 3 6' $masses
setup-datacards.py -i setups/$folder -o aux/$folder -p '8TeV' -a sm -c 'et' --sm-categories-et='0 3 6' $masses

setup-datacards.py -i setups/$folder -o aux/$folder -p '7TeV' -a sm -c 'mt' --sm-categories-mt='0 3 6' $masses
setup-datacards.py -i setups/$folder -o aux/$folder -p '8TeV' -a sm -c 'mt' --sm-categories-mt='0 3 6' $masses


setup-htt.py -i aux/$folder -o LIMITS/$folder -p '7TeV' -a sm -c 'em' --sm-categories-em='0 2 4' $masses
setup-htt.py -i aux/$folder -o LIMITS/$folder -p '8TeV' -a sm -c 'em' --sm-categories-em='0 2 4' $masses

setup-htt.py -i aux/$folder -o LIMITS/$folder -p '7TeV' -a sm -c 'et' --sm-categories-et='0 3 6' $masses
setup-htt.py -i aux/$folder -o LIMITS/$folder -p '8TeV' -a sm -c 'et' --sm-categories-et='0 3 6' $masses

setup-htt.py -i aux/$folder -o LIMITS/$folder -p '7TeV' -a sm -c 'mt' --sm-categories-mt='0 3 6' $masses
setup-htt.py -i aux/$folder -o LIMITS/$folder -p '8TeV' -a sm -c 'mt' --sm-categories-mt='0 3 6' $masses
