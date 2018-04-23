#!/bin/bash

# Required BigDL and Spark version
export BIGDL_VERSION=0.4.0
export SPARK_VERSION=2.2.1

# Find the path of BigDL and Spark
export BIGDL_PIP_HOME=`pip show BigDL | sed -n -e '/^Location/p' | sed 's/[^ ]* //'`
export BIGDL_HOME=${BIGDL_PIP_HOME}/bigdl/share
export PYSPARK_PIP_HOME=`pip show pyspark | sed -n -e '/^Location/p' | sed 's/[^ ]* //'`
export SPARK_HOME=${PYSPARK_PIP_HOME}/pyspark

# Check installation of BigDL
if [ -z "${BIGDL_HOME}" ]; then
	echo "Cannot find BigDL installation directory. Have you run 'pip install BigDL==${BIGDL_VERSION}'?"
	exit 1
fi

# Check installation of Spark
if [ -z "${SPARK_HOME}" ]; then
	echo "Cannot find Spark installation directory. Have you run 'pip install BigDL==${BIGDL_VERSION}'?"
	exit 1
fi

# Check the version BigDL and Spark
export BIGDL_TEMP_VERSION=`pip show BigDL | sed -n -e '/^Version/p' | sed 's/[^ ]* //'`
if [ "${BIGDL_VERSION}" != "${BIGDL_TEMP_VERSION}" ]; then
	echo "Wrong version of BigDL. Please run 'pip install BigDL==${BIGDL_VERSION}'."
	exit 1
fi

export SPARK_TEMP_VERSION=`pip show pyspark | sed -n -e '/^Version/p' | sed 's/[^ ]* //'`
if [ "${SPARK_VERSION}" != "${SPARK_TEMP_VERSION}" ]; then
        echo "Wrong version of Spark. Please run 'pip install BigDL==${BIGDL_VERSION}'."
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
jupyter toree install --interpreters=Scala,PySpark --spark_home=${SPARK_HOME} --spark_opts="${SPARK_OPTS}"
