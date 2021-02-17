
# for miniconda only
conda install -n base -c defaults conda anaconda-client
conda env create TMIP/EMAT
conda activate EMAT
ipython kernel install --user --name=popsim_master
conda env export -n popsim_master -f popsim_master.yml
conda deactivate
