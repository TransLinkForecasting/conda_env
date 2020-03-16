# Anaconda Environments

This repository contains instruction to set up standard environments for working with various Analytics projects.

Each environment contains instruction to create a virtual environment, and install all the relevant requirements and packages. The purpose of virtual environments is to standardize code  version across developers and to minimize version conflicts.

## Base Anaconda

The current Anaconda version is 2020.02, you can obtain it from [Anaconda.com](https://repo.anaconda.com/archive/Anaconda3-2020.02-Windows-x86_64.exe).

## List of environments

We currently supported the following environments. You can find instruction to install in the `.sh` files with corresponding environment name. The `.yml` file contains a list of package names and versions to help replicate environment set up. 

* `base`: default Anaconda environment with jupyter notebook extension
* `tlpy37`: common packages to work with SQL Server, data frames, charts and figures
* `tlgpd`: geopandas to work with spatial files like shape files
* `rtm_docs`: mkdocs to build rtm docs
* `popsim_master`: latest population synthesis tool
* `popsim_skipint`: population synthesis tool used for survey weighting, used for Trip Diary 2017

Learn more about conda environments here: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
