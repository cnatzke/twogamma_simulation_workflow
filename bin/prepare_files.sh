#!/bin/bash

help()
{
   # Display Help
   echo "Prepares input files for subsequent steps of the workflow"
   echo
   echo "Syntax: prepare_files.sh element isotope batch_size output_filename"
   echo "Inputs:"
   echo "   element            Element number"
   echo "   isotope            Isotope number"
   echo "   batch_size         Number of events in a single simulation"
   echo "   output_filename    Name of output file"
   echo
}


if [[ $# != 4 ]]; then
    help
    exit 1
else
    /app/prepare_files.py -z $1 -a $2 -n $3

    # Renaming output files for better record keeping
    if [[ -e run_macro.mac ]]; then
        mv run_macro.mac $4
        exit 0
    elif [[ ! -f run_macro.mac ]]; then
        echo "run_macro.mac not found, exiting"
        exit 1
    else
        echo "Something went wrong"
        exit 2
    fi
fi