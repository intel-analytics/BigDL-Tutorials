#!/bin/bash

#setup pathes
source /etc/profile

export SPARK_HOME=/opt/work/spark-2.2.0-bin-hadoop2.7
export SPARK_MASTER="spark://Gondolin-Node-054:7077"
export NOTEBOOK_DIR="../../notebooks"
export NOTEBOOK_PORT=12345

rm -r BigDL-Tutorials/notebooks/neural_networks/metastore_db/

jupyter toree install --spark_home=${SPARK_HOME} --spark_opts="--master ${SPARK_MASTER} --conf spark.ui.port=5050 --conf spark.executor.memory=200G"
jupyter notebook --notebook-dir=${NOTEBOOK_DIR} --ip=* --port=${NOTEBOOK_PORT} --no-browser --NotebookApp.token='' --allow-root
