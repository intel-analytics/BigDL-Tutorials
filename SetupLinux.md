# Demo Setup Guide

## Install Dependency Packages

This guide is mainly for Ubuntu. If you has other linux platform, please do the similar command for that platform.

###  Installation Steps

* Install Java 
   * Install Jdk 8 from http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html#javasejdk
   * Run the following steps
```
   export JAVA_HOME=where you unzip your jdk
   export PATH=$PATH:$JAVA_HOME/bin
```
* Install Python dev env. Python2.7 is shipped with linux.
```
    sudo apt-get update
    sudo apt-get install build-essential
    sudo apt-get install -y python-setuptools python-dev
```
* Instal pip - the package manager for python
```
    sudo easy_install pip
```
* Install required python libraries using Pip
```
    pip install numpy scipy pandas scikit-learn matplotlib seaborn jupyter wordcloud 
```
* If you have installed jupyter using pip3, you can use below command to install the python 2 kernel
```
python2 -m pip install ipykernel
python2 -m ipykernel install --user
```
