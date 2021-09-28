# TL Python 3.8 2021-07
conda remove -y --name tlpy3 --all
conda create -y -n tlpy3 python=3.8.10 pandas=1.1.0 numpy=1.18.1 scipy matplotlib seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex pyyaml yapf pip ipykernel
conda activate tlpy3
# cryptography
pip install CryptPandas==0.1.1
ipython kernel install --user --name=tlpy3
conda env export -n tlpy3 -f tlpy3.yml
conda deactivate
jupyter kernelspec list
