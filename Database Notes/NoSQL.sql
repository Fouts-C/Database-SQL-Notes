-- NoSQL Database (Not Only SQL)--
	-- A Non-Relational database (no tables)
	-- A flexible database used for big data and real-time web apps - No predefined schema
    -- Handles unstructured data
	-- Multiple types of NoSQL databases
    -- Big Data - Social networks, search engines, etc need more efficient/cheaper methods
    -- EXAMPLE: Gmail, Facebook (Google(BigTable), Amazon(DynamoDB))

-- Relational Database is safer (Data integrity), ACID (Transaction) Compliance


		-- CATEGORIES OF NoSQL DATABASES -- 
-- Key-Value stores (DynamoDB, Redis, Cassandra)
	-- These systems have a simple data model based on fast access by the key to the 
    -- value associated with the key; the value can be a record, an object, a document, 
    -- or even a more complex data structure.
-- Document-based database (MongoDB, CouchDB)
	-- Store data in the form of documents using well-known formats, such as 
    -- JSON (JavaScript Object Notation). 
-- Column-based database (BigTable, Apache Hbase)
	-- These systems partition a table by column into column families, 
    -- where each column family is stored in its own files. 
-- Graph-based database (Neo4j)
	-- Data is represented as graphs, and related nodes can be found by 
    -- traversing the edges using path expressions.


-- MongoDB Code (Most Popular NoSQL Database) --
	-- Documents stored in BSON (Binary JSON (More efficient))

-- Create Database
use <database_name>
-- Create Collection
db.createCollection(<collection_name>)
-- Insert Documents
db.<collection>.insertOne(<JSON>)
db.<collection>.insertMany(<array>)

-- Querying Data
db.<collection>.find()
db.<collection>.findOne()
-- Example
db.posts.find( {category: "News"} )

-- Projection
db.posts.find({}, {title: 1, date: 1})
db.posts.find({}, {category: 0})
db.posts.find({}, {_id: 0, title: 1, date: 1})

-- Query Operators
$eq: Values are equal
$ne: Values are not equal
$gt: Value is greater than another value
$gte: Value is greater than or equal to another value
$lt: Value is less than another value
$lte: Value is less than or equal to another value
$in: Value is matched within an array
$and: Returns documents where both queries match
$or: Returns documents where either query matches
$nor: Returns documents where both queries fail to match
$not: Returns documents where the query does not match
    
-- Update Operators
$currentDate: Sets the field value to the current date
$inc: Increments the field value
$rename: Renames the field
$set: Sets the value of a field
$unset: Removes the field from the document
$addToSet: Adds distinct elements to an array
$pop: Removes the first or last element of an array
$pull: Removes all elements from an array that match the query
$push: Adds an element to an array

db.bank.updateOne( { account_name: ”Tom" }, { $set: { balance: 200 } } ) 

    