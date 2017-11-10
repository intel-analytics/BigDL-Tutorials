#!/bin/bash

#setup pathes
source /etc/profile

export BIGDL_VERSION=0.2.0
export BIGDL_HOME=/opt/work/BigDL-${BIGDL_VERSION} 
export SPARK_HOME=/opt/work/spark-2.1.0-bin-hadoop2.7
export SPARK_MASTER="local[4]"
export NOTEBOOK_DIR="../../notebooks"
export PORT="12345"

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir=${NOTEBOOK_DIR} --ip=* --port=${PORT} --no-browser --NotebookApp.token='' --allow-root"
export BIGDL_JAR=${BIGDL_HOME}/lib/bigdl-SPARK_2.1-${BIGDL_VERSION}-jar-with-dependencies.jar
export BIGDL_PY_ZIP=${BIGDL_HOME}/lib/bigdl-${BIGDL_VERSION}-python-api.zip
export BIGDL_CONF=${BIGDL_HOME}/conf/spark-bigdl.conf

rm -r BigDL-Tutorials/notebooks/neural_networks/metastore_db/

${SPARK_HOME}/bin/pyspark --master $SPARK_MASTER --driver-memory 4g --properties-file ${BIGDL_CONF} --py-files ${BIGDL_PY_ZIP} --jars ${BIGDL_JAR}  --conf spark.driver.extraClassPath=${BIGDL_JAR} --conf spark.executor.extraClassPath=${BIGDL_JAR}  --conf spark.sql.catalogImplementation=''
