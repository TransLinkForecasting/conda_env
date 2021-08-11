# Based on Miniconda3-py38_4.10.3
conda activate base
pip install --upgrade --user pip
conda install -y ipykernel ipython ipython_genutils ipywidgets jupyter jupyter_client jupyter_console jupyter_core nbconvert nbformat notebook yapf
pip install --user --upgrade jupyter_contrib_nbextensions
jupyter nbextension enable codefolding/main
jupyter nbextension enable code_prettify/yapf
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable comment-uncomment/main
conda env export -n base -f base.yml
