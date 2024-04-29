############################
# ABM Development
############################
mamba remove -y --name abm_dev --all
# copy activitysim dev environment into our repo for records
curl -o activitysim-dev.yml https://raw.githubusercontent.com/ActivitySim/activitysim/main/conda-environments/activitysim-dev.yml
# review differences, and replace `-e ..` with `git+https://github.com/TransLinkForecasting/activitysim.git`
# copy this version, for github workflows, to `https://github.com/TransLinkForecasting/abm/blob/develop/ABM/Scripts/environments/conda-abm_dev.yml` 
mamba env create -n abm_dev --file=activitysim-dev.yml
# activate environment
mamba activate abm_dev
# # install populationsim latest, dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
# pip install source/popsim/populationsim-0.5.1.zip --upgrade
# or install development version of populationsim
pip install git+https://github.com/TransLinkForecasting/populationsim@master --upgrade
# # install activitysim
# pip install "activitysim==1.2.1" --upgrade
# optionally, override old versions of activitysim with development version
pip install git+https://github.com/TransLinkForecasting/activitysim.git --upgrade
# install additional mamba packages, note:
# - mord and pylogit - are for modeling
# - contextily folium branca cycler kiwisolver - are for GIS
# - plotly dash are for graphing
mamba install -y -n abm_dev -c conda-forge --override-channels statsmodels matplotlib descartes pandasql scipy seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn-intelex pip ipykernel mord pylogit contextily folium branca cycler kiwisolver plotly dash dash-extensions dash-leaflet
# choice models
pip install biogeme==3.2.11
# cryptography
pip install CryptPandas==1.0.1
# tlpytools latest
pip install tlpytools --upgrade
# ipython kernel
ipython kernel install --user --name=abm_dev
# pip install jupyter_contrib_nbextensions
# export environment
mamba env export -n abm_dev -f abm_dev.yml --no-builds
mamba deactivate
