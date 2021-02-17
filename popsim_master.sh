# PopulationSim latest
conda create -y -n popsim_master python=3.7.6 pandas=1.0.2 numpy=1.18.1 scipy=1.4.1 matplotlib=3.1.3 seaborn=0.10.0 pyodbc=4.0.30 sqlalchemy=1.3.15 autopep8==1.5.4 xlrd xlsxwriter sympy nose scikit-learn pip ipykernel
conda activate popsim_master
conda install -y pytables=3.6.1
conda install -y -c conda-forge mkl-service
pip install toolz
pip install zbox
pip install orca
pip install openmatrix
pip install activitysim>=0.9.2
pip install ortools<=7.5
pip install future >= 0.16.0
# release binary: https://github.com/ActivitySim/populationsim/releases
# dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
pip install source/populationsim-0.4.3.zip
pip install ipfn==1.4.0
ipython kernel install --user --name=popsim_master
conda env export -n popsim_master -f popsim_master.yml
conda deactivate
