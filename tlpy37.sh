# TL Python 3.7
conda create -y -n tlpy37 python=3.7.6 pandas=1.0.2 numpy=1.18.1 scipy=1.4.1 matplotlib=3.1.3 seaborn=0.10.0 pyodbc=4.0.30 sqlalchemy=1.3.15 xlrd xlsxwriter sympy nose scikit-learn pip ipykernel
conda activate tlpy37
pip install --upgrade autopep8==1.4.4
ipython kernel install --user --name=tlpy37
conda env export -n tlpy37 -f tlpy37.yml
conda deactivate
jupyter kernelspec list
