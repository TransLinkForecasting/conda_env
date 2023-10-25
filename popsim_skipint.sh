# PopulationSim 698058b with skip integerize for survey reweighting in Trip Diary 2017
mamba create -y -n popsim_skipint python=2.7.16
mamba activate popsim_skipint
mamba install -y pytables
pip install toolz
pip install zbox
pip install orca
pip install openmatrix
pip install ortools
#pip install https://github.com/RSGInc/populationsim/zipball/skip_integerization
pip install source/popsim/RSGInc-populationsim-698058b.zip
mamba env export -n popsim_skipint -f popsim_skipint.yml
mamba deactivate
