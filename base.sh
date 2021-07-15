# Based on Miniconda3-py38_4.9.2
conda activate base
pip install --upgrade pip
conda install -y ipykernel=4.10.0 ipython=7.9.0 ipython_genutils=0.2.0 ipywidgets=7.4.2 jupyter=1.0.0 jupyter_client=5.3.4 jupyter_console=6.0.0 jupyter_core=4.6.1 nbconvert=5.4.1 nbformat==4.4.0 notebook=6.0.2 yapf=0.31.0
pip install --upgrade jupyter_contrib_nbextensions==0.5.1
jupyter nbextension enable codefolding/main
jupyter nbextension enable code_prettify/yapf
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable comment-uncomment/main
conda env export -n base -f base.yml
