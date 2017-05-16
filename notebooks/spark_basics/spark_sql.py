json_strings = ['{"name":"Bob","address":{"city":"Los Angeles","state":"California"}}']
# Defines an RDD from the Python list.
peopleRDD = sc.parallelize(json_strings)

# Creates an DataFrame from an RDD[String].
people = spark.read.json(peopleRDD)

people.show()
people.createOrReplaceTempView("people")
sqlDF = spark.sql("SELECT * FROM people")
sqlDF.show()
