class Lessons {
  static List<String> oopLessons = [
    '''<h1>OBJECT ORIENTED PROGRAMMING</h1>
<h2>Object Oriented Programming</h2>
<p>Is a programming concept that works on the principle that objects are the most important part of your program. It allows users create the objects that they want and then create methods to handle those objects. Manipulating these objects to get results is the goal of Object-Oriented Programming.</p>

<h2>Objects have Identity</h2>
<p>Every object in an object-oriented program has an identity. In other words, every occurrence of a particular type of object — called an instance — can be distinguished from every other occurrence of the same type of object, as well as from objects of other types.</p>

<h2>Objects</h2>
<p>An object is nothing but a self-contained component which consists of methods and properties to make a particular type of data useful.</p>
<p>An object can be a data structure, a variable or a function. It has a memory location allocated. The object is designed as class hierarchies.</p>

<h2>Class</h2>
<p>Is an entity that determines how an object will behave and what the object will contain. In other words, it is a blueprint or a set of instruction to build a specific type of object.</p>
<p>The class is a group of similar entities. It is only an logical component and not the physical entity.</p>

<h2>What is the Difference between objects and class?</h2>
<p>A class is a blueprint or prototype that defines the variables and the methods (functions) common to all objects of a certain kind.</p>
<p>An object is a specimen of a class. Software objects are often used to model real-world objects you find in everyday life.</p>

<h2>Method</h2>
<p>Is a procedure or function associated with a class? As part of a class, a method defines a particular behavior of a class instance. A class can have more than one method. These are called Actions.</p>

<h2>Access Members of a Class</h2>
<p>We can use the name of objects along with the (.) period operator to access members of a class.</p>''',
    """<h1>GETTERS/SETTERS, METHODS, AND CONSTRUCTOR</h1>

<h2>Getters / Setters</h2>
<p>Are methods used to protect your data and make your code more secure.</p>
<p>Getter returns the value (accessors), it returns the value of data type int, String, double, float, etc. It starts with the word "get" followed by the variable name.</p>
<p>Setter sets or updates the value (mutators), It sets the value for any variable used in a class's programs. It starts with the word "set" followed by the variable name.</p>

<h2>Methods</h2>
<p>This is a block of code that performs a specific task.</p>
<h3>Two types of methods:</h3>
<p>User-defined Methods: We can create our own method based on our requirements.</p>
<p>Standard Library Methods: These are built-in methods in Java that are available to use.</p>

<h2>Constructors</h2>
<p>is similar to a method that is cited when an object of the class is created.</p>
<p>Has the same name as that of the class and does not have any return type.</p>

<h2>Types of Constructor</h2>
<ol>
  <li>No-Arg Constructor - that does not accept any arguments.</li>
  <li>Parameterized Constructor - accepts arguments</li>
  <li>Default Constructor - If we do not create any constructor, the compiler automatically create a no-arg constructor during the execution of the program.</li>
</ol>

<h2>Constructors Overloading</h2>
<p>We can also create two or more constructors with different parameters.</p>
<p>This is called constructors overloading.</p>""",
    """<h1>ACCESS MODIFIERS</h1>

<h2>Access Modifiers</h2>
<p>These are used to set the accessibility(visibility) of classes, variables, methods, constructors, data members, and the setter methods.</p>

<h2>Types of Access Modifier</h2>
<ol>
  <li>Default / None
    <p>declarations are visible only within the package.</p>
  </li>
  <li>Private
    <p>declarations are visible within the class only</p>
  </li>
  <li>Protected
    <p>declarations are visible within the package or all subclasses</p>
  </li>
  <li>Public
    <p>declarations are visible everywhere</p>
  </li>
</ol>

<p>Use "extends" so we can call out the ParentClass.</p>
<p>Use "super" to call out the access levels.</p>""",
    """<h1>INHERITANCE</h1>

<h2>Inheritance</h2>
<p>A class that is derived from another class is called a subclass (also a derived class, extended class, or child class).</p>
<p>The class from which the subclass is derived is called a superclass (also a base class or a parent class).</p>

<p><strong>NOTE:</strong></p>
<p>A subclass inherits all the members (fields, methods, and nested classes) from its superclass.</p>
<p>Constructors are not members, so they are not inherited by subclasses, but the constructor of the superclass can be call into use from the subclass.</p>""",
  ];

  static List<String> dbmsLessons = [
    """ <h1>CONCEPTUAL MODELING USING THE E/R</h1>

<h2>Entity-Relationship Model</h2>
<p>Entity-relationship (E-R) model was introduced by Chen in 1976.</p>
<p>He described the main constructs of the E-R model i.e., entities, relationships and their associated attributes.</p>
<p>Entity refers to an "object" or "thing" in real world. Object may be any person, place, event etc.</p>

<h2>Attributes</h2>
<p>are the characteristics of any entity.</p>

<h2>Value</h2>
<p>is the information or data which is stored in attributes of any entity.</p>

<h2>Domain or value set</h2>
<p>is the set of all values or information about any attribute.</p>

<h2>Types of Attributes</h2>
<ul>
  <li>Simple and Composite Attributes
    <ul>
      <li>Simple Attributes are those which cannot be divided into subparts.</li>
      <li>Composite Attributes are those which can be divided into subparts</li>
    </ul>
  </li>
  <li>Single Valued and Multi-valued Attributes
    <ul>
      <li>Single Valued Attribute : An attribute having only single value for a particular entity is known as single value attribute.</li>
      <li>Multi-Valued Attributes : An attribute having more than one possible value for a particular entity is known as multi-valued attribute.</li>
    </ul>
  </li>
  <li>Derived Attributes and Stored Attributes
    <ul>
      <li>Derived Attributes : An attribute that can be derived from other known attributes is known as derived attribute.</li>
      <li>Stored Attributes : An attribute which cannot be derived by other known attributes is known as stored attribute.</li>
    </ul>
  </li>
</ul>

<h2>Relationship Set</h2>
<ul>
  <li>Relationship : A relationship is the association among several entities. It connects different entities through a meaningful relation.</li>
  <li>Relationship Set : A relationship set is a set of relationships of the same type.</li>
</ul>

<h2>Degree of Relationship Set</h2>
<ul>
  <li>Binary Relationship Set - A relationship set in which only two entity sets are involved is known as binary relationship set.</li>
  <li>Ternary Relationship Set - A relationship set in which three entity sets are involved is known as ternary relationship set or a relationship set having degree three.</li>
</ul>

<h2>Role and Recursive Relationship Set</h2>
<ul>
  <li>Role : The function of any entity which it plays in relationship set is called that entity's role.</li>
  <li>Recursive Relationship Set : When the same entity sets participate in same relationship set more than once with different roles each time, then this type of recursive relationship set is known as Recursive Relationship set</li>
</ul>

<h2>Mapping Constraints</h2>
<ul>
  <li>Mapping Cardinalities(Cardinality Ratios)
    <ul>
      <li>One to One (1 : 1)</li>
      <li>One to Many (1 : N)</li>
      <li>Many to One (N : 1)</li>
      <li>Many to Many (M : N)</li>
    </ul>
  </li>
</ul>

<h2>Keys</h2>
<p>A key is an attribute or set of attributes that is used to identify data in entity sets. The attributes which are used as key are known as key attributes. Rest of all are known as Non-key attributes.</p>

<h2>Types of Keys</h2>
<ul>
  <li>Super Key: A super key is a set of collection of one or more than one attributes that can identify data uniquely.</li>
  <li>Candidate Key: The minimal super key is known as candidate key. Consider a super key and then take all of its proper subsets</li>
  <li>Primary Key: An attribute which identifies data uniquely is known as Primary Key.</li>
  <li>Alternate Keys: All the candidate keys other than Primary Key are known as Alternate Keys.</li>
  <li>Secondary Key: An attribute or set of attributes which doesn't identify data uniquely but identifies a group of data is known as secondary key.</li>
  <li>Foreign Key: A foreign key is an attribute in any entity set which is also a Primary Key in any other entity set.</li>
</ul>""",
    """<h1>RELATIONAL DATABASE MANAGEMENT AND SQL</h1>

<h2>Relational Databases</h2>
<p>Relational databases are based upon the relational data model and managed by a relational database management system, or RDBMS.</p>

<h2>Structured Query Language</h2>
<p>Structured Query Language, or SQL, is the language used for both data definition and data manipulation. It is one of the most popular database languages currently in use in the industry.</p>
<p>SQL can be used both interactively from a command prompt or executed by a program, written in a particular programming language (Java, Python, and many others). In that case, the general-purpose programming language is called the host language to the SQL code.</p>

<h2>Key Characteristics of Sql</h2>
<ul>
  <li>Various versions of the SQL standard have been introduced, starting with the first, SQL-86 in 1986, and the most recent one in 2016 (SQL:2016).</li>
  <li>It was accepted as a standard for relational data definition and manipulation by the American National Standards Institute (ANSI) in 1986 and by the International Organization for Standardization (ISO) in 1987.</li>
  <li>SQL is primarily set-oriented and declarative. In other words, as opposed to record-oriented database languages, SQL can retrieve and manipulate many records at a time (i.e., it operates on sets of records instead of individual records).</li>
  <li>Furthermore, you only need to specify which data to retrieve, in contrast to procedural database languages, which also require you to explicitly define the navigational access path to the data.</li>
</ul>

<h2>Categories of Sql</h2>

<h3>1. Data Definition Language</h3>
<p>DDL stands for Data Definition Language. It is used to define database structure or pattern. It is used to create schema, tables, indexes, constraints, etc. in the database.</p>
<p>Here are some tasks that come under DDL:</p>
<ul>
  <li>Create: It is used to create objects in the database.</li>
  <li>Alter: It is used to alter the structure of the database.</li>
  <li>Drop: It is used to delete objects from the database.</li>
  <li>Truncate: It is used to remove all records from a table.</li>
  <li>Rename: It is used to rename an object.</li>
  <li>Comment: It is used to comment on the data dictionary.</li>
</ul>
<p><strong>NOTE:</strong> These commands are used to update the database schema that's why they come under Data definition language.</p>

<h3>2. Data Manipulation Language</h3>
<p>DML stands for Data Manipulation Language. It is used for accessing and manipulating data in a database. It handles user requests.</p>
<p>Here are some tasks that come under DML:</p>
<ul>
  <li>Select: It is used to retrieve data from a database.</li>
  <li>Insert: It is used to insert data into a table.</li>
  <li>Update: It is used to update existing data within a table.</li>
  <li>Delete: It is used to delete all records from a table.</li>
  <li>Merge: It performs UPSERT operation, i.e., insert or update operations.</li>
  <li>Call: It is used to call a structured query language or a Java subprogram.</li>
  <li>Explain Plan: It has the parameter of explaining data.</li>
  <li>Lock Table: It controls concurrency.</li>
</ul>

<h3>3. Data Control Language</h3>
<p>DCL stands for Data Control Language. It is used to retrieve the stored or saved data. The DCL execution is transactional. It also has rollback parameters.</p>
<p>Here are some tasks that come under DCL:</p>
<ul>
  <li>Grant: It is used to give user access privileges to a database.</li>
  <li>Revoke: It is used to take back permissions from the user.</li>
</ul>
<p>These are the following operations which have the authorization of Revoke:</p>
<ul>
  <li>CONNECT, INSERT, USAGE, EXECUTE, DELETE, UPDATE and SELECT.</li>
</ul>

<h3>4. Transaction Control Language</h3>
<p>TCL is used to run the changes made by the DML statement. TCL can be grouped into a logical transaction.</p>
<p>Here are some tasks that come under TCL:</p>
<ul>
  <li>Commit: It is used to save the transaction on the database.</li>
  <li>Rollback: It is used to restore the database to original since the last Commit.</li>
</ul>""",
    """<h1>DATA DEFINITION LANGUAGE</h1>

<p>Let's try to create database and tables using DDL statements.</p>

<ul>
  <li>We will create database named dbsample1.<br>
    <p><strong>COMMAND:</strong> create database;</p>
    <p><strong>STATEMENT:</strong> create database DBSAMPLE1;</p>
  </li>

  <li>Before you will create a table, you should select first the database.<br>
    <p><strong>COMMAND:</strong> use;</p>
    <p><strong>STATEMENT:</strong> use DBSAMPLE1;</p>
  </li>

  <li>Now, we can create table inside the dbsample1 database.
    <p>For example we will create table named studenttb with the following fields and their datatypes:</p>
    <ul>
      <li>studentno int unsigned,</li>
      <li>firstname varchar(45) not null,</li>
      <li>middlename varchar(45),</li>
      <li>lastname varchar(45) not null,</li>
      <li>age varchar(45)</li>
    </ul>
    <p><strong>COMMAND:</strong> create table;</p>
    <p><strong>STATEMENT:</strong> CREATE TABLE STUDENTTB(STUDENTNO INT UNSIGNED, FIRSTNAME VARCHAR(45) NOT NULL, MIDDLENAME VARCHAR(45), LASTNAME VARCHAR(45) NOT NULL, AGE VARCHAR(45));</p>
  </li>

  <li>After creating the table, you can display the tables in a database or you can also display the table structure.<br>
    <p><strong>COMMAND:</strong> show tables; // it will display the list of tables in a database</p>
    <p><strong>COMMAND:</strong> describe;</p>
    <p><strong>STATEMENT:</strong> DESCRIBE STUDENTTB // it will display the table structure.</p>
  </li>

  <li>To change the data type of age we will use now the DDL statement ALTER TABLE.<br>
    <p><strong>COMMAND:</strong> alter table modify; // change of DATATYPE only</p>
    <p><strong>STATEMENT:</strong> ALTE TABLE STUDENTTB MODIFY AGE INT;</p>
    <p><strong>COMMAND:</strong> alter table change; // change of DATATYPE & FIELDNAME</p>
    <p><strong>STATEMENT:</strong> ALTER TABLE STUDENTTB CHANGE AGE AGE INT;</p>
  </li>

  <li>For example we forgot the gender field name upon creating the table. To add field /s we will use ALTER TABLE and ADD COLUMNS function.<br>
    <p><strong>COMMAND:</strong> alter table add column;</p>
    <p><strong>STATEMENT:</strong> ALTER TABLE STUDENTTB ADD COLUMN GENDER VARCHAR(45);</p>
  </li>

  <li>Upon adding field, the added field will be the last field in the table. Now, how can you add field where you can specify the order location in the table?<br>
    <p>For example, we will add another field ADDRESS VARCHAR(70) and it will be place after the age field. In adding field to specify the place of the field you caneither use AFTER and FIRST only.</p>
    <p><strong>COMMAND:</strong> alter table add after;</p>
    <p><strong>STATEMENT:</strong> ALTER TABLE STUDENTTB ADD ADDRESS VARCHAR(45) AFTER AGE;</p>
  </li>

  <li>To delete field in a table, we use ALTER TABLE and DROP. For example in studenttb TABLE, we will delete the field middlename.<br>
    <p><strong>COMMAND:</strong> alter table drop;</p>
    <p><strong>STATEMENT:</strong> ALTER TABLE STUDENTTB DROP MIDDLENAME</p>
  </li>

  <li>We will set the studentno as PRIMARY KEY. To do this we will use the ALTER TABLE and ADD PRIMARY KEY.<br>
    <p><strong>COMMAND:</strong> alter table add primary key;</p>
    <p><strong>STATEMENT:</strong> ALTER TABLE STUDENTTB ADD PRIMARY KEY(STUDENTNO);</p>
  </li>

  <li>To delete the primary key, we will use ALTER TABLE and DROP PRIMARY KEY<br>
    <p><strong>COMMAND:</strong> alter table drop primary key;</p>
    <p><strong>STATEMENT:</strong> ALTER TABLE STUDENTTB DROP PRIMARY KEY;</p>
  </li>
</ul>""",
    """<h1>DATA MANIPULATION LANGUAGE</h1>

<p>Let's try to insert records inside the table</p>

<ul>
  <li>To insert records where all fields have values we use:
    <p><strong>COMMAND:</strong> insert into set;</p>
    <p><strong>STATEMENT:</strong> INSERT INTO STUDENTTB SET STUDENTNO=101, FIRSTNAME="JUAN", LASTNAME="DELA CRUZ", AGE=52, ADDRESS="ANTIPOLO CITY", GENDER="FEMALE";</p>
    <p><strong>COMMAND:</strong> insert into values;</p>
    <p><strong>STATEMENT:</strong> INSTER INTO STUDENTTB VALUES(102, "JOHN", "DOE", 28, "BINANGONAN, RIZAL", MALE");</p>
  </li>

  <li>To insert new record in a table, you can use INSERT INTO with SET or INSERT INTO with VALUES
    <p><strong>COMMAND:</strong> insert into set;</p>
    <p><strong>STATEMENT:</strong> INSERT INTO STUDENTTB SET STUDENTNO=103, FIRSTNAME="JOAN", LASTNAME="SANTOS", AGE=22, GENDER="FEMALE";</p>
    <p><strong>COMMAND:</strong> insert into values;</p>
    <p><strong>STATEMENT:</strong> INSTER INTO STUDENTTB (STUDENTNO, FIRSTNAME, LASTNAME, AGE, ADDRESS) VALUES (104, "BEA", "CRUZ", "TERESA RIZAL");</p>
  </li>

  <li>To update record, use the UPDATE statement, UPDATE table_name SET which columns to change WHERE condition
    <p><strong>COMMAND:</strong> update set where;</p>
    <p><strong>STATEMENT:</strong> UPDATE STUDENTTB SET ADDRESS="BARAS, RIZAL" WHERE STUDENTNO=101;</p>
    <p><strong>STATEMENT:</strong> UPDATE STUDENTTB SET GENDER="MALE" WHERE STUDENTNO=103;</p>
  </li>

  <li>To delete a record, use the DELETE statement, DELETE FROM table_name WHERE condition.
    <p><strong>NOTE:</strong> Be careful in executing the DELETE statement without the WHERE condition, all records will be deleted.</p>
    <p><strong>COMMAND:</strong> delete from where;</p>
    <p><strong>STATEMENT:</strong> DELETE FROM STUDENTTB WHERE STUDENTNO=103;</p>
  </li>
</ul>""",
  ];
}
