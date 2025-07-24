############################
# ABM Production Environment
# with ActivitySim v1.3.4
############################
conda remove -y --name asim1_3 --all
# create development environment with asim dependencies installed (base, test, estimation, and notebooks)
# start of base environment packages
mamba env create -n asim1_3 --file https://raw.githubusercontent.com/ActivitySim/activitysim/refs/tags/v1.3.4/conda-environments/activitysim-dev-base.yml
conda activate asim1_3
pip install sharrow==2.14.0
pip install activitysim==1.3.4
# tlpytools latest
pip install tlpytools "sqlalchemy<2.0" --upgrade
### stop here if environment is intended for running activitysim only

# packages for testing
conda install -y pytest pytest-cov coveralls black flake8 pytest-regressions -c conda-forge --override-channels -n asim1_3
# packages for building documentation
conda install -y sphinx numpydoc sphinx_rtd_theme==1.2 -c conda-forge --override-channels -n asim1_3
# packages for estimation integration
conda install -y larch -c conda-forge --override-channels -n asim1_3
# packages for example notebooks
conda install -y jupyterlab matplotlib geopandas descartes -c conda-forge --override-channels -n asim1_3
# install development version of populationsim
pip install git+https://github.com/TransLinkForecasting/populationsim@master --upgrade
# additional packages used by our team
conda install -y pandasql scipy seaborn pyodbc "sqlalchemy<2.0" openpyxl xlrd xlsxwriter sympy nose scikit-learn-intelex yapf pip ipykernel -c conda-forge --override-channels -n asim1_3
# additional GIS related packages, note:
# - mord and pylogit - are for modeling
# - contextily folium branca cycler kiwisolver - are for GIS
conda install -y -n asim1_3 -c conda-forge --override-channels contextily folium branca cycler kiwisolver
# # dash
# pip install plotly==5.15.0
# pip install dash==2.10.2
# pip install dash-extensions==1.0.1
# pip install dash-leaflet==0.1.23
# # additional packages
# pip install polyline==2.0.2
# ipython kernel
ipython kernel install --user --name=asim1_3
# pip install jupyter_contrib_nbextensions
# export environment
conda env export -n asim1_3 -f asim1_3.yml --no-builds
# # install geopandas precompiled wheels
# setx GDAL_VERSION "3.3.3"
# pip install source/gpd/GDAL-3.3.3-cp39-cp39-win_amd64.whl --upgrade
# pip install source/gpd/Shapely-1.8.0-cp39-cp39-win_amd64.whl --upgrade
# pip install source/gpd/Fiona-1.8.20-cp39-cp39-win_amd64.whl --upgrade
# pip install source/gpd/pyproj-3.3.0-cp39-cp39-win_amd64.whl --upgrade
# pip install source/gpd/geopandas-0.10.2-py2.py3-none-any.whl --upgrade
# pip install source/gpd/Rtree-0.9.7-cp39-cp39-win_amd64.whl --upgrade
# # pip install source/gpd/rasterio-1.2.10-cp39-cp39-win_amd64.whl --upgrade
# pip install source/gpd/Cartopy-0.20.1-cp39-cp39-win_amd64.whl --upgrade
# deactivate environment
conda deactivate
# resources
# https://docs.conda.io/projects/conda/en/stable/commands/env/create.html
