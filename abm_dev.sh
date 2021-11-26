# ABM Development - Python 3.9 2021-11
# Last Updated on 2021-09-29 for population_sythesis 0.1.0
conda remove -y --name abm_dev --all
conda create -y -n abm_dev -c conda-forge --override-channels python=3.9 activitysim=1.0.4 larch pytables pandas numpy scipy matplotlib seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex pyyaml yapf pip ipykernel
conda activate abm_dev
# tlpytools latest
pip install source/tlpytools/tlpytools-0.1.0-py3-none-any.whl --upgrade --force-reinstall
# populationsim latest, dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
pip install source/popsim/populationsim-0.5.1.zip --upgrade
# asim testing
conda install -y -n abm_dev -c conda-forge --override-channels pytest pytest-cov coveralls pycodestyle pytest-regressions
# asim extra packages
conda install -y -n abm_dev -c conda-forge --override-channels jupyterlab matplotlib geopandas descartes
# additional conda packages
conda install -y -n abm_dev -c conda-forge --override-channels mord=0.6 pylogit=1.0.1
# choice models
pip install biogeme==3.2.8
# statsmodels pypi stable
pip install statsmodels==0.13.0
# opionally, from nightly: https://anaconda.org/scipy-wheels-nightly/statsmodels/files
# cryptography
pip install CryptPandas==0.1.1
# dash
pip install plotly==5.3.1
pip install dash==2.0.0
pip install dash-leaflet
pip install dash-extensions
pip install jsbeautifier
# ipython kernel
ipython kernel install --user --name=abm_dev
conda env export -n abm_dev -f abm_dev.yml
conda deactivate
