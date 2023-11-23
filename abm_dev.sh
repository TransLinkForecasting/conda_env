############################
# ABM Development
############################
mamba remove -y --name abm_dev --all
# create development environment with asim dependencies installed (base, test, estimation, and notebooks)
mamba create -y -n abm_dev -c conda-forge --override-channels python=3.9 "cytoolz>=0.8.1" "numba>=0.55.2" "numpy>=1.16.1" "openmatrix>=0.3.4.1" "orca>=1.6" "pandas>=1.1.0,<1.5" "psutil>=4.1" "pyarrow>=2.0" "pypyr>=5.3" "pyyaml>=5.1" "requests>=2.7" "scikit-learn>=1.1" "sharrow>=2.5" "simwrapper>1.7" "pytables>=3.5.1" "xarray>=0.21" larch statsmodels pytest pytest-cov coveralls pycodestyle pytest-regressions jupyterlab matplotlib descartes pandasql scipy seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn-intelex yapf pip ipykernel
# activate environment
mamba activate abm_dev
# # install activitysim
# pip install "activitysim==1.2.1" --upgrade
# optionally, override old versions of activitysim with development version
pip install https://github.com/TransLinkForecasting/conda_env/raw/master/source/activitysim/activitysim-1.2.2.dev8+g2155b0b4-py3-none-any.whl --upgrade
# # install populationsim latest, dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
# pip install source/popsim/populationsim-0.5.1.zip --upgrade
# or install development version of populationsim
pip install git+https://github.com/TransLinkForecasting/populationsim@master --upgrade
# additional mamba packages, note:
# - mord and pylogit - are for modeling
# - contextily folium branca cycler kiwisolver - are for GIS
mamba install -y -n abm_dev -c conda-forge --override-channels mord=0.6 pylogit=1.0.1 contextily folium branca cycler kiwisolver
# choice models
pip install biogeme==3.2.11
# cryptography
pip install CryptPandas==1.0.0
# dash
pip install plotly==5.15.0
pip install dash==2.10.2
pip install dash-extensions==1.0.1
pip install dash-leaflet==0.1.23
# tlpytools latest
pip install tlpytools --upgrade
pip install --upgrade 'sqlalchemy<2.0'
# ipython kernel
ipython kernel install --user --name=abm_dev
# pip install jupyter_contrib_nbextensions
# export environment
mamba env export -n abm_dev -f abm_dev.yml --no-builds
# install geopandas precompiled wheels
setx GDAL_VERSION "3.3.3"
pip install source/gpd/GDAL-3.3.3-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Shapely-1.8.0-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Fiona-1.8.20-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/pyproj-3.3.0-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/geopandas-0.10.2-py2.py3-none-any.whl --upgrade
pip install source/gpd/Rtree-0.9.7-cp39-cp39-win_amd64.whl --upgrade
# pip install source/gpd/rasterio-1.2.10-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Cartopy-0.20.1-cp39-cp39-win_amd64.whl --upgrade
# deactivate environment
mamba deactivate
