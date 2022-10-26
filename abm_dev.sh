# ABM Development - Python 3.9 2022-10
conda remove -y --name abm_dev --all
# create development environment with asim dependencies installed (base, test, estimation, and notebooks)
conda create -y -n abm_dev -c conda-forge --override-channels python=3.9 "cytoolz>=0.8.1" "numpy>=1.16.1,<=1.21" "pandas>=1.1.0" "psutil>=4.1" "pyarrow>=2.0" "numba>0.51.2" "pytables>=3.5.1,<3.7" "pyyaml>=5.1" "openmatrix>=0.3.4.1" "requests>=2.7" larch pytest pytest-cov coveralls pycodestyle pytest-regressions jupyterlab matplotlib descartes pandasql scipy seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex yapf black pip ipykernel
# activate environment
conda activate abm_dev
# install activitysim
pip install activitysim==1.1.3 --upgrade
# tlpytools latest
pip install tlpytools --upgrade
# populationsim latest, dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
pip install source/popsim/populationsim-0.5.1.zip --upgrade
# additional conda packages, note:
# - mord and pylogit - are for modeling
# - contextily folium branca cycler kiwisolver - are for GIS
conda install -y -n abm_dev -c conda-forge --override-channels mord=0.6 pylogit=1.0.1 contextily folium branca cycler kiwisolver
# choice models
pip install biogeme==3.2.8
# statsmodels pypi stable
pip install statsmodels==0.13.2
# opionally, from nightly: https://anaconda.org/scipy-wheels-nightly/statsmodels/files
# cryptography
pip install CryptPandas==1.0.0
# dash
pip install plotly==5.10.0
pip install dash==2.6.2
pip install dash-extensions
pip install dash-leaflet
# ipython kernel
ipython kernel install --user --name=abm_dev
# export environment
conda env export -n abm_dev -f abm_dev.yml
# install geopandas precompiled wheels
setx GDAL_VERSION "3.3.3"
pip install source/gpd/GDAL-3.3.3-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Shapely-1.8.0-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Fiona-1.8.20-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/pyproj-3.3.0-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/geopandas-0.10.2-py2.py3-none-any.whl --upgrade
pip install source/gpd/Rtree-0.9.7-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/rasterio-1.2.10-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Cartopy-0.20.1-cp39-cp39-win_amd64.whl --upgrade
# deactivate environment
conda deactivate
