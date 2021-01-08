# mkdocs for RTM Docs
conda remove --name rtm_docs --all
conda create -y -n rtm_docs -c conda-forge python=3.6 pip=20.3.3 mkdocs==1.1.2
conda activate rtm_docs
conda env export -n rtm_docs -f rtm_docs.yml
conda deactivate
