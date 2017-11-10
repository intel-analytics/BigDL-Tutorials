#!/bin/bash
source /etc/profile

export SPARK_HOME=/opt/work/spark-2.1.0-bin-hadoop2.7
export JARS_HOME=${SPARK_HOME}/jars

if [ ! -e ${JARS_HOME}/circe-parser_2.11-0.7.0.jar ]
then
	wget https://repo1.maven.org/maven2/io/circe/circe-parser_2.11/0.7.0/circe-parser_2.11-0.7.0.jar -P ${JARS_HOME}
else
	echo "circe-parser_2.11-0.7.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/cats-macros_2.11-0.9.0.jar ]
then
	wget https://repo1.maven.org/maven2/org/typelevel/cats-macros_2.11/0.9.0/cats-macros_2.11-0.9.0.jar -P ${JARS_HOME}
else
	echo "cats-macros_2.11-0.9.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/macro-compat_2.11-1.1.1.jar ]
then
	wget https://repo1.maven.org/maven2/org/typelevel/macro-compat_2.11/1.1.1/macro-compat_2.11-1.1.1.jar -P ${JARS_HOME}
else
	echo "macro-compat_2.11-1.1.1.jar already exists."
fi

if [ ! -e ${JARS_HOME}/monocle-macro_2.11-1.1.0.jar ]
then
	wget https://repo1.maven.org/maven2/com/github/julien-truffaut/monocle-macro_2.11/1.1.0/monocle-macro_2.11-1.1.0.jar -P ${JARS_HOME}
else
	echo "monocle-macro_2.11-1.1.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/monocle-core_2.11-1.1.0.jar ]
then
	wget https://repo1.maven.org/maven2/com/github/julien-truffaut/monocle-core_2.11/1.1.0/monocle-core_2.11-1.1.0.jar -P ${JARS_HOME}
else
	echo "monocle-core_2.11-1.1.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/circe-numbers_2.11-0.7.0.jar ]
then
	wget https://repo1.maven.org/maven2/io/circe/circe-numbers_2.11/0.7.0/circe-numbers_2.11-0.7.0.jar -P ${JARS_HOME}
else
	echo "circe-numbers_2.11-0.7.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/vegas_2.11-0.3.11.jar ]
then
	wget https://repo1.maven.org/maven2/org/vegas-viz/vegas_2.11/0.3.11/vegas_2.11-0.3.11.jar -P ${JARS_HOME}
else
	echo "vegas_2.11-0.3.11.jar already exists."
fi

if [ ! -e ${JARS_HOME}/shapeless_2.11-2.3.2.jar ]
then
	wget https://repo1.maven.org/maven2/com/chuusai/shapeless_2.11/2.3.2/shapeless_2.11-2.3.2.jar -P ${JARS_HOME}
else
	echo "shapeless_2.11-2.3.2.jar already exists."
fi

if [ ! -e ${JARS_HOME}/vega-lite-1.2.0.jar ]
then
	wget https://repo1.maven.org/maven2/org/webjars/bower/vega-lite/1.2.0/vega-lite-1.2.0.jar -P ${JARS_HOME}
else
	echo "vega-lite-1.2.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/circe-core_2.11-0.7.0.jar ]
then
	wget https://repo1.maven.org/maven2/io/circe/circe-core_2.11/0.7.0/circe-core_2.11-0.7.0.jar -P ${JARS_HOME}
else
	echo "circe-core_2.11-0.7.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/cats-kernel_2.11-0.9.0.jar ]
then
	wget https://repo1.maven.org/maven2/org/typelevel/cats-kernel_2.11/0.9.0/cats-kernel_2.11-0.9.0.jar -P ${JARS_HOME}
else
	echo "cats-kernel_2.11-0.9.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/circe-jawn_2.11-0.7.0.jar ]
then
	wget https://repo1.maven.org/maven2/io/circe/circe-jawn_2.11/0.7.0/circe-jawn_2.11-0.7.0.jar -P ${JARS_HOME}
else
	echo "circe-jawn_2.11-0.7.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/cats-core_2.11-0.9.0.jar ]
then
	wget https://repo1.maven.org/maven2/org/typelevel/cats-core_2.11/0.9.0/cats-core_2.11-0.9.0.jar -P ${JARS_HOME}
else
	echo "cats-core_2.11-0.9.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/scala-parser-combinators_2.11-1.0.2.jar ]
then
	wget https://repo1.maven.org/maven2/org/scala-lang/modules/scala-parser-combinators_2.11/1.0.2/scala-parser-combinators_2.11-1.0.2.jar -P ${JARS_HOME}
else
	echo "scala-parser-combinators_2.11-1.0.2.jar already exists."
fi

if [ ! -e ${JARS_HOME}/circe-generic_2.11-0.7.0.jar ]
then
	wget https://repo1.maven.org/maven2/io/circe/circe-generic_2.11/0.7.0/circe-generic_2.11-0.7.0.jar -P ${JARS_HOME}
else
	echo "circe-generic_2.11-0.7.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/vegas-macros_2.11-0.3.11.jar ]
then
	wget https://repo1.maven.org/maven2/org/vegas-viz/vegas-macros_2.11/0.3.11/vegas-macros_2.11-0.3.11.jar -P ${JARS_HOME}
else
	echo "vegas-macros_2.11-0.3.11.jar already exists."
fi

if [ ! -e ${JARS_HOME}/simulacrum_2.11-0.10.0.jar ]
then
	wget https://repo1.maven.org/maven2/com/github/mpilquist/simulacrum_2.11/0.10.0/simulacrum_2.11-0.10.0.jar -P ${JARS_HOME}
else
	echo "simulacrum_2.11-0.10.0.jar already exists."
fi

if [ ! -e ${JARS_HOME}/jawn-parser_2.11-0.10.4.jar ]
then
	wget https://repo1.maven.org/maven2/org/spire-math/jawn-parser_2.11/0.10.4/jawn-parser_2.11-0.10.4.jar -P ${JARS_HOME}
else
	echo "jawn-parser_2.11-0.10.4.jar already exists."
fi

if [ ! -e ${JARS_HOME}/machinist_2.11-0.6.1.jar ]
then
	wget https://repo1.maven.org/maven2/org/typelevel/machinist_2.11/0.6.1/machinist_2.11-0.6.1.jar -P ${JARS_HOME}
else
	echo "machinist_2.11-0.6.1.jar already exists."
fi

if [ ! -e ${JARS_HOME}/scalafx_2.11-8.0.92-R10.jar ]
then
	wget https://repo1.maven.org/maven2/org/scalafx/scalafx_2.11/8.0.92-R10/scalafx_2.11-8.0.92-R10.jar -P ${JARS_HOME}
else
	echo "scalafx_2.11-8.0.92-R10.jar already exists."
fi

if [ ! -e ${JARS_HOME}/scala-xml_2.11-1.0.2.jar ]
then
	wget https://repo1.maven.org/maven2/org/scala-lang/modules/scala-xml_2.11/1.0.2/scala-xml_2.11-1.0.2.jar -P ${JARS_HOME}
else
	echo "scala-xml_2.11-1.0.2.jar already exists."
fi

if [ ! -e ${JARS_HOME}/scalaz-core_2.11-7.1.1.jar ]
then
	wget https://repo1.maven.org/maven2/org/scalaz/scalaz-core_2.11/7.1.1/scalaz-core_2.11-7.1.1.jar -P ${JARS_HOME}
else
	echo "scalaz-core_2.11-7.1.1.jar already exists."
fi

if [ ! -e ${JARS_HOME}/vega-3.0.0-rc4.jar ]
then
	wget https://repo1.maven.org/maven2/org/webjars/bower/vega/3.0.0-rc4/vega-3.0.0-rc4.jar -P ${JARS_HOME}
else
	echo "vega-3.0.0-rc4.jar already exists."
fi

echo "Vegas Preparation Done!"
