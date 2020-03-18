# PopulationSim 698058b with skip integerize
conda create -y -n popsim_skipint python=2.7.16
conda activate popsim_skipint
conda install -y pytables
pip install toolz
pip install zbox
pip install orca
pip install openmatrix
pip install ortools
#pip install https://github.com/RSGInc/populationsim/zipball/skip_integerization
pip install source/RSGInc-populationsim-698058b.zip
conda env export -n popsim_skipint -f popsim_skipint.yml
conda deactivate
