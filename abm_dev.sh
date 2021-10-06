# ABM Development - Python 3.9 2021-10
# Last Updated on 2021-09-29 for population_sythesis 0.1.0
conda remove -y --name abm_dev --all
conda create -y -n abm_dev -c conda-forge --override-channels python=3.9 activitysim=1.0.3 larch=5.5.8 pytables pandas numpy scipy matplotlib seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex pyyaml yapf pip ipykernel
conda activate abm_dev
# populationsim latest, dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
pip install source/popsim/populationsim-0.5.1.zip --upgrade
# asim testing
conda install -y -n abm_dev -c conda-forge --override-channels pytest pytest-cov coveralls pycodestyle pytest-regressions
# asim extra packages
conda install -y -n abm_dev -c conda-forge --override-channels jupyterlab matplotlib geopandas descartes
# additional conda packages
conda install -y -n abm_dev -c conda-forge --override-channels mord=0.6 pylogit=1.0.1
# tlpytools latest
pip install source/tlpytools/tlpytools-0.1.0-py3-none-any.whl --upgrade --force-reinstall
# choice models
pip install biogeme==3.2.8
# # statsmodels pypi stable
# pip install statsmodels==0.12.2
# # statsmodels v0.13.0.dev0 (+686) - building from git requires c++ build tool
# pip install git+https://github.com/statsmodels/statsmodels.git@v0.13.0.dev0 --upgrade
# # statsmodels v0.13.0.dev0 (+686) from nightly channel
# pip install -i https://pypi.anaconda.org/scipy-wheels-nightly/simple statsmodels --upgrade
# statsmodels v0.13.0.dev0 (+686) from downloaded nightly channel wheel file (recommended)
pip install source/statsmodel/statsmodels-0.13.0.dev0+20201204182244_127.g36b7f5ddf-cp38-none-win_amd64.whl --upgrade
# cryptography
pip install CryptPandas==0.1.1
# dash
pip install dash==1.20.0
pip install dash-leaflet==0.1.16
pip install dash-extensions==0.0.58
pip install jsbeautifier==1.14.0
# ipython kernel
pip install ipython_genutils
ipython kernel install --user --name=abm_dev
conda env export -n abm_dev -f abm_dev.yml
conda deactivate
