# Anaconda 2020.02
conda activate base
pip install --upgrade autopep8==1.4.4
pip install jupyter_contrib_nbextensions==0.4.0
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main
