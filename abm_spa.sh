############################
# Population Synethsis
############################
mamba remove -y --name abm_spa --all
mamba create -y -n abm_spa -c conda-forge --override-channels python=3.7 "cytoolz>=0.8.1" "numba>=0.55.2" "numpy>=1.16.1,<1.21" "openmatrix>=0.3.4.1" "orca>=1.6" "pandas>=1.1.0,<1.5" "psutil>=4.1" "pyarrow>=2.0" "pypyr>=5.3" "pyyaml>=5.1" "requests>=2.7" "scikit-learn" "simwrapper>1.7" "pytables>=3.5.1" "xarray" larch statsmodels pytest pytest-cov coveralls pycodestyle pytest-regressions jupyterlab matplotlib descartes pandasql scipy seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn-intelex yapf pip ipykernel
mamba activate abm_spa
pip install activitysim==1.1.0
pip install git+https://github.com/TransLinkForecasting/populationsim@master --upgrade
# ipython kernel
ipython kernel install --user --name=abm_spa
# export environment
mamba env export -n abm_spa -f abm_spa.yml --no-builds
# deactivate environment
mamba deactivate