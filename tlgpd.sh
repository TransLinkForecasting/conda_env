# TL Geopandas Python 3.8 2021-07
conda remove -y --name tlgpd --all
conda create -y -n tlgpd python=3.8.10 pandas=1.1.0 numpy=1.18.1 scipy matplotlib seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex yaml yapf pip ipykernel
conda activate tlgpd
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
ipython kernel install --user --name=tlgpd
conda env export -n tlgpd -f tlgpd.yml
conda deactivate
