#!/bin/bash

# source root & grsisort 
source /software/root/bin/thisroot.sh
source /software/GRSISort/thisgrsi.sh

# run ntuple
/software/NTuple2EventTree/NTuple2EventTree -sf /softwares/NTuple2EventTree/Settings.dat -if $1

if [[ ! -f analysis00000_000.root ]]; then 
    echo "Analysis file not found, exiting"
    exit 1
else 
    mv analysis00000_000.root $2
    exit 0
fi

