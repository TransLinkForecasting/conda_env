# TL Geopandas Python 3.8 2021-07
mamba remove -y --name tlgpd --all
mamba create -y -n tlgpd python=3.9 pandas numpy scipy matplotlib seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex pyyaml yapf pip ipykernel
mamba activate tlgpd
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
# install graphing packages
pip install contextily
pip install matplotlib cycler kiwisolver descartes
pip install seaborn folium branca scipy
# dash
pip install dash==1.20.0
pip install dash-leaflet==0.1.16
pip install dash-extensions==0.0.58
pip install jsbeautifier==1.14.0
ipython kernel install --user --name=tlgpd
mamba env export -n tlgpd -f tlgpd.yml
mamba deactivate
