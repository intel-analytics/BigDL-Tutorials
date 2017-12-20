#!/bin/bash

#setup paths
source /etc/profile

export BIGDL_VERSION=0.2.0
export BIGDL_HOME=/opt/work/BigDL-${BIGDL_VERSION} 
export SPARK_HOME=/opt/work/spark-2.1.0-bin-hadoop2.7

export BIGDL_JAR=${BIGDL_HOME}/lib/bigdl-SPARK_2.1-${BIGDL_VERSION}-jar-with-dependencies.jar
export BIGDL_PY_ZIP=${BIGDL_HOME}/lib/bigdl-${BIGDL_VERSION}-python-api.zip
export BIGDL_CONF=${BIGDL_HOME}/conf/spark-bigdl.conf

export NOTEBOOK_DIR="../../notebooks"
export PORT=12345

rm -r ${NOTEBOOK_DIR}/bigdl-tutorials-python/metastore_db/
rm -r ${NOTEBOOK_DIR}/spark-warehouse/
rm -r ${NOTEBOOK_DIR}/bigdl-tutorials-python/spark-warehouse/
rm -r ${NOTEBOOK_DIR}/bigdl-tutorials-scala/spark-warehouse/

export SPARK_OPTS="--master local[4] --driver-memory 4g --properties-file ${BIGDL_CONF} --jars ${BIGDL_JAR} --conf spark.driver.extraClassPath=${BIGDL_JAR} --conf spark.executor.extraClassPath=${BIGDL_JAR} --driver-java-options='-Dhttp.proxyHost=child-prc.intel.com -Dhttp.proxyPort=913 -Dhttps.proxyHost=child-prc.intel.com -Dhttps.proxyPort=913'"

jupyter toree install --interpreters=Scala,PySpark --spark_home=${SPARK_HOME} --spark_opts='${SPARK_OPTS}' 
jupyter notebook --notebook-dir=${NOTEBOOK_DIR} --ip=* --port=${PORT} --no-browser --NotebookApp.token='' --allow-root

