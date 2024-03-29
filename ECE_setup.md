# ECE Cluster

More on [https://cmu-enterprise.atlassian.net/wiki/spaces/ITS/pages/2332131370/ECE+Community+Compute+Clusters]

prompts for password
```
ssh vashistt@ece005.ece.local.cmu.edu  # smaller gpu should do 
```

if you need bigger
```
ssh vashistt@ece013.ece.local.cmu.edu
```

- how to get extra storage
```
aklog ece.cmu.edu
cd /afs/ece.cmu.edu/usr/vashistt
```

- setting up conda 
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh bash Miniconda3-latest-Linux-x86_64.sh

nano ~/.bashrc

export PATH="/afs/ece.cmu.edu/usr/vashistt/miniconda3/bin:$PATH"

source ~/.bashrc

conda init

conda --version
```

- saving git 
  ```
git config --global credential.helper manager
  ```