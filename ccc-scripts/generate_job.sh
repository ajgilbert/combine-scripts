if [ -z $2 ]
then
    echo "Must specify <script input> <script output>"
    exit
fi


INPUT=$1
OUTPUT=$2

echo "Generating job $OUTPUT"

echo "#!/bin/bash" &> $OUTPUT
echo "cd $CMSSW_BASE/src" >> $OUTPUT
#echo "export SCRAM_ARCH=slc5_amd64_gcc472" >> $OUTPUT
echo "eval \`scramv1 runtime -sh\`" >> $OUTPUT
echo "cd $PWD" >> $OUTPUT
echo "eval $INPUT" >> $OUTPUT
chmod +x $OUTPUT
