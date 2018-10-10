#!/bin/bash

# This script will install CRISPRStudio and all its dependencies.
# Author: Pier-Luc Plante


rm -r ./tools 2>/dev/null #Remove previous installation files
rm -r ./CRISPR_Studio 2>/dev/null

mkdir tools
echo -e "Tools directory created"
cd tools

echo "Installation of fasta36..."
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    wget http://faculty.virginia.edu/wrpearson/fasta/CURRENT/fasta-36.3.8g-linux64.tar.gz;
elif [[ "$OSTYPE" == "darwin"* ]]; then
    wget http://faculty.virginia.edu/wrpearson/fasta/CURRENT/fasta-36.3.8g-macosxuniv.tar.gz;
else
    echo -e "OS not handled";
    exit 1;
fi

tar -xzf fasta-36.3.8g*.tar.gz
echo -e "Testing fasta36 installation"
cd fasta-36.3.8g
bin/fasta36 -q seq/mgstm1.aa seq/prot_test.lseg >/dev/null && echo "Fasta36 test passed" || echo "Fasta36 test failed";
cd ../..
echo "Fasta36 successfully installed"


echo "Checking python installation and installing missing modules..."
if [[ "$(python --version 2>&1)" == *" 3."* ]] || [[ "$(python3 --version 2>&1)" == *" 3."* ]]; then
    echo "Checking pip installation..."
    if [[ "$(pip --version 2>&1)" == *"python 3."* ]]; then
        echo "Installing python modules with pip..."
        pip install scikit-bio pandas scipy numpy;
    elif [[ "$(pip3 --version 2>&1)" == *"python 3."* ]]; then
        echo "Installing python modules with pip3..."
        pip3 install scikit-bio pandas scipy numpy;
    else
        echo "Please install pip and re-install CRISPR Studio or install manually"; exit 1;
    fi
#elif [[ "$(python3 --version 2>&1)" == *" 3."* ]]; then
#    pip --version && pip install scikit-bio pandas scipy numpy \
#    || echo "Please install pip and re-install CRISPRStudio or install manually"; exit 1;
else
    echo "Error: Python 3 is not installed or is not the default interpreter. Fix this and re-install CRISPR Studio";
    exit 1;
fi
echo -e "Creating CRISPR Studio executable" && ln -s  CRISPR_Studio_1.0.py CRISPR_Studio && chmod u+x ./CRISPR_Studio







