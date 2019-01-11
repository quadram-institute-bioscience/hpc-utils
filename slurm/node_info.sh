#!/bin/bash
# This is a script that will be executed befor the command sent
# throught the Slurm wrapper (sb.pl / sw.pl)

VER=18.10

echo "# VARS"
echo "- JobID:        $SLURM_JOB_ID"
echo "- Nodes:        $SLURM_JOB_NODELIST"
echo "- Tasks:        $SLURM_NTASKS"
echo "- sb/Threads:   $THIS_JOB_CORES"
echo "- sb/JobName:   $THIS_JOB_NAME"
echo "- sb/LogDir:    $THIS_JOB_LOGDIR"
echo ""
echo "# Machine"
echo -n "- Hostname:"
hostname -f
echo "- NodeID:$SLURM_NODEID"
echo "# FREE_MEM_GB"
free -g

echo "# PATH"
echo $PATH | sed 's/:/\n/g'

echo "# PWD"
pwd

echo "# DATE"
date

echo "# CPUS"
cat /proc/cpuinfo | grep process | wc -l


echo "# VERSION"
echo "- Node_info_v:$VER"
