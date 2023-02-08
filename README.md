# Conda Environments

This repository contains instruction to set up standard environments for working with various Analytics projects.

Each environment contains instruction to create a virtual environment, and install all the relevant requirements and packages. The purpose of virtual environments is to standardize code  version across developers and to minimize version conflicts.

## Base Distribution

The base version of Miniconda is 4.10.3 with Python 3.8, you can obtain it from [Anaconda.com](https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Windows-x86_64.exe). Note that while your base distribution is of a specific version of python, you can create and build any version of python for a specific conda environment.

## Getting started

To bump versions and then create a new build of the environment, run the bash (`.sh`) files for a corresponding environment. To install a current version of an environment, follow the instruction below to install each environment with yaml (`.yml`) files. 

First, you must clone a copy of this repository
```bash
git clone --depth 1 https://github.com/TransLinkForecasting/conda_env.git
cd conda_env
```

Then, choose the environments you wish to install; the following environments are supported:

### base

Default Anaconda environment with jupyter notebook extension, install additional packages with script below.
```bash
conda install -y ipykernel ipython ipython_genutils ipywidgets jupyter jupyter_client jupyter_console jupyter_core nbconvert nbformat notebook yapf
conda install -y conda-pack
pip install --user --upgrade jupyter_contrib_nbextensions
jupyter nbextension enable codefolding/main
jupyter nbextension enable code_prettify/yapf
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable comment-uncomment/main
```

### abm_dev

Latest ABM development tools with populationsim and more
```bash
conda remove -y --name abm_dev --all
conda env create -n abm_dev -f abm_dev.yml
conda activate abm_dev
# optionally, override old versions of activitysim with development version
pip install source/activitysim/activitysim-1.2.1.dev8+gd876d08c-py3-none-any.whl --upgrade
# install geopandas and its dependencies
setx GDAL_VERSION "3.3.3"
pip install source/gpd/GDAL-3.3.3-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Shapely-1.8.0-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Fiona-1.8.20-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/pyproj-3.3.0-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/geopandas-0.10.2-py2.py3-none-any.whl --upgrade
pip install source/gpd/Rtree-0.9.7-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/rasterio-1.2.10-cp39-cp39-win_amd64.whl --upgrade
pip install source/gpd/Cartopy-0.20.1-cp39-cp39-win_amd64.whl --upgrade
ipython kernel install --user --name=abm_dev
```

#### editable install for ActivitySim

A typical installation of Python Package will not allow developers to debug or perform live update on the source code of the package. In order to do this, a editable install can be done. Be mindful that any changes performed on the source (activitysim) package must be merged back into either the main repository in order for it to be available with regular installs, otherwise, a custom version of the package must always be used. As such, changes to the source code for an editable install should be done with care and be communicated with other developers to avoid potential errors.

To perform an editable install of a python package, you must first clone the source code, in this case, for activitysim:

```
git clone -b main https://github.com/TransLinkForecasting/activitysim.git
```

Then within the cloned local directory, navigate to the correct environment and perform the editable install:

```
cd activitysim
conda activate abm_dev
pip install -e ./
```

After the install, you must not move your local activitysim directory. The source code within this directory will be used when calling activitysim, and any updates to the code within this directory will be reflected immediately in your environment.


### abm_spa

Environment used for SPA data processing
```bash
conda remove -y --name abm_spa --all
conda env create -n abm_spa -f abm_spa.yml
conda activate abm_spa
ipython kernel install --user --name=abm_spa
```

### tlpy3

common packages to work with SQL Server, charts and figures
```bash
conda remove -y --name tlpy3 --all
conda env create -f tlpy3.yml
```

### tlgpd

common packages plus geopandas to work with spatial files like shape files
```bash
conda remove -y --name tlgpd --all
conda create -y -n tlgpd python=3.9.7 pip
conda activate tlgpd
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
conda env update --file tlgpd.yml
```

### popsim_skipint

survey weighting tool using populationsim with skip integer option enabled, based on Python 2.7. Used for Trip Diary 2017 and Evergreen Pre-Post Survey weighting.
```bash
conda create -y -n popsim_skipint python=2.7.16 pip
pip install source/popsim/RSGInc-populationsim-698058b.zip
conda env update --file popsim_skipint.yml
```

### emat_tmip

Environment based on `TMIP/EMAT`. No version-fixed yaml needed.
```bash
conda install -n base -c defaults conda anaconda-client
conda env create TMIP/EMAT
conda activate EMAT
ipython kernel install --user --name=EMAT
conda env export -n EMAT -f EMAT.yml
conda deactivate
```

Learn more about conda environments here: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html

## Building conda-pack for offline access

[Conda-pack](https://conda.github.io/conda-pack/) is a tool for creating archives of conda environments which can then be distributed on offline systems.

To package a conda environment, run the conda-pack command in your base environment:
```bash
conda install conda-pack
conda pack -n my_env -o ./source/conda_pack/my_env.tar.gz
```

To set up the package in a new machine, locate your miniconda or ananconda folder and unpack:
```bash
mkdir -p /dir/to/miniconda3/envs/my_env
tar -xzf my_env.tar.gz -C /dir/to/miniconda3/envs/my_env
cd /dir/to/miniconda3/envs/my_env
source my_env/bin/activate
conda-unpack
source my_env/bin/deactivate
```

## Deprecated Environments

Following are a list of environments no longer supported via this repository:

* `rtm_docs`: mkdocs to build rtm docs (deprecated from this repo, see requirements.txt attached to the rtmdoc repo)
