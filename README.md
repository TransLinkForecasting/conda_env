# Conda Environments

This repository contains instruction to set up standard environments for working with various Analytics projects.

Each environment contains instruction to create a virtual environment, and install all the relevant requirements and packages. The purpose of virtual environments is to standardize code  version across developers and to minimize version conflicts.

## Base Distribution

The base version of Miniconda is 4.10.3 with Python 3.8, you can obtain it from [Anaconda.com](https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Windows-x86_64.exe).

## List of environments

We currently supported the following environments. You can find instruction to install in the `.sh` files with corresponding environment name. The `.yml` file contains a list of package names and versions to help replicate environment set up. 

* `base`: default Anaconda environment with jupyter notebook extension
* `tlpy3`: common packages to work with SQL Server, data frames, charts and figures
* `tlgpd`: common packages plus geopandas to work with spatial files like shape files
* `rtm_docs`: mkdocs to build rtm docs
* `popsim_master`: latest population synthesis tool, based on `tlgpd`
* `popsim_skipint`: population synthesis tool with skip integer option enabled for survey weighting, based on Python 2. Used for Trip Diary 2017 and Evergreen Pre-Post Survey weighting
* `EMAT`: environment based on `TMIP/EMAT`

Learn more about conda environments here: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
