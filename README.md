# summer-2022-internship

## How I completed a run

1. Run the VASP simulation.
2. Navigate to  jobs > simulation folder > QUAMBO (the folder structure should contain a bunch of files like DION, EIEGE, HBLOCH all with numbers after them).
4. Run "extract_blocks.sh dest_folder_name" (/home/pranav/bash_scripts/extract_blocks.sh) in the QUAMBO folder, the first argument to this script is the name of the destination folder. The variable "save_path" in this script can be edited to change the location of the destination folder. This shell requires the octave script extract_data_block.m (/home/pranav/octave_scripts/ExtractData_block.m) to work, the location of the octave script is specified by the "octave_script" variable.
5. After the script runs you should see a bunch of numbered folders numbered 1..n within the destination folder and a folder at the end called "matfiles". This matfiles folder is where all the .mat files from each timestep are stored. These can then be read into python using scipy.
6. Then run "/home/pranav/python_scripts/jupyter-folder/Ice_Block_Loader.ipynb" which is a python notebook file. In cell 2, Replace DATA_DIR with the path to the matfiles folder from step 5, and replace POSCAR_DIR with the path to the job folder of the vasp simulation (contains the poscar). Run all the cells sequentially and then the final line "master_dataset.to_csv("Ice_Cub_Block.csv", index=False)" will export the dataset.
7. If I remember correctly, each row in the dataset represents a group of 5 water molecules. The first 20 columns of each row represent the length 20 vector Dr. Plaisance and I came up with that describes the water molecule and its neighborhood (4 h-bonded water molecules). The 21st column represents the S-integral value which we are trying to predict.
8. 
