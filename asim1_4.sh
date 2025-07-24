############################
# ABM Production Environment
# with ActivitySim v1.4.0
############################
conda remove -y --name asim1_4 --all
# create development environment with asim dependencies installed (base, test, estimation, and notebooks)
# start of base environment packages
mamba env create -n asim1_4 --file https://raw.githubusercontent.com/ActivitySim/activitysim/refs/tags/v1.4.0/conda-environments/activitysim-dev-base.yml
conda activate asim1_4
pip install sharrow==2.14.0
pip install activitysim==1.4.0
# tlpytools latest
pip install tlpytools "sqlalchemy<2.0" --upgrade
### stop here if environment is intended for running activitysim only