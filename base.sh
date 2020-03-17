# Anaconda 2020.02
conda activate base
pip install --upgrade autopep8==1.4.4
pip install jupyter_contrib_nbextensions==0.4.0
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main
jupyter nbextension enable code_prettify/autopep8
jupyter nbextension enable execute_time/ExecuteTime
conda env export -n base -f base.yml
