#!/bin/bash

## Usage ################################
# ./nb2script <file-name without extension>
# Example:
# nb2script 04_modern_net
#########################################

if [ $# -ne "1" ]; then
    echo "Usage: ./nb2script <file-name without extension>"
else
   sed -ig 's/%%/#/' $1.ipynb
   sed -ig 's/%pylab/#/' $1.ipynb

   ipython nbconvert --to script $1.ipynb > $1.py

   sed -i '' '1i\
   sc = SparkContext(appName='$1', conf=create_spark_conf())' $1.py
fi 

