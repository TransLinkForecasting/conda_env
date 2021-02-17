# Based on Miniconda3-py37_4.8.3
conda activate base
pip install --upgrade pip
conda install -y ipykernel=4.10.0 ipython=7.9.0 ipython_genutils=0.2.0 ipywidgets=7.4.2 jupyter=1.0.0 jupyter_client=5.3.4 jupyter_console=6.0.0 jupyter_core=4.6.1 nbconvert=5.4.1 nbformat==4.4.0 notebook=6.0.2 autopep8=1.5.4
pip install --upgrade jupyter_contrib_nbextensions==0.5.1
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main
jupyter nbextension enable code_prettify/autopep8
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable comment-uncomment/main
conda env export -n base -f base.yml
