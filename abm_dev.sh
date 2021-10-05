# PopulationSim Python 3.8 2021-07
# Last Updated on 2021-09-29 for population_sythesis 0.1.0
conda remove -y --name abm_dev --all
conda create -y -n abm_dev python=3.8.10 pandas=1.1.0 numpy=1.18.1 scipy matplotlib seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex pyyaml yapf pip ipykernel
conda activate abm_dev
# tlpytools latest
pip install source/tlpytools/tlpytools-0.1.0-py3-none-any.whl --upgrade --force-reinstall
# populationsim latest
conda install -y pytables
pip install activitysim==0.9.9.1
# release binary: https://github.com/ActivitySim/populationsim/releases
# dependencies: https://github.com/ActivitySim/populationsim/blob/master/setup.py
pip install source/popsim/populationsim-0.5.1.zip --upgrade
# # statsmodels pypi stable
# pip install statsmodels==0.12.2
# # statsmodels v0.13.0.dev0 (+686) - building from git requires c++ build tool
# pip install git+https://github.com/statsmodels/statsmodels.git@v0.13.0.dev0 --upgrade
# # statsmodels v0.13.0.dev0 (+686) from nightly channel
# pip install -i https://pypi.anaconda.org/scipy-wheels-nightly/simple statsmodels --upgrade
# statsmodels v0.13.0.dev0 (+686) from downloaded nightly channel wheel file (recommended)
pip install source/statsmodel/statsmodels-0.13.0.dev0+20201204182244_127.g36b7f5ddf-cp38-none-win_amd64.whl --upgrade
# ordinal models
pip install mord=0.6
# choice models
pip install biogeme=3.2.8
pip install pylogit=1.0.1
# cryptography
pip install CryptPandas==0.1.1
# geopandas
setx GDAL_VERSION "3.3.1"
pip install source/gpd/GDAL-3.3.1-cp38-cp38-win_amd64.whl --upgrade
pip install source/gpd/Shapely-1.7.1-cp38-cp38-win_amd64.whl --upgrade
pip install source/gpd/Fiona-1.8.20-cp38-cp38-win_amd64.whl --upgrade
pip install source/gpd/pyproj-3.1.0-cp38-cp38-win_amd64.whl --upgrade
pip install source/gpd/geopandas-0.9.0-py3-none-any.whl --upgrade
pip install source/gpd/Rtree-0.9.7-cp38-cp38-win_amd64.whl --upgrade
pip install source/gpd/rasterio-1.2.6-cp38-cp38-win_amd64.whl --upgrade
pip install source/gpd/Cartopy-0.19.0.post1-cp38-cp38-win_amd64.whl --upgrade
pip install contextily
pip install matplotlib cycler kiwisolver descartes
pip install seaborn folium branca scipy
# dash
pip install dash==1.20.0
pip install dash-leaflet==0.1.16
pip install dash-extensions==0.0.58
pip install jsbeautifier==1.14.0
ipython kernel install --user --name=abm_dev
conda env export -n abm_dev -f abm_dev.yml
conda deactivate
