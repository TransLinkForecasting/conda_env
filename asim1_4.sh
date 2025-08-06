############################
# ABM Production Environment
# with ActivitySim v1.4.0
############################
conda remove -y --name asim1_4 --all
# create development environment with asim dependencies installed (base, test, estimation, and notebooks)
# # clone development versions of activitysim and sharrow (optional)
# git clone -b v2.14.0 https://github.com/ActivitySim/sharrow.git
# git clone -b v1.4.0 https://github.com/ActivitySim/activitysim.git
# build conda environment
# https://raw.githubusercontent.com/ActivitySim/activitysim/refs/tags/v1.4.0/conda-environments/activitysim-dev-base.yml
curl -o asim1_4-base.yml -O https://raw.githubusercontent.com/ActivitySim/activitysim/refs/tags/v1.4.0/conda-environments/activitysim-dev-base.yml
conda remove -y --name asim1_4 --all
conda env create -n asim1_4 --file asim1_4-base.yml
conda activate asim1_4
# # optionally - install development versions of activitysim
# cd %USERPROFILE%/.conda
# mkdir asim1_4_release
# cd asim1_4_release
# git clone -b v2.14.0 https://github.com/ActivitySim/sharrow.git
# git clone -b v1.4.0 https://github.com/ActivitySim/activitysim.git
# python -m pip install -e ./sharrow
# python -m pip install -e ./activitysim

# tlpytools latest
pip install tlpytools "sqlalchemy<2.0" --upgrade
### stop here if environment is intended for running activitysim only

# packages for testing
conda install -y pytest pytest-cov coveralls black flake8 pytest-regressions -c conda-forge --override-channels -n asim1_4
# packages for building documentation
conda install -y sphinx numpydoc sphinx_rtd_theme -c conda-forge --override-channels -n asim1_4
# packages for estimation integration (should not require additional packages)
conda install -y larch -c conda-forge --override-channels -n asim1_4
# packages for example notebooks (should not require additional packages)
conda install -y jupyterlab matplotlib geopandas descartes -c conda-forge --override-channels -n asim1_4
# install development version of populationsim (optional)
pip install git+https://github.com/TransLinkForecasting/populationsim@master --upgrade

# additional packages used by our team
conda install -y pandasql scipy seaborn pyodbc "sqlalchemy<2.0" openpyxl xlrd xlsxwriter sympy nose scikit-learn-intelex yapf pip ipykernel -c conda-forge --override-channels -n asim1_4

# additional GIS related packages, note:
# - mord and pylogit - are for modeling
# - contextily folium branca cycler kiwisolver - are for GIS
conda install -y -c conda-forge --override-channels contextily folium branca cycler kiwisolver -n asim1_4
# dash
pip install plotly
pip install dash
pip install dash-extensions
pip install dash-leaflet
# additional packages
pip install polyline
# ipython kernel
ipython kernel install --user --name=asim1_4
# pip install jupyter_contrib_nbextensions
# export environment
conda export -n asim1_4 -f asim1_4-dev.yml --no-builds

# deactivate environment
conda deactivate
# resources
# https://docs.conda.io/projects/conda/en/stable/commands/env/create.html
