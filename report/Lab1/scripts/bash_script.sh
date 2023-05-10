#!/Bin/bash 
#timevar=0
true > "myfile.txt"
while getopts s:e:f: flag
do
    case "${flag}" in
        f) timevar=${OPTARG};; #first timeout
        s) timeout_step=${OPTARG};;
        e) timeout_end=${OPTARG};;
    esac
done
while [ $timevar -le $timeout_end ]
do
    energy=$(./dpm_simulator -t $timevar -psm example/psm.txt -wl example/workload_2.txt | awk '/Energy[[:space:]]w[[:space:]]DPM/ {print $13}')
    echo "${energy:0:11} $timevar" >> "myfile.txt"
    timevar=$((timevar+timeout_step))
done 
