# mkdocs for RTM Docs
conda remove --name rtm_docs --all
conda create -y -n rtm_docs -c conda-forge python=3.6 pip=19.2.3 mkdocs==1.0.4
conda activate rtm_docs
conda env export -n rtm_docs -f rtm_docs.yml
conda deactivate
