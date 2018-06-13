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

### Parameters

```
-h  help message
-i  GFF3 file generated with CRISPRDetect (compulsory)
-l  generate the figure with a subset of isolates listed in the file (optional: by default, will generate a figure with all the strains)
-g  gray out unique spacers, so that only spacers present twice in the dataset remain colored (optional, by default will attribute a unique color for each cluster of spacer)
-f
-s
-r
-c
```

### Additional information

Link to CRISPRDetect:

-  online platform: http://brownlabtools.otago.ac.nz/CRISPRDetect/predict_crispr_array.html

-  repository for local installation: https://github.com/ambarishbiswas/CRISPRDetect_2.2

If you use the online platform, simply run the analysis, click on "Annotation file in GFF format" (top right section of the output), then copy and paste in a text editor to save on your computer.

If you use CRISPRDetect locally, make sure you adjust the -array_quality_score_cutoff parameter according to the input file you're providing (genbank file = default value (4), fasta file = 3)
