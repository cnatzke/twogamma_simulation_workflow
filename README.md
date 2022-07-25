# Purpose
This workflow was build and designed to run on the OSG via the Pegasus workflow manager to simulate two-photon decay in the GRIFFIN HPGe array at TRIUMF ISAC.

# Usage
## Running the Workflow
To run the workflow first update the configuration file `simulation_config.cfg` with the element, isotope, total number of events, and number of events per simulation.

For example a 1e6 event 60Co simulation broken into 2e5 event simulations has the following configuration file: 
```
z, a, total_events, events_per_sim
27, 60, 1e6, 2e5
```

You can run more than one simulation in sequence by adding lines to the file. If you want to follow up the 60Co simulation with a 152Eu simulation using the same number of events the config file looks like: 
```
z, a, total_events, events_per_sim
27, 60, 1e6, 2e5
63, 152, 1e6, 2e5
```
Second run the simulations with the call 
```
./run_campaign.py
```

## Data Files
TODO: Update this section
The workflow requires three data files to properly simulate the GGAC's
1. z{n}.a{n}
2. z{n+1}.a{n}
3. Multipole_z{n+1}.a{n}
where the name of the file dictates the isotope of interest. The creation of these files is automated and handled by the `make_input_files.sh` script.

## Executable functions
All of the exectubale functions run on the exectution nodes during the workflow are in the `bin` directory.

# Output
Pegasus handles all of the file transfers and data validation and transfers the output files to the remote server specified in the site catalog. Only the sorted files are transferred to the output site and done so in tarballs. It is up to the user to unpack the tarballs on the remote site.
