<img src="https://github.com/moineaulab/CRISPRStudio/blob/master/CRISPRStudio_logo.png" width="250">

# Introduction

CRISPRStudio is a program developed to facilitate and accelerate CRISPR array visualization. It works by first comparing spacers sequence homology in a dataset, then assigning a two-color-code to each cluster of spacers and finally writing an svg file, which can be opened in graphics vector editor. 

It runs on any Unix operating system equipped with the software requirements mentioned below. If your computer runs Windows 10, you can also install the Ubuntu terminal.

# Installation

Simply download the CRISPRStudio python script (.py).

### Software requirements

The following dependencies are required by CRISPRStudio

- Local installation of fasta36 and mcl

fasta36 can be downloaded at http://faculty.virginia.edu/wrpearson/fasta/CURRENT/ (make sure that the folder with the executable was added in your path)

mcl can be downloaded at https://micans.org/mcl/ in the "License & Software" section 

or on Mac:

```
sudo port install mcl
```

or on Linux:

```
sudo apt-get install mcl
```

- The following python modules: BioPython, Scipy, Numpy, Fastcluster which can be installed through:

```
pip3 install biopython scipy numpy fastcluster
```

# Basic command

```
python CRISPRStudio_1.0.py -i test.gff
```

### Parameters

+ h: help message

+ i: GFF3 file generated with CRISPRDetect (compulsory)

+ l: generate the figure with a subset of isolates listed in the file (optional: by default, will generate a figure with all the strains. You need to provided a txt file with the list of the sample names exactly as they appear in the CRISPRDetect output file)

+ g: gray out unique spacers, so that only spacers present twice in the dataset remain colored (optional, by default will attribute a unique color for each cluster of spacer)

+ f: verification of the fasta file generated from the GFF file will be skipped if this flag is provided (optional, by default, the verification is mainly based on the length of the spacer sequences. If a spacer is 1.5 time shorter or longer than the average spacer size of the dataset, a warning is raised and the script stops). Correction can be either made in the initial gff file or in the fasta file. If the latter, provide the name of the fasta file after the flag (ex. -f corrected_sequences.fasta)

+ s: strain sorting in the figure (optional, by default, CRISPRDetect gff output file sorting). Available option: CRISPRDetect, HClust, File providing a list of the isolates in the desired order. CRISPRDetect = order in the gff file. HClust = Order based on hiearchical clustering of a distance matrix. File = Order provided in a single column file with the strain names as they should appear in the figure.

+ r: use this option to keep the same color attributed to the spacer during a previous analysis (optional, by default, will attribute new random colors each time the command is executed). This option may be useful when appending a preexisting dataset with new sequences if you want to have reproducible results. Run your new sequences with CRISPRDetect and copy the result at the end of your initial CRISPRDetect gff file, without changing the name of your initial file. When new sequences are added, they are aligned and clustered with the entire dataset and random colors are assigned only to new clusters, assuming new clusters are formed.

+ c: score cutoff for pairing of the spacers (optional, by default = 2)


# Additional information

### Link to CRISPRDetect:

-  online platform: http://brownlabtools.otago.ac.nz/CRISPRDetect/predict_crispr_array.html

-  repository for local installation: https://github.com/ambarishbiswas/CRISPRDetect_2.2

If you use the online platform, simply run the analysis, click on "Annotation file in GFF format" (top right section of the output), then copy and paste in a text editor to save on your computer.

If you use CRISPRDetect locally, make sure you adjust the -array_quality_score_cutoff parameter according to the input file you're providing (genbank file = default value (4), fasta file = 3)

### Link to install Ubuntu for Windows 10: 

https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0
