# Defines a Python list storing one JSON object.
json_strings = ['{"name":"Bob","address":{"city":"Los Angeles","state":"California"}}']

# Defines an RDD from the Python list.
peopleRDD = sc.parallelize(json_strings)

# Creates an DataFrame from an RDD[String].
people = spark.read.json(peopleRDD)

people.show()

from pyspark.sql import Row
text_data = sc.parallelize(["MYSQL ERROR 1\n","MYSQL ERROR 2\n","MYSQL\n"])
# Creates a DataFrame having a single column named "line"
df = text_data.map(lambda r: Row(r)).toDF(["line"])

# Counts ERRORs
errors = df.filter(df["line"].like("%ERROR%"))

# Counts all the errors
errors.count()

