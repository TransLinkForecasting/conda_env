conda remove --name tlpy37 --all
conda create -y -n tlpy37 python=3.7.4 pip=20.0.2 scipy=1.3.1 pyodbc=4.0.27 sqlalchemy numpy pandas sympy nose ipykernel matplotlib==3.0.3 seaborn=0.9.0
conda activate tlpy37
ipython kernel install --user --name=tlpy37
conda env export -n tlpy37 -f tlpy37.yml
## create or update from environment file
#conda env create -n conda-env -f tlpy37.yml
conda deactivate
jupyter kernelspec list
