# TL Python 3.9 2021-11
conda remove -y --name tlpy3 --all
conda create -y -n tlpy3 python=3.9 pandas numpy scipy matplotlib seaborn pyodbc sqlalchemy openpyxl xlrd xlsxwriter sympy nose scikit-learn scikit-learn-intelex pyyaml yapf pip ipykernel
conda activate tlpy3
# cryptography
pip install CryptPandas==0.1.1
ipython kernel install --user --name=tlpy3
conda env export -n tlpy3 -f tlpy3.yml
conda deactivate
jupyter kernelspec list
