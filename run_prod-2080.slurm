#!/bin/csh
#SBATCH [ADD SBATCH OPTIONS] 
source /etc/profile.d/zlmod.csh  #/home/alp514/lmod/zlmod.csh 
module load [CUDA_VERSION]
set systype = membrane
set python = [PATH_TO_PYTHON]
set LOCAL = [PATH_TO_LOCAL]
setenv OPENMM_PLUGIN_DIR [PATH_TO_OPENMM_PLUGIN_DIR]
setenv PYTHONPATH [PATH_TO_PYTHONPATH]
setenv LD_LIBRARY_PATH [PATH_TO_LD_LIBRARY_PATH]
setenv OPENMM_CUDA_COMPILER [PATH_TO_OPENMM_CUDA_COMPILER]

#cd $SLURM_SUBMIT_DIR

# Production
set cnt = 1
set cntmax = 3000
set irun = 0
set irunmax = 50 # maximum cycle

if (${systype} == 'solution') then
    set init = step3_input
    set equi_prefix = step4_equilibration
    set prod_prefix = step5_production
    set prod_step   = step5
else if (${systype} == 'membrane') then
    set init = step5_input
    set equi_prefix = step6.6_equilibration
    set prod_prefix = step7_production
    set prod_step   = step7
endif

while (${cnt} <= ${cntmax})
    @ pcnt = ${cnt} - 1
    set istep = ${prod_step}_${cnt}
    set pstep = ${prod_step}_${pcnt}
    if (${cnt} == 1) set pstep = ${equi_prefix}

    if (! -e ${istep}.dcd) then
        ${python} -u openmm_run.py -i ${prod_prefix}.inp -t toppar.str -p ${init}.psf -c ${init}.crd -irst ${pstep}.rst -orst ${LOCAL}/${istep}.rst -odcd ${LOCAL}/${istep}.dcd | tee ${LOCAL}/${istep}.out > /dev/null
	@ irun += 1
	cp ${LOCAL}/${istep}.* [PATH_TO_REPLICA_FOLDER]
	echo $irun
    endif
    if (! -e ${istep}.dcd) exit
    if ($irun == $irunmax) then
	sbatch -J [JOBNAME] --export=systype=membrane run_prod-2080.slurm
	exit
    endif
    @ cnt += 1
end

