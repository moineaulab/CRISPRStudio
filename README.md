<img src="https://github.com/moineaulab/CRISPRStudio/blob/master/CRISPRStudio_logo.png" width="250">

# Introduction

CRISPRStudio is a program developed to facilitate and accelerate CRISPR array visualization. It works by first comparing spacers sequence homology in a dataset, then assigning a two-color-code to each cluster of spacers and finally writing an svg file, which can be opened in graphics vector editor.

# Installation

Simply download the CRISPRStudio python script (.py).

### Software requirements

The following dependencies are required by CRISPRStudio

- Local installation of fasta36 and mcl

fasta36 can be downloaded at http://faculty.virginia.edu/wrpearson/fasta/CURRENT/ (make sure that the folder with the executable was added in your path)

mcl can be downloaded at https://micans.org/mcl/ in the "License & Software" section, or through MacPorts:

```
sudo port install mcl
```

- The following python modules: BioPython, Scipy, Numpy, Fastcluster which can be installed through:

```
pip install biopython scipy numpy fastcluster
```

# Basic command

```
python CRISPRStudio_1.0.py -i test.gff
```

### Additional options

