# Demo Setup Guide

## Install Dependency Packages

###  Installation Steps
* (Optional) (Mac) You may want to install Homebrew as a convinient package manager
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
* Install Java and Spark
   * Install Java on OSX following the guide https://java.com/en/download/help/mac_install.xml
   * Install Spark on OSX http://spark.apache.org/downloads.html
* (Optional) (Mac) Install Python. Python is shipped with MacOS, but you may want to install updates using Homebrew
```
brew install python
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
