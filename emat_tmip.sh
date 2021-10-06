
# for miniconda only
conda install -n base -c defaults conda anaconda-client
conda env create TMIP/EMAT
conda activate EMAT
ipython kernel install --user --name=EMAT
conda env export -n EMAT -f EMAT.yml
conda deactivate
