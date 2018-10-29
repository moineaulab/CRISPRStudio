<img src="https://github.com/moineaulab/CRISPRStudio/blob/master/CRISPRStudio_logo.png" width="250">

# Introduction

CRISPRStudio is a program developed to facilitate and accelerate CRISPR array visualization. It works by first comparing spacers sequence homology in a dataset, then assigning a two-color-code to each cluster of spacers and finally writing an svg file, which can be opened in graphics vector editor. 

It runs on any Unix operating system equipped with Python 3.6.x or older and the software requirements mentioned below. If your computer runs Windows 10, you can also install the Ubuntu terminal.

# Installation

## Automatic installation
A script is provided to install the required software and python modules (python3 and pip should already be installed on your system).
```
git clone https://github.com/moineaulab/CRISPRStudio.git
cd CRISPRStudio
./Install.sh
```
In case of errors, you can perform a manual installation or raise an issue on the GitHub page. See the troubleshooting section for installation tips.

## Manual installation
Download this git repository and install the following dependencies:

- Local installation of fasta36

fasta36 can be downloaded at http://faculty.virginia.edu/wrpearson/fasta/CURRENT/

Help with fasta36 installation can be found here (follow step 1 to 3): https://fasta.bioch.virginia.edu/fasta_www2/fasta_down.shtml

Make sure you move the fasta36 file under the “CRISPRStudio-master” ->  “tools” directory

Finally, download the python modules from your terminal:

```
pip3 install scipy numpy pandas scikit-bio
```

## Troubleshooting

1.	Incompatibility
There seems to be incompatibility issues with scikit-bio and more recent versions of python3. Installation should work up to python 3.6.x, but our test was unsuccessful with 3.7.x. Check your python version by running:

```
python --version
```

If your python version is too recent, you can try uninstalling it and reinstalling an older version. See these two links for step by step explanations:

https://stackoverflow.com/questions/3819449/how-to-uninstall-python-2-7-on-a-mac-os-x-10-6-4
https://apple.stackexchange.com/questions/237430/how-to-install-specific-version-of-python-on-os-x

2.	Upgrade pip
Older versions of pip have caused installation issues. If the python modules installation is difficult, try upgrading your pip:

```
pip3 install --upgrade pip
```

3.	scikit-bio dependencies
scikit-bio requires specific versions of other python modules. In one of our test, installation was successful after uninstalling pandas, scipy and numpy and leaving scikit-bio take care of installing its necessary versions. First check if you have pandas, scipy and numpy already installed:

```
pip3 list
```

Then uninstall the packages:

```
pip3 uninstall pandas scipy numpy
```

And install scikit-bio only:

```
pip3 install scikit-bio
```


# Basic command

```
python CRISPR_Studio_1.0.py -i figure3.gff
```

### Parameters

+ h:	help message

+ i:	GFF3 file generated with CRISPRDetect (compulsory)

+ l:	generate the figure with a subset of isolates listed in the file (optional: by default, will generate a figure with all the strains. You need to provide a txt file with the list of the sample names exactly as they appear in the CRISPRDetect output file)

+ gU:	gray out unique spacers, so that only spacers present twice in the dataset remain colored (optional, by default will attribute a unique color for each cluster of spacer)

+ gS:	gray out similar spacers, so that only unique spacers remain colored (optional, by default will attribute a unique color for each cluster of spacer)

+ f:	verification of the fasta file generated from the GFF file will be skipped if this flag is provided (optional, by default, the verification is mainly based on the length of the spacer sequences. If a spacer is 1.5 time shorter or longer than the average spacer size of the dataset, a warning is raised, and the script stops). Correction can be either made in the initial gff file or in the fasta file. If the latter, provide the name of the fasta file after the flag (ex. -f corrected_sequences.fasta)

+ s:	sorting of the isolates in the figure: Available options: CRISPRDetect, DistMatrix or File providing a list of the isolates in the desired order. CRISPRDetect = order in the gff file. DistMatrix = Order extracted from a distance matrix based on the similarity of the arrays in the isolates. File = Order provided in a single column file with the isolates names as the should appear in the figure. The option -l overrides this option (Default: DistMatrix)

+ r:	use this option to keep the same color attributed to the spacer during a previous analysis (optional, by default, will attribute new random colors each time the command is executed). This option may be useful when appending a preexisting dataset with new sequences if you want to have reproducible results. Run your new sequences with CRISPRDetect and copy the result at the end of your initial CRISPRDetect gff file, without changing the name of your initial file. When new sequences are added, they are aligned and clustered with the entire dataset and random colors are assigned only to new clusters, assuming new clusters are formed.

+ c:	score cut-off for pairing of the spacers (optional, by default = 2)

+ n:	show the size of the spacers (nucleotide length) over the boxed diamonds. We recommend using this option only for experimental analysis of the data (optional, by default, spacer size is not shown).



# Additional information

### Link to CRISPRDetect:

-  online platform: http://brownlabtools.otago.ac.nz/CRISPRDetect/predict_crispr_array.html

-  repository for local installation: https://github.com/ambarishbiswas/CRISPRDetect_2.2

If you use the online platform, simply run the analysis, click on "Annotation file in GFF format" (top right section of the output), then copy and paste in a text editor to save on your computer.

If you use CRISPRDetect locally, make sure you adjust the -array_quality_score_cutoff parameter according to the input file you're providing (genbank file = default value (4), fasta file = 3)

### Link to install Ubuntu for Windows 10: 

https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0
