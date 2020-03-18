# PopulationSim latest
conda create -y -n popsim_master python=3.7.6 pandas=1.0.2 numpy=1.18.1 scipy=1.4.1 matplotlib=3.1.3 seaborn=0.10.0 pyodbc=4.0.30 sqlalchemy=1.3.15 xlrd xlsxwriter sympy nose scikit-learn pip ipykernel
conda activate popsim_master
conda install -y pytables=3.6.1
pip install --upgrade autopep8==1.4.4
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
