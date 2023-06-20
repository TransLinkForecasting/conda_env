mamba install -n base -c defaults conda anaconda-client
mamba env create TMIP/EMAT
mamba activate EMAT
ipython kernel install --user --name=EMAT
mamba env export -n EMAT -f EMAT.yml
mamba deactivate
