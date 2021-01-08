# Miniconda3-py38_4.9.2 from https://repo.anaconda.com/miniconda/
conda activate base
pip install --upgrade pip
pip install --upgrade jupyter==1.0.0
pip install --upgrade autopep8==1.5.4
pip install --upgrade jupyter_contrib_nbextensions==0.5.1
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main
jupyter nbextension enable code_prettify/autopep8
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable comment-uncomment/main
conda env export -n base -f base.yml
