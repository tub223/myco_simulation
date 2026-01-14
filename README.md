# myco_simulation
Included in this repository are various input files and simulation trajectories associated with “Dynamic Architecture of Mycobacterial Outer Membranes Revealed by All-Atom Simulations”. Descriptions of each folder and file can be found below:

asym_lipid_lib: carbohydrate restraints, structure files, and CHARMM scripts to build each lipid in an asymmetric outer membrane system.
	MBLA: Fully Extended alpha-Mycolic Acid
	MBLB: Semi-Folded alpha-Mycolic Acid
	MBLC: Fully Folded alpha-Mycolic Acid
	MBLD: Phthiocerol dimycocerosate (PDIM)
	MBLE: Trehalose Dimycolate
	MBLF: Trehalose Monomycolate
	MBLG: Diacyl Trehalose
	MBLH: Pentaacyl Trehalose
	MBLI: Sulfoglycolipid

crds: Input crd files for each system described in the paper.

psfs: Input psf files for each system described in the paper.

restart_rsts: Restart files from the end of simulations. 

dcds: Trajectory files with the final 50 ns of each simulation described in the paper.

openmm_scripts: Python scripts necessary to run simulations with OpenMM.

toppar: Necessary topology and forcefield parameters for running simulations.

toppar.str: CHARMM stream file for loading topology and forcefield parameters.

step7_production.inp: Input file parameters for running production.

run_prod-2080.slurm: bash script for automatic resubmission of production jobs on HPC.

<img width="468" height="525" alt="image" src="https://github.com/user-attachments/assets/8262a71d-7bb8-4d10-b7d3-277dba2fddd3" />

