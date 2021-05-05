# TL Geopandas Python 3.7
#
#1. install vs build tool
#vs_buildtools__1242544074.1534191569.exe
#2. install GDAL for windows - follow instructions carefully
#https://sandbox.idre.ucla.edu/sandbox/tutorials/installing-gdal-for-windows
#http://www.gisinternals.com/release.php
#https://www.lfd.uci.edu/~gohlke/pythonlibs/
#[gdal-300-1900-x64-core.msi]
#3. install python binding for GDAL - install in your anaconda installation's specific \envs\ tlgpd folder
#[GDAL-3.0.2.win-amd64-py3.7.msi]
#
conda remove --name tlgpd --all
conda create -y -n tlgpd python=3.7 pip
conda activate tlgpd
conda install -y ipykernel
pip install --upgrade autopep8==1.4.4
setx GDAL_VERSION "3.0.4"
pip install source/GDAL-3.0.4-cp37-cp37m-win_amd64.whl --upgrade
pip install source/Shapely-1.7.0-cp37-cp37m-win_amd64.whl --upgrade
pip install source/Fiona-1.8.13-cp37-cp37m-win_amd64.whl --upgrade
pip install source/pyproj-2.5.0-cp37-cp37m-win_amd64.whl --upgrade
pip install source/Rtree-0.9.4-cp37-cp37m-win_amd64.whl --upgrade
pip install source/geopandas-0.7.0-py3-none-any.whl --upgrade
pip install source/rasterio-1.1.3-cp37-cp37m-win_amd64.whl --upgrade
pip install source/Cartopy-0.17.0-cp37-cp37m-win_amd64.whl --upgrade
#pip install geopandas==0.7.0
pip install contextily
pip install matplotlib cycler kiwisolver descartes
pip install seaborn folium branca scipy
pip install xlrd xlsxwriter
ipython kernel install --user --name=tlgpd
conda env export -n tlgpd -f tlgpd.yml
conda deactivate
