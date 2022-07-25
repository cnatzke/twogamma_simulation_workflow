# Purpose
This workflow was build and designed to run on the OSG via the Pegasus workflow manager to simulate two-photon decay in the GRIFFIN HPGe array at TRIUMF ISAC.

# Usage
## Running the Workflow
To run the workflow use:
```
./simulation_workflow.py
```
in the parent workflow directory. Pegasus will look for all datafiles in the `inputs` directory and the exectuables in the `bin` directory.

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
