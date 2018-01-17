#!/bin/bash

# Find the path of BigDL and Spark
export BIGDL_PIP_HOME=`pip show BigDL | sed -n -e '/^Location/p' | sed 's/[^ ]* //'`
export BIGDL_HOME=${BIGDL_PIP_HOME}/bigdl/share
export PYSPARK_PIP_HOME=`pip show pyspark | sed -n -e '/^Location/p' | sed 's/[^ ]* //'`
export SPARK_HOME=`python ${PYSPARK_PIP_HOME}/pyspark/find_spark_home.py`

# Check installation of BigDL
if [ -z "${BIGDL_HOME}" ]; then
	echo "Please install BigDL correctly!"
	exit 1
fi

# Check installation of Spark
if [ -z "${SPARK_HOME}" ]; then
	echo "Please set install Spark correctly!"
	exit 1
fi

# Set paths
export BIGDL_JAR_NAME=`ls ${BIGDL_HOME}/lib/ | grep jar-with-dependencies.jar`
export BIGDL_JAR=${BIGDL_HOME}/lib/${BIGDL_JAR_NAME}
export BIGDL_PY_ZIP_NAME=`ls ${BIGDL_HOME}/lib/ | grep python-api.zip`
export BIGDL_PY_ZIP=${BIGDL_HOME}/lib/${BIGDL_PY_ZIP_NAME}
export BIGDL_CONF=${BIGDL_HOME}/conf/spark-bigdl.conf

# Check files
if [ ! -f ${BIGDL_JAR} ]; then
    echo "Cannot find ${BIGDL_JAR}!"
    exit 1
fi

if [ ! -f ${BIGDL_PY_ZIP} ]; then
    echo "Cannot find ${BIGDL_PY_ZIP}!"
    exit 1
fi

if [ ! -f ${BIGDL_CONF} ]; then
    echo "Cannot find ${BIGDL_CONF}!"
    exit 1
fi

# Configure Spark
export SPARK_OPTS="--master local[4] --driver-memory 4g --properties-file ${BIGDL_CONF} --jars ${BIGDL_JAR} --conf spark.driver.extraClassPath=${BIGDL_JAR} --conf spark.executor.extraClassPath=${BIGDL_JAR} --conf spark.sql.catalogImplementation='in-memory'"

# Install Toree
jupyter toree install --interpreters=Scala,PySpark --spark_home=${SPARK_HOME} --spark_opts='${SPARK_OPTS}'
