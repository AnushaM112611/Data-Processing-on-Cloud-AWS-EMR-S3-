ADD JAR s3://demo.bigdataemrlab/input/jsonserde.jar;
CREATE EXTERNAL TABLE users (userid int, username string, firstname string,
lastname string, city string, state string, email string, phone string,
likesports string, liketheatre string, likeconcerts string, likejazz string,
likeclassical string, likeopera string, likerock string, likevegas string,
likebroadway string, likemusicals string)
ROW FORMAT
serde 'com.amazon.elasticmapreduce.JsonSerde'
with serdeproperties ( 'paths'='userid, username, firstname, lastname,
city, state, email, phone, likesports, liketheatre, likeconcerts, likejazz,
likeclassical, likeopera, likerock, likevegas, likebroadway, likemusicals' )
LOCATION "${INPUT}" ;
INSERT OVERWRITE DIRECTORY "${OUTPUT}"
SELECT * FROM users WHERE likesports = "true";