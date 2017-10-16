#!/bin/bash

#setup paths
source /etc/profile

export BIGDL_VERSION=0.2.0
export BIGDL_HOME=/opt/work/BigDL-${BIGDL_VERSION} 
export SPARK_HOME=/opt/work/spark-2.1.0-bin-hadoop2.7
export SPARK_MASTER="spark://Gondolin-Node-021:7077"

export PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir=./BigDL-Tutorials/notebooks --ip=* --port=12345 --no-browser --NotebookApp.token='' --allow-root"
export BIGDL_JAR=${BIGDL_HOME}/lib/bigdl-SPARK_2.1-${BIGDL_VERSION}-jar-with-dependencies.jar
export BIGDL_PY_ZIP=${BIGDL_HOME}/lib/bigdl-${BIGDL_VERSION}-python-api.zip
export BIGDL_CONF=${BIGDL_HOME}/conf/spark-bigdl.conf

export NOTEBOOK_DIR="../../notebooks"
export PORT=12345
export DISPLAY=:0.0
rm -r BigDL-Tutorials/notebooks/neural_networks/metastore_db/

#export SPARK_OPTS="--master spark://Gondolin-Node-021:7077 --executor-cores 28 --total-executor-cores 112 --properties-file ${BIGDL_CONF} --jars ${BIGDL_JAR} --conf spark.driver.extraClassPath=${BIGDL_JAR} --conf spark.executor.extraClassPath=${BIGDL_JAR}"
export SPARK_OPTS="--master local[4] --driver-memory 4g --properties-file ${BIGDL_CONF} --jars ${BIGDL_JAR} --conf spark.driver.extraClassPath=${BIGDL_JAR} --conf spark.executor.extraClassPath=${BIGDL_JAR} --driver-java-options='-Dhttp.proxyHost=child-prc.intel.com -Dhttp.proxyPort=913 -Dhttps.proxyHost=child-prc.intel.com -Dhttps.proxyPort=913'"
echo $SPARK_HOME
echo $SPARK_OPTS
#export PYSPARK_SUBMIT_ARGS="--master local[4] --driver-memory 4g --properties-file ${BIGDL_CONF} --jars ${BIGDL_JAR}  --conf spark.driver.extraClassPath=${BIGDL_JAR} --conf spark.executor.extraClassPath=${BIGDL_JAR}  --conf spark.sql.catalogImplementation=''"
#echo $PYSPARK_SUBMIT_ARGS

export PYTHONPATH="${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${BIGDL_PY_ZIP}"
echo $PYTHONPATH

jupyter toree install --interpreters=Scala,PySpark --spark_home=${SPARK_HOME} --spark_opts='${SPARK_OPTS}' 
jupyter lab --notebook-dir=${NOTEBOOK_DIR} --ip=* --port=${PORT} --no-browser --NotebookApp.token='' --allow-root
#${SPARK_HOME}/bin/pyspark --master $SPARK_MASTER --driver-memory 4g --properties-file ${BIGDL_CONF} --py-files ${BIGDL_PY_ZIP} --jars ${BIGDL_JAR}  --conf spark.driver.extraClassPath=${BIGDL_JAR} --conf spark.executor.extraClassPath=${BIGDL_JAR}  --conf spark.sql.catalogImplementation=''
