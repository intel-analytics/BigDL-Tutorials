#!/bin/bash
BigDL_Version=0.2.0

mkdir -p /opt/work
cd /opt/work

source /etc/profile

if [ ! -d "BigDL-$BigDL_Version" ]; then
    wget https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.1.1-scala-2.11.8-linux64/$BigDL_Version/dist-spark-2.1.1-scala-2.11.8-linux64-$BigDL_Version-dist.zip
    unzip -d BigDL-$BigDL_Version dist-spark-2.1.1-scala-2.11.8-linux64-$BigDL_Version-dist.zip 
    rm dist-spark-2.1.1-scala-2.11.8-linux64-$BigDL_Version-dist.zip
fi

if [ ! -d BigDL-Tutorials ]; then
    git config --list
    git clone https://github.com/intel-analytics/BigDL-Tutorials.git
    git checkout master
else
    cd BigDL-Tutorials
    git reset --hard HEAD
    git pull
    cd ..
fi
