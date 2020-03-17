conda remove --name tlpy37 --all
conda create -y -n tlpy37 python=3.7.6 matplotlib=3.2.0 seaborn=0.10.0 scipy=1.3.1 pyodbc=4.0.30 sqlalchemy=1.3.15 numpy=1.18.1 pandas=1.0.2 sympy=1.5.1 nose=1.3.7 pip=20.0.2 ipykernel
conda activate tlpy37
pip install --upgrade autopep8==1.4.4
ipython kernel install --user --name=tlpy37
conda env export -n tlpy37 -f tlpy37.yml
## create or update from environment file
#conda env create -n conda-env -f tlpy37.yml
conda deactivate
jupyter kernelspec list
