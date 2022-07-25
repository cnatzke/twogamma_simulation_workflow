#!/usr/bin/env python3

import csv
import subprocess

def main():
    filename = "simulation_config.cfg"

    with open(filename) as f:

        queue = [{k: v for k, v in row.items()} for row in csv.DictReader(f, skipinitialspace=True)]
    
    for parent in queue:
        element = parent['z']
        isotope = parent['a']
        total_events = int(float(parent['total_events']))
        batch_events = int(float(parent['events_per_sim']))

        run_command = f"./simulation_workflow.py -a {element} -z {isotope} -e {total_events} -b {batch_events}"

        returned_value = subprocess.call(run_command, shell=True)


if __name__ == "__main__":
    main()