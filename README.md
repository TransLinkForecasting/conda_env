# Conda Environments

This repository contains instructions to set up standard environments for working with various Analytics projects.

Each environment contains instructions to create a virtual environment and install all the relevant requirements and packages. The purpose of virtual environments is to standardize code versions across developers and to minimize version conflicts.

## Installations

In order to set up environments listed below, you will need to install both conda and uv.

### Set up uv

1. Download uv windows executable - [uv-x86_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.8.13/uv-x86_64-pc-windows-msvc.zip)
2. Move all files within the zip file downloaded (including `uv.exe`, `uvw.exe`, `uvx.exe`) into a new folder `C:\ProgramData\uv`
3. Add `C:\ProgramData\uv` to the system environment variable PATH.
4. Open a new command prompt and test the command `uv --help`

### Set up miniforge

1. Download miniforge windows installer - [Miniforge3-25.3.1-0-Windows-x86_64.exe](https://github.com/conda-forge/miniforge/releases/download/25.3.1-0/Miniforge3-25.3.1-0-Windows-x86_64.exe)
2. Install miniforge
    - For Developer Desktops, it is recommended to install in user folder for single user non-admin access: `%USERPROFILE%\AppData\Local\miniforge3`
    - For Production VMs and Servers, it is recommended to install in ProgramData directory for multi-user access:
    `C:\ProgramData\miniforge3`
3. Test and confirm installation
    - Open miniforge prompt, run `conda --help`
    - To add conda into regular command prompt, run `conda init`

## Base Distribution

The base distribution currently used is Miniforge 25.3.1-0 Python 3.12; you can obtain it from miniforge on GitHub (see the Installation section above). Note that while your base distribution is of a specific version of Python, you can create and build any version of Python for a specific conda environment. Mambaforge is a specific distribution of miniforge that uses a faster solver called mamba. It is an open source alternative to Anaconda. Similar to Conda/Anaconda, conda downloads and installs packages from conda package repositories.

If you have issues opening the miniforge installation file, you may need to click on properties of the exe file and check unblock.

## Getting started

To bump versions and then create a new build of the environment, run the bash (`.sh`) files for the corresponding environment. To install a current version of an environment, follow the instructions below to install each environment with yaml (`.yml`) files. 

First, you must clone a copy of this repository:
```bash
git clone --depth 1 https://github.com/TransLinkForecasting/conda_env.git
cd conda_env
```

Then, choose the environments you wish to install; the following environments are supported:

### base

Default Anaconda environment with jupyter notebook extensions. Install additional packages with the script below:

```bash
conda install -y ipykernel ipython ipython_genutils ipywidgets jupyter jupyter_client jupyter_console jupyter_core nbconvert nbformat notebook yapf
conda install -y conda-pack
pip install --user --upgrade jupyter_contrib_nbextensions
jupyter nbextension enable codefolding/main
jupyter nbextension enable code_prettify/yapf
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable comment-uncomment/main
```

### asim1_4_dev3471

Environment used for ABM development with ActivitySim, with installation managed by uv. Additional packages for general development will not be made available directly in this environment as the list of packages and their versions will be controlled by the ActivitySim package.

Packages can be added to this environment by running `uv add PACKAGE_NAME` once you are sourced into this environment, although this is not recommended for machines responsible for conducting production runs. A separate environment with additional packages is generally recommended.

```bash
cd %USERPROFILE%
git clone https://github.com/TransLinkForecasting/activitysim.git -b tl_dev --depth 1
cd activitysim
uv sync --no-editable
```

The ActivitySim python environment location will always be relative to where your activitysim source code is, and it may be different depending on your OS:
* on Windows, it should be in Scripts folder - `%USERPROFILE%/activitysim/.venv/Scripts/python.exe`
* on Linux, it should be in bin - `~/activitysim/.venv/bin/python`


#### editable install for ActivitySim

A typical installation of a Python package will not allow developers to debug or perform live updates on the source code of the package. In order to do this, an editable install can be done. Be mindful that any changes performed on the source (activitysim) package must be merged back into either the main repository in order for it to be available with regular installs, otherwise, a custom version of the package must always be used. As such, changes to the source code for an editable install should be done with care and communicated with other developers to avoid potential errors.

The default behavior of uv for ActivitySim version greater than v1.4 is to install with editable mode, but if you'd like to change the version of ActivitySim only, the following instructions will still work. To perform an editable install of a Python package, you must first clone the source code, in this case, for ActivitySim:

```
git clone -b main https://github.com/TransLinkForecasting/activitysim.git
```

Then within the cloned local directory, navigate to the correct environment and perform the editable install:

```
cd activitysim
conda activate asim1_4
pip install -e ./
```

After the install, you must not move your local ActivitySim directory. The source code within this directory will be used when calling ActivitySim, and any updates to the code within this directory will be reflected immediately in your environment.

#### previous versions of ActivitySim

**asim1_2**

Environment used for ABM development with ActivitySim, PopulationSim, and SciPy tools. This environment used to be called `abm_dev` and has been renamed to clearly refer to the ActivitySim version.

```bash
conda remove -y --name asim1_2 --all
conda env create -n asim1_2 -f asim1_2.yml
conda activate asim1_2
# install development version of activitysim (optional)
pip uninstall activitysim
pip install https://github.com/TransLinkForecasting/conda_env/raw/master/source/activitysim/activitysim-1.2.2.dev8+g2155b0b4-py3-none-any.whl --upgrade
# pip install git+https://github.com/TransLinkForecasting/activitysim@main --upgrade
# install development version of populationsim (required as of Sep 22, 2023)
pip uninstall populationsim
pip install git+https://github.com/TransLinkForecasting/populationsim@master --upgrade
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
ipython kernel install --user --name=asim1_2
```

### abm_spa

Environment used for SPA data processing:
```bash
conda remove -y --name abm_spa --all
conda env create -n abm_spa -f abm_spa.yml
conda activate abm_spa
ipython kernel install --user --name=abm_spa
```

### tlpy3

Common packages to work with SQL Server, charts and figures:
```bash
conda remove -y --name tlpy3 --all
conda env create -f tlpy3.yml
```

### tlgpd

Common packages plus geopandas to work with spatial files like shapefiles:
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

Survey weighting tool using populationsim with skip integer option enabled, based on Python 2.7. Used for Trip Diary 2017 and Evergreen Pre-Post Survey weighting:
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

To set up the package on a new machine, locate your miniconda or anaconda folder and unpack:
```bash
mkdir -p /dir/to/miniconda3/envs/my_env
tar -xzf my_env.tar.gz -C /dir/to/miniconda3/envs/my_env
cd /dir/to/miniconda3/envs/my_env
source my_env/bin/activate
conda-unpack
source my_env/bin/deactivate
```

## Deprecated Environments

The following are a list of environments no longer supported via this repository:

* `rtm_docs`: mkdocs to build rtm docs (deprecated from this repo, see requirements.txt attached to the rtmdoc repo)
