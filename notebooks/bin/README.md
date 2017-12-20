# Guide for Starting BigDL
This guide aims at establishing a complete environment for users, who want to use **BigDL**, from an empty dev-box.
Note that this guide only valids for linux system.

## 1. Preparing BigDL Libraries
The first step is to download **BigDL** libraries. Before running the script `prepare.bigdl.sh`, users should specify the version of BigDL.
The default version is `0.2.0`. It you want to use other versions, you can modify the variable `BigDL_Version`
with the expected version number.

The default downloading location is under `/opt/work`. If you want to download to other locations, you can change the corresponding parts
in the script.

After the above specifications, users can run the following command to prepare BigDL libraries.
```bash
./prepare.bigdl.sh
```

## 2. Preparing Vegas
[Vegas](https://github.com/vegas-viz/Vegas) is a plotting library for **Scala**. If you do not need this visualization tool when
using the notebook, you can skip this step.

The script `prepare.vegas.sh` needs users to specify the location of **Spark** by setting the variable `SPARK_HOME`. Then it will download
the dependent jars into the directory `JARS_HOME=$SPARK_HOME/jars`. To start this preparation, users only need the following command
```bash
./prepare.vegas.sh
```
The current version of **Vegas** is 2.11 and the script only supports this version. 

## 3. Starting Toree Notebooks
After the above preparations, users can start the Jupyter notebooks with the core Toree. We have prepared the script
`start.bigdl.toree.sh` for users to start, but users should specify the following variables before using this script.
* `BIGDL_VERSION` : The version number of BigDL libraries.
* `BIGDL_HOME` : The location of BigDL libraries.
* `SPARK_HOME` : The location of **Spark**.
* `SPARK_MASTER` : The master server for **Spark**.
* `NOTEBOOK_DIR` : The directory of creating, writing and storing notebooks.
* `PORT` : The port number of starting **Toree**
* `SPARK_OPTS` : The options for starting **Spark**.
Then users only need the following command to start **Toree**
```bash
./start.bigdl.toree.sh
```
If users want to use JupyterLab, please first install it according to [this instruction](https://github.com/jupyterlab/jupyterlab)
and then run the script `start.bigdl.toree.jupyterlab.sh`

Have fun with **Toree** using **BigDL** !
