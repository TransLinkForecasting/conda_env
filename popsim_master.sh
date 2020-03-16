conda create -y -n popsim_master python=3.7 pandas=1.0 numpy pyodbc sqlalchemy ipykernel
conda activate popsim_master
conda install -y pytables
pip install toolz
pip install zbox
pip install orca
pip install openmatrix
pip install ortools
pip install activitysim==0.9.2
# https://github.com/ActivitySim/populationsim/releases
pip install source/populationsim-0.4.1.zip
pip install ipfn==1.3.0
ipython kernel install --user --name=popsim_master
conda env export -n popsim_master -f popsim_master.yml
conda deactivate
