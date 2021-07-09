# PopulationSim latest
conda remove --name popsim_master --all
conda create -y -n popsim_master python=3.8 autopep8==1.5.4 pandas=1.1.0 numpy=1.18.1 scipy matplotlib seaborn pyodbc sqlalchemy xlrd xlsxwriter sympy nose scikit-learn pip ipykernel
conda activate popsim_master
conda install -y pytables
pip install activitysim==0.9.9.1
# release binary: https://github.com/ActivitySim/populationsim/releases
# dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
pip install source/populationsim-0.5.zip
pip install CryptPandas==0.1.1
pip install statsmodels==0.12.2
pip install openyxl==3.0.7
ipython kernel install --user --name=popsim_master
conda env export -n popsim_master -f popsim_master.yml
conda deactivate
