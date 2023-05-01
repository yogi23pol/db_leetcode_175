# In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem "Combine Two Tables.

Create table If Not Exists Person_1 
(
personId int, 
firstName varchar(255), 
lastName varchar(255)
);

Create table If Not Exists Address_1
(
addressId int, 
personId int, 
city varchar(255), 
state varchar(255)
);

Truncate table Person_1;
insert into Person_1 (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
insert into Person_1 (personId, lastName, firstName) values ('2', 'Alice', 'Bob');

Truncate table Address_1;
insert into Address_1 (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
insert into Address_1 (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');

select * from person_1;
select * from Address_1;

#===========================================================================================================================
/**
# Q. Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
If the address of a personId is not present in the Address table, report null instead.
Input: 
Person table:
+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+
Address table:
+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+
Output: 
+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+
Explanation: 
There is no address in the address table for the personId = 1 so we return null in their city and state.
addressId = 1 contains information about the address of personId = 2.
#===========================================================================================================================
**/

# This problem can be solved using a LEFT JOIN.
# Here, we are selecting the firstName and lastName columns from the Person table, and the city and state columns from the Address table.
# We are using a LEFT JOIN to combine the tables based on their personId columns. If a personId in the Person table doesn't have a 
# corresponding entry in the Address table, the city and state columns will have NULL values.

# Type 1 :- Used, Alias table name
SELECT p.firstName, p.lastName, a.city, a.state 
FROM Person_1 AS p
LEFT JOIN Address_1 AS a
ON p.personId=a.personId;

# Type 2 :- Alias name is not used, it's optional when SELECT statement fetch data from unique column name.
# USING is a type of join condition used in SQL to combine tables. It specifies the common column(s) that the two tables should be joined on.
SELECT firstName, lastName, city, state 
FROM Person_1
LEFT JOIN Address_1
USING (personId);

# NOTE :- SEQUENCE QUERY RUNS(BEHIND THE SCENES) :- FROM => LEFT JOIN => SELECT