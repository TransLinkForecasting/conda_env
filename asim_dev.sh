############################
# ABM Test Environment
# for ActivitySim Development
############################
conda remove -y --name asim_dev --all
# create development environment with asim dependencies installed (base, test, estimation, and notebooks)
# start of base environment packages
mamba env create -n asim_dev --file https://raw.githubusercontent.com/ActivitySim/activitysim/refs/tags/v1.4.0/conda-environments/activitysim-dev-base.yml
conda activate asim_dev
pip install sharrow==2.14.0
mkdir C:\asim_env
cd C:\asim_env
git clone https://github.com/driftlesslabs/activitysim.git --branch expression-profiling
python -m pip install -e ./activitysim
# tlpytools latest
pip install tlpytools "sqlalchemy<2.0" --upgrade
