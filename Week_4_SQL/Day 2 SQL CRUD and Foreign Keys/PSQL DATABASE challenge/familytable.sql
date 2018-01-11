Last login: Tue Dec 19 10:59:38 on ttys000
learn12:~ learn$ psql postgres
psql (9.6.4)
Type "help" for help.

postgres=# learn_sd#;
ERROR:  syntax error at or near "learn_sd"
LINE 1: learn_sd#;
        ^
postgres=# learn_sd#
postgres-# CREATE DATABASE family_rolodex
postgres-# ;
ERROR:  syntax error at or near "learn_sd"
LINE 1: learn_sd#
        ^
postgres=# learn_sd#;
ERROR:  syntax error at or near "learn_sd"
LINE 1: learn_sd#;
        ^
postgres=# learn_sd#
postgres-# ;
ERROR:  syntax error at or near "learn_sd"
LINE 1: learn_sd#
        ^
postgres=# learn_sd=#;
ERROR:  syntax error at or near "learn_sd"
LINE 1: learn_sd=#;
        ^
postgres=# \l
                                 List of databases
      Name       | Owner | Encoding |   Collate   |    Ctype    | Access privileges
-----------------+-------+----------+-------------+-------------+-------------------
 CountryDatabase | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 country         | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 dvd_rental      | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres        | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0       | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/learn         +
                 |       |          |             |             | learn=CTc/learn
 template1       | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/learn         +
                 |       |          |             |             | learn=CTc/learn
(6 rows)

postgres=# CREATE DATABASE family-rolodex
postgres-# ;
ERROR:  syntax error at or near "-"
LINE 1: CREATE DATABASE family-rolodex
                              ^
postgres=# CREATE DATABASE family_rolodex;
CREATE DATABASE
postgres=# \c family_rolodex;
You are now connected to database "family_rolodex" as user "learn".
family_rolodex=# CREATE TABLE Family_Table
family_rolodex-# ;
ERROR:  syntax error at or near ";"
LINE 2: ;
        ^
family_rolodex=# CEATE TABLE Family_Table(id serial PRIMARY KEY, given_name varchar, family_name varchar, address varchar, dob date, email varchar);
ERROR:  syntax error at or near "CEATE"
LINE 1: CEATE TABLE Family_Table(id serial PRIMARY KEY, given_name v...
        ^
family_rolodex=# CREATE TABLE Family_Table(id serial PRIMARY KEY, given_name varchar, family_name varchar, address varchar, dob date, email varchar);
CREATE TABLE
family_rolodex=# INSERT INTO Family_Table VALUES('Alexander', 'Walsh', '2119 Albatross St', 1996,11,04, 'alexw.walsh@gmail.com');
ERROR:  INSERT has more expressions than target columns
LINE 1: ...ander', 'Walsh', '2119 Albatross St', 1996,11,04, 'alexw.wal...
                                                             ^
family_rolodex=# INSERT INTO Family_Table VALUES('Alexander', 'Walsh', '2119 Albatross St', (1996,11,04), 'alexw.walsh@gmail.com');
ERROR:  invalid input syntax for integer: "Alexander"
LINE 1: INSERT INTO Family_Table VALUES('Alexander', 'Walsh', '2119 ...
                                        ^
family_rolodex=# INSERT INTO Family_Table VALUES('Alexander', 'Walsh', '2119 Albatross St', ('1996/11/04'), 'alexw.walsh@gmail.com');
ERROR:  invalid input syntax for integer: "Alexander"
LINE 1: INSERT INTO Family_Table VALUES('Alexander', 'Walsh', '2119 ...
                                        ^
family_rolodex=# INSERT INTO Family_Table VALUES(1,'Alexander', 'Walsh', '2119 Albatross St', ('1996/11/04'), 'alexw.walsh@gmail.com');
INSERT 0 1
family_rolodex=# INSERT INTO Family_Table VALUES (2, 'Ashley', 'Taylor', '4955 Ariva Way', ('1989/01/01'), 'asha.472@gmail.com');
INSERT 0 1
family_rolodex=# INSERT INTO Family_Table VALUES (3, 'Karyn', 'Walsh', '11084 Mann Ct.', ('1964/10/18'), 'kar4205@gmail.com');
INSERT 0 1
family_rolodex=# INSERT INTO Family_Table VALUES(4, 'Marilynne', 'Taylor', '905 SE 95th St.', ('1971/04/08'), 'momytaylor@gmail.com');
INSERT 0 1
family_rolodex=# INSERT INTO Family_Table VALUES(5, 'Tood', 'Vanderbilt', '214 E. Madison Ave.', ('1942/02/14'), 'tvanderbilt@vanderbiltinc.com');
INSERT 0 1
family_rolodex=# \d
                List of relations
 Schema |        Name         |   Type   | Owner
--------+---------------------+----------+-------
 public | family_table        | table    | learn
 public | family_table_id_seq | sequence | learn
(2 rows)

family_rolodex=# \l
                                 List of databases
      Name       | Owner | Encoding |   Collate   |    Ctype    | Access privileges
-----------------+-------+----------+-------------+-------------+-------------------
 CountryDatabase | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 country         | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 dvd_rental      | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 family_rolodex  | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres        | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0       | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/learn         +
                 |       |          |             |             | learn=CTc/learn
 template1       | learn | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/learn         +
                 |       |          |             |             | learn=CTc/learn
(7 rows)

family_rolodex=# \d Family_Table;
                                 Table "public.family_table"
   Column    |       Type        |                         Modifiers
-------------+-------------------+-----------------------------------------------------------
 id          | integer           | not null default nextval('family_table_id_seq'::regclass)
 given_name  | character varying |
 family_name | character varying |
 address     | character varying |
 dob         | date              |
 email       | character varying |
Indexes:
    "family_table_pkey" PRIMARY KEY, btree (id)

family_rolodex=# \d family_rolodex
Did not find any relation named "family_rolodex".
family_rolodex=# SELECT * FROM family_rolodex;
ERROR:  relation "family_rolodex" does not exist
LINE 1: SELECT * FROM family_rolodex;
                      ^
family_rolodex=# SELECT * FROM Family_Table;
 id | given_name | family_name |       address       |    dob     |             email
----+------------+-------------+---------------------+------------+-------------------------------
  1 | Alexander  | Walsh       | 2119 Albatross St   | 1996-11-04 | alexw.walsh@gmail.com
  2 | Ashley     | Taylor      | 4955 Ariva Way      | 1989-01-01 | asha.472@gmail.com
  3 | Karyn      | Walsh       | 11084 Mann Ct.      | 1964-10-18 | kar4205@gmail.com
  4 | Marilynne  | Taylor      | 905 SE 95th St.     | 1971-04-08 | momytaylor@gmail.com
  5 | Tood       | Vanderbilt  | 214 E. Madison Ave. | 1942-02-14 | tvanderbilt@vanderbiltinc.com
(5 rows)

family_rolodex=# SELECT family_name FROM Family_Table WHILE family_name = Walsh;
ERROR:  syntax error at or near "family_name"
LINE 1: SELECT family_name FROM Family_Table WHILE family_name = Wal...
                                                   ^
family_rolodex=# SELECT family_name FROM Family_Table WHEN family_name = Walsh;
ERROR:  syntax error at or near "WHEN"
LINE 1: SELECT family_name FROM Family_Table WHEN family_name = Wals...
                                             ^
family_rolodex=# SELECT family_name FROM Family_Table WHERE family_name = Walsh;
ERROR:  column "walsh" does not exist
LINE 1: ...ECT family_name FROM Family_Table WHERE family_name = Walsh;
                                                                 ^
family_rolodex=# SELECT family_name FROM Family_Table WHERE family_name ='Walsh';
 family_name
-------------
 Walsh
 Walsh
(2 rows)

family_rolodex=# SELECT family_name FROM Family_Table WHERE family_name ='Taylor';
 family_name
-------------
 Taylor
 Taylor
(2 rows)

family_rolodex=# INSERT INTO Family_Table VALUES(6, 'Francis', 'Walsh', '1724 Peoria Ave.', ('1927/04/19'), 'budWalsh@email.com');
INSERT 0 1
family_rolodex=# UPDATE Family_Table SET address= '2119 Albatross St.' WHERE family_name=Walsh;
ERROR:  column "walsh" does not exist
LINE 1: ...e SET address= '2119 Albatross St.' WHERE family_name=Walsh;
                                                                 ^
family_rolodex=# SELECT * FROM Family_Table;
 id | given_name | family_name |       address       |    dob     |             email
----+------------+-------------+---------------------+------------+-------------------------------
  1 | Alexander  | Walsh       | 2119 Albatross St   | 1996-11-04 | alexw.walsh@gmail.com
  2 | Ashley     | Taylor      | 4955 Ariva Way      | 1989-01-01 | asha.472@gmail.com
  3 | Karyn      | Walsh       | 11084 Mann Ct.      | 1964-10-18 | kar4205@gmail.com
  4 | Marilynne  | Taylor      | 905 SE 95th St.     | 1971-04-08 | momytaylor@gmail.com
  5 | Tood       | Vanderbilt  | 214 E. Madison Ave. | 1942-02-14 | tvanderbilt@vanderbiltinc.com
  6 | Francis    | Walsh       | 1724 Peoria Ave.    | 1927-04-19 | budWalsh@email.com
(6 rows)

family_rolodex=# UPDATE Family_Table SET address= '2119 Albatross St.' WHERE id=6;
UPDATE 1
family_rolodex=# SELECT * FROM Family_Table;
 id | given_name | family_name |       address       |    dob     |             email
----+------------+-------------+---------------------+------------+-------------------------------
  1 | Alexander  | Walsh       | 2119 Albatross St   | 1996-11-04 | alexw.walsh@gmail.com
  2 | Ashley     | Taylor      | 4955 Ariva Way      | 1989-01-01 | asha.472@gmail.com
  3 | Karyn      | Walsh       | 11084 Mann Ct.      | 1964-10-18 | kar4205@gmail.com
  4 | Marilynne  | Taylor      | 905 SE 95th St.     | 1971-04-08 | momytaylor@gmail.com
  5 | Tood       | Vanderbilt  | 214 E. Madison Ave. | 1942-02-14 | tvanderbilt@vanderbiltinc.com
  6 | Francis    | Walsh       | 2119 Albatross St.  | 1927-04-19 | budWalsh@email.com
(6 rows)

family_rolodex=# UPDATE Family_Table SET address= '4955 Ariva Way' WHERE id=4;
UPDATE 1
family_rolodex=# SELECT * FROM Family_Table;
 id | given_name | family_name |       address       |    dob     |             email
----+------------+-------------+---------------------+------------+-------------------------------
  1 | Alexander  | Walsh       | 2119 Albatross St   | 1996-11-04 | alexw.walsh@gmail.com
  2 | Ashley     | Taylor      | 4955 Ariva Way      | 1989-01-01 | asha.472@gmail.com
  3 | Karyn      | Walsh       | 11084 Mann Ct.      | 1964-10-18 | kar4205@gmail.com
  5 | Tood       | Vanderbilt  | 214 E. Madison Ave. | 1942-02-14 | tvanderbilt@vanderbiltinc.com
  6 | Francis    | Walsh       | 2119 Albatross St.  | 1927-04-19 | budWalsh@email.com
  4 | Marilynne  | Taylor      | 4955 Ariva Way      | 1971-04-08 | momytaylor@gmail.com
(6 rows)

family_rolodex=# UPDATE Family_Table SET address= '2119 Albatross St.' WHERE id=3;
UPDATE 1
family_rolodex=# SELECT * FROM Family_Table;
 id | given_name | family_name |       address       |    dob     |             email
----+------------+-------------+---------------------+------------+-------------------------------
  1 | Alexander  | Walsh       | 2119 Albatross St   | 1996-11-04 | alexw.walsh@gmail.com
  2 | Ashley     | Taylor      | 4955 Ariva Way      | 1989-01-01 | asha.472@gmail.com
  5 | Tood       | Vanderbilt  | 214 E. Madison Ave. | 1942-02-14 | tvanderbilt@vanderbiltinc.com
  6 | Francis    | Walsh       | 2119 Albatross St.  | 1927-04-19 | budWalsh@email.com
  4 | Marilynne  | Taylor      | 4955 Ariva Way      | 1971-04-08 | momytaylor@gmail.com
  3 | Karyn      | Walsh       | 2119 Albatross St.  | 1964-10-18 | kar4205@gmail.com
(6 rows)

family_rolodex=# DELETE FROM Family_Table WHERE id=5;
DELETE 1
family_rolodex=# SELECT * FROM Family_Table;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Alexander  | Walsh       | 2119 Albatross St  | 1996-11-04 | alexw.walsh@gmail.com
  2 | Ashley     | Taylor      | 4955 Ariva Way     | 1989-01-01 | asha.472@gmail.com
  6 | Francis    | Walsh       | 2119 Albatross St. | 1927-04-19 | budWalsh@email.com
  4 | Marilynne  | Taylor      | 4955 Ariva Way     | 1971-04-08 | momytaylor@gmail.com
  3 | Karyn      | Walsh       | 2119 Albatross St. | 1964-10-18 | kar4205@gmail.com
(5 rows)
/////////////////////////////////////////////////
countryclub=# SELECT surname, first_name FROM members WHERE surname = David AND first_name = Farrell
countryclub-# ;
ERROR:  column "david" does not exist
LINE 1: ... surname, first_name FROM members WHERE surname = David AND ...
                                                             ^
countryclub=# SELECT surname, first_name FROM members WHERE surname = 'David' AND first_name = 'Farrell';
;
 surname | first_name
---------+------------
(0 rows)

countryclub=# SELECT surname, first_name FROM members WHERE first_name = 'David' AND surname = 'Farrell';
;
 surname | first_name
---------+------------
 Farrell | David
(1 row)

countryclub=# SELECT surname, first_name, id FROM members WHERE first_name = 'David' AND surname = 'Farrell';
;
 surname | first_name | id
---------+------------+----
 Farrell | David      | 28
(1 row)

countryclub=# SELECT members.id AS m_id, booking.start_time AS s_time FROM members m INNER JOIN booking b ON members.id = booking.start_time;
ERROR:  invalid reference to FROM-clause entry for table "members"
LINE 1: ... AS s_time FROM members m INNER JOIN booking b ON members.id...
                                                             ^
HINT:  Perhaps you meant to reference the table alias "m".
countryclub=# SELECT members.id AS m_id, booking.start_time AS s_time FROM members m INNER JOIN booking b ON m.id = b.start_time;
ERROR:  operator does not exist: integer = timestamp without time zone
LINE 1: ..._time FROM members m INNER JOIN booking b ON m.id = b.start_...
                                                             ^
HINT:  No operator matches the given name and argument type(s). You might need to add explicit type casts.
countryclub=# SELECT members.id AS m_id, booking.start_time AS s_time FROM members m INNER JOIN booking b ON m = b;
ERROR:  invalid reference to FROM-clause entry for table "members"
LINE 1: SELECT members.id AS m_id, booking.start_time AS s_time FROM...
               ^
HINT:  Perhaps you meant to reference the table alias "m".
countryclub=# SELECT members.id, booking.start_time FROM members INNER JOIN booking on members .id = booking.start_time;
ERROR:  operator does not exist: integer = timestamp without time zone
LINE 1: ...me FROM members INNER JOIN booking on members .id = booking....
                                                             ^
HINT:  No operator matches the given name and argument type(s). You might need to add explicit type casts.
countryclub=# SELECT members.id, booking.start_time FROM members INNER JOIN booking on members .id = 28;
 id |     start_time
----+---------------------
 28 | 2012-07-03 11:00:00
 28 | 2012-07-03 08:00:00
 28 | 2012-07-03 18:00:00
 28 | 2012-07-03 19:00:00
 28 | 2012-07-03 10:00:00
 28 | 2012-07-03 15:00:00
 28 | 2012-07-04 09:00:00
 28 | 2012-07-04 15:00:00
 28 | 2012-07-04 13:30:00
 28 | 2012-07-04 15:00:00
 28 | 2012-07-04 17:30:00
 28 | 2012-07-04 12:30:00
 28 | 2012-07-04 14:00:00
 28 | 2012-07-04 15:30:00
 28 | 2012-07-04 14:00:00
 28 | 2012-07-04 12:00:00
 28 | 2012-07-04 18:00:00
 28 | 2012-07-05 17:30:00
 28 | 2012-07-05 09:30:00
 28 | 2012-07-05 09:00:00
 28 | 2012-07-05 19:00:00
 28 | 2012-07-05 18:30:00
 28 | 2012-07-05 13:00:00
 28 | 2012-07-05 14:30:00
 28 | 2012-07-05 18:30:00
 28 | 2012-07-05 12:30:00
 28 | 2012-07-06 08:00:00
 28 | 2012-07-06 14:00:00
 28 | 2012-07-06 15:30:00
 28 | 2012-07-06 17:00:00
 28 | 2012-07-06 11:00:00
 28 | 2012-07-06 12:00:00
 28 | 2012-07-06 14:00:00
 28 | 2012-07-06 08:30:00
 28 | 2012-07-06 13:30:00
 28 | 2012-07-06 15:30:00
 28 | 2012-07-07 08:30:00
 28 | 2012-07-07 12:30:00
 28 | 2012-07-07 14:30:00
 28 | 2012-07-07 08:30:00
 28 | 2012-07-07 09:00:00
 28 | 2012-07-07 11:30:00
 28 | 2012-07-07 16:00:00
 28 | 2012-07-07 12:30:00
 28 | 2012-07-07 11:30:00
 28 | 2012-07-07 14:00:00
 28 | 2012-07-07 17:30:00
 28 | 2012-07-07 08:30:00
countryclub=# SELECT booking.start_time, facility.name FROM booking INNER JOIN facilities on booking .start_time = '2012-09-21';
ERROR:  missing FROM-clause entry for table "facility"
LINE 1: SELECT booking.start_time, facility.name FROM booking INNER ...
                                   ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking .start_time = '2012-09-21';
 start_time | name
------------+------
(0 rows)

countryclub=#
countryclub=# SELECT name, start_time FROM booking WHERE start_time = '2012-09-21';
ERROR:  column "name" does not exist
LINE 1: SELECT name, start_time FROM booking WHERE start_time = '201...
               ^
countryclub=# SELECT * FROM facilities AND booking;
ERROR:  syntax error at or near "AND"
LINE 1: SELECT * FROM facilities AND booking;
                                 ^
countryclub=# SELECT * FROM facilities , booking;
 id |      name       | member_cost | guest_cost | initial_out_lay | monthly_maintenance |  id  | facility_id | member_id |     start_time      | slots
----+-----------------+-------------+------------+-----------------+---------------------+------+-------------+-----------+---------------------+-------
  0 | Tennis Court 1  |           5 |         25 |           10000 |                 200 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  1 | Tennis Court 2  |           5 |         25 |            8000 |                 200 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  2 | Badminton Court |           0 |       15.5 |            4000 |                  50 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  3 | Table Tennis    |           0 |          5 |             320 |                  10 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  4 | Massage Room 1  |          35 |         80 |            4000 |                3000 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  5 | Massage Room 2  |          35 |         80 |            4000 |                3000 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  6 | Squash Court    |         3.5 |       17.5 |            5000 |                  80 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  7 | Snooker Table   |           0 |          5 |             450 |                  15 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  8 | Pool Table      |           0 |          5 |             400 |                  15 |    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
  0 | Tennis Court 1  |           5 |         25 |           10000 |                 200 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  1 | Tennis Court 2  |           5 |         25 |            8000 |                 200 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  2 | Badminton Court |           0 |       15.5 |            4000 |                  50 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  3 | Table Tennis    |           0 |          5 |             320 |                  10 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  4 | Massage Room 1  |          35 |         80 |            4000 |                3000 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  5 | Massage Room 2  |          35 |         80 |            4000 |                3000 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  6 | Squash Court    |         3.5 |       17.5 |            5000 |                  80 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  7 | Snooker Table   |           0 |          5 |             450 |                  15 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  8 | Pool Table      |           0 |          5 |             400 |                  15 |    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
  0 | Tennis Court 1  |           5 |         25 |           10000 |                 200 |    2 |           6 |         0 | 2012-07-03 18:00:00 |     2
  1 | Tennis Court 2  |           5 |         25 |            8000 |                 200 |    2 |           6 |         0 | 2012-07-03 18:00:00 |     2
  2 | Badminton Court |           0 |       15.5 |            4000 |                  50 |    2 |           6 |         0 | 2012-07-03 18:00:00 |     2
  3 | Table Tennis    |           0 |          5 |             320 |                  10 |    2 |           6 |         0 | 2012-07-03 18:00:00 |     2
  4 | Massage Room 1  |          35 |         80 |            4000 |                3000 |    2 |           6 |         0 | 2012-07-03 18:00:00 |     2
countryclub=# SELECT start_time, name FROM facilities , booking WHERE name = 'Tennis Court%';
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT start_time, name FROM facilities , booking ;
     start_time      |      name
---------------------+-----------------
 2012-07-03 11:00:00 | Tennis Court 1
 2012-07-03 11:00:00 | Tennis Court 2
 2012-07-03 11:00:00 | Badminton Court
 2012-07-03 11:00:00 | Table Tennis
 2012-07-03 11:00:00 | Massage Room 1
 2012-07-03 11:00:00 | Massage Room 2
 2012-07-03 11:00:00 | Squash Court
 2012-07-03 11:00:00 | Snooker Table
 2012-07-03 11:00:00 | Pool Table
 2012-07-03 08:00:00 | Tennis Court 1
 2012-07-03 08:00:00 | Tennis Court 2
 2012-07-03 08:00:00 | Badminton Court
 2012-07-03 08:00:00 | Table Tennis
 2012-07-03 08:00:00 | Massage Room 1
 2012-07-03 08:00:00 | Massage Room 2
 2012-07-03 08:00:00 | Squash Court
 2012-07-03 08:00:00 | Snooker Table
 2012-07-03 08:00:00 | Pool Table
 2012-07-03 18:00:00 | Tennis Court 1
 2012-07-03 18:00:00 | Tennis Court 2
 2012-07-03 18:00:00 | Badminton Court
 2012-07-03 18:00:00 | Table Tennis
 2012-07-03 18:00:00 | Massage Room 1
 2012-07-03 18:00:00 | Massage Room 2
 2012-07-03 18:00:00 | Squash Court
 2012-07-03 18:00:00 | Snooker Table
 2012-07-03 18:00:00 | Pool Table
 2012-07-03 19:00:00 | Tennis Court 1
 2012-07-03 19:00:00 | Tennis Court 2
 2012-07-03 19:00:00 | Badminton Court
 2012-07-03 19:00:00 | Table Tennis
 2012-07-03 19:00:00 | Massage Room 1
 2012-07-03 19:00:00 | Massage Room 2
 2012-07-03 19:00:00 | Squash Court
 2012-07-03 19:00:00 | Snooker Table
 2012-07-03 19:00:00 | Pool Table
 2012-07-03 10:00:00 | Tennis Court 1
 2012-07-03 10:00:00 | Tennis Court 2
 2012-07-03 10:00:00 | Badminton Court
 2012-07-03 10:00:00 | Table Tennis
 2012-07-03 10:00:00 | Massage Room 1
 2012-07-03 10:00:00 | Massage Room 2
 2012-07-03 10:00:00 | Squash Court
 2012-07-03 10:00:00 | Snooker Table
 2012-07-03 10:00:00 | Pool Table
 2012-07-03 15:00:00 | Tennis Court 1
 2012-07-03 15:00:00 | Tennis Court 2
 2012-07-03 15:00:00 | Badminton Court
countryclub=# SELECT start_time, name FROM facilities , booking WHERE name = 'Tennis%';
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT start_time, name FROM facilities , booking WHERE start_date = '2012-09-21';
ERROR:  column "start_date" does not exist
LINE 1: ... start_time, name FROM facilities , booking WHERE start_date...
                                                             ^
HINT:  Perhaps you meant to reference the column "booking.start_time".
countryclub=# SELECT start_time, name FROM facilities , booking WHERE start_time = '2012-09-21';
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT start_time, name FROM facilities , booking WHERE start_date = '2012-09-21' IN ('Tennis Court%');
ERROR:  column "start_date" does not exist
LINE 1: ... start_time, name FROM facilities , booking WHERE start_date...
                                                             ^
HINT:  Perhaps you meant to reference the column "booking.start_time".
countryclub=# SELECT start_time, name FROM facilities , booking WHERE start_time = '2012-09-21' IN ('Tennis Court%');
ERROR:  operator does not exist: timestamp without time zone = boolean
LINE 1: ..., name FROM facilities , booking WHERE start_time = '2012-09...
                                                             ^
HINT:  No operator matches the given name and argument type(s). You might need to add explicit type casts.
countryclub=# SELECT start_time, name FROM facilities , booking WHERE start_time = '2012-09-21' IN ('Tennis Court 1' , 'Tennis Court 2');
ERROR:  operator does not exist: timestamp without time zone = boolean
LINE 1: ..., name FROM facilities , booking WHERE start_time = '2012-09...
                                                             ^
HINT:  No operator matches the given name and argument type(s). You might need to add explicit type casts.
countryclub=# SELECT start_time, name FROM facilities , booking WHERE id = 0 , 1;
ERROR:  syntax error at or near ","
LINE 1: ...start_time, name FROM facilities , booking WHERE id = 0 , 1;
                                                                   ^
countryclub=# SELECT start_time, name FROM facilities , booking WHERE start_time = '2012-09-21' IN (0,1);
ERROR:  invalid input syntax for integer: "2012-09-21"
LINE 1: ...name FROM facilities , booking WHERE start_time = '2012-09-2...
                                                             ^
countryclub=# SELECT start_time, name FROM facilities , booking WHERE start_time = '2012-09-21';
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facility.name FROM booking , facilities WHERE facilities.name IN ('Tennis Court 1' , 'Tennis Court2') AND booking.start_time BETWEEN '2012-09-22' AND '2012-09-20';
ERROR:  missing FROM-clause entry for table "facility"
LINE 1: SELECT booking.start_time, facility.name FROM booking , faci...
                                   ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking , facilities WHERE facilities.name IN ('Tennis Court 1' , 'Tennis Court2') AND booking.start_time BETWEEN '2012-09-22' AND '2012-09-20';
 start_time | name
------------+------
(0 rows)

countryclub=#
countryclub=#
countryclub=#
countryclub=# WITH timfacil AS ( SELECT start_time, name FROM facilities , booking) SELECT * WHERE name IN ('Tennis Court 1','Tennis Court 2') AND start_time BETWEEN '2012-09-22' AND '2012-09-20';
ERROR:  SELECT * with no tables specified is not valid
LINE 1: ...tart_time, name FROM facilities , booking) SELECT * WHERE na...
                                                             ^
countryclub=# WITH timfacil AS ( SELECT start_time, name FROM facilities , booking) WHERE timfacil IN ('Tennis Court 1','Tennis Court 2') AND start_time BETWEEN '2012-09-22' AND '2012-09-20';
ERROR:  syntax error at or near "WHERE"
LINE 1: ...ELECT start_time, name FROM facilities , booking) WHERE timf...
                                                             ^
countryclub=# SELECT start_time , name FROM facilities , booking WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') AND start_time BETWEEN '2012-09-22' AND '2012-09-20';
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT facilities.name , booking.start_time FROM facilities , booking WHERE facilities.name IN ('Tennis Court 1','Tennis Court 2') AND booking.start_time BETWEEN '2012-09-22' AND '2012-09-20' ORDER BY booking.start_time ASC;
 name | start_time
------+------------
(0 rows)

countryclub=# SELECT f.name , b.start_time FROM facilities f , booking b WHERE f.name IN ('Tennis Court 1','Tennis Court 2') AND b.start_time BETWEEN '2012-09-22' AND '2012-09-20' ORDER BY b.start_time ASC;
 name | start_time
------+------------
(0 rows)

countryclub=# SELECT f.name, b.start_time FROM facilities f, booking b WHERE f.name IN ('Tennis Court 1','Tennis Court 2') AND b.start_time BETWEEN '2012-09-22' AND '2012-09-20' ORDER BY b.start_time ASC;
 name | start_time
------+------------
(0 rows)

countryclub=# SELECT f.name, b.start_time FROM facilities f, booking b WHERE f.name IN ('Tennis Court 1','Tennis Court 2') AND b.start_time BETWEEN '2012-09-22' AND '2012-09-21' ORDER BY b.start_time ASC;
 name | start_time
------+------------
(0 rows)

countryclub=# SELECT facilities.name, booking.start_time FROM booking, facilities INNER JOIN facilities ON booking.start_time WHERE facilities.name IN ('Tennis Court 1','Tennis Court 2') AND booking.start_time BETWEEN '2012-09-22' AND '2012-09-21';
ERROR:  table name "facilities" specified more than once
countryclub=# SELECT name, start_time FROM booking, facilities INNER JOIN facilities ON booking.start_time WHERE facilities.name IN ('Tennis Court 1','Tennis Court 2') AND booking.start_time BETWEEN '2012-09-22' AND '2012-09-21';
ERROR:  table name "facilities" specified more than once
countryclub=# SELECT f.name, b.start_time FROM booking b, facilities f INNER JOIN facilities ON b.start_time WHERE f.name IN ('Tennis Court 1','Tennis Court 2') AND b.start_time BETWEEN '2012-09-22' AND '2012-09-21';
ERROR:  invalid reference to FROM-clause entry for table "b"
LINE 1: ... booking b, facilities f INNER JOIN facilities ON b.start_ti...
                                                             ^
HINT:  There is an entry for table "b", but it cannot be referenced from this part of the query.
countryclub=# SELECT f.name, b.start_time FROM booking b, facilities f INNER JOIN facilities ON b.start_time
countryclub-# ;
ERROR:  invalid reference to FROM-clause entry for table "b"
LINE 1: ... booking b, facilities f INNER JOIN facilities ON b.start_ti...
                                                             ^
HINT:  There is an entry for table "b", but it cannot be referenced from this part of the query.
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id;
     start_time      |      name
---------------------+-----------------
 2012-07-03 11:00:00 | Table Tennis
 2012-07-03 08:00:00 | Massage Room 1
 2012-07-03 18:00:00 | Squash Court
 2012-07-03 19:00:00 | Snooker Table
 2012-07-03 10:00:00 | Pool Table
 2012-07-03 15:00:00 | Pool Table
 2012-07-04 09:00:00 | Tennis Court 1
 2012-07-04 15:00:00 | Tennis Court 1
 2012-07-04 13:30:00 | Massage Room 1
 2012-07-04 15:00:00 | Massage Room 1
 2012-07-04 17:30:00 | Massage Room 1
 2012-07-04 12:30:00 | Squash Court
 2012-07-04 14:00:00 | Squash Court
 2012-07-04 15:30:00 | Squash Court
 2012-07-04 14:00:00 | Snooker Table
 2012-07-04 12:00:00 | Pool Table
 2012-07-04 18:00:00 | Pool Table
 2012-07-05 17:30:00 | Tennis Court 2
 2012-07-05 09:30:00 | Badminton Court
 2012-07-05 09:00:00 | Table Tennis
 2012-07-05 19:00:00 | Table Tennis
 2012-07-05 18:30:00 | Massage Room 1
 2012-07-05 13:00:00 | Squash Court
 2012-07-05 14:30:00 | Squash Court
 2012-07-05 18:30:00 | Snooker Table
 2012-07-05 12:30:00 | Pool Table
 2012-07-06 08:00:00 | Tennis Court 1
 2012-07-06 14:00:00 | Tennis Court 1
 2012-07-06 15:30:00 | Tennis Court 1
 2012-07-06 17:00:00 | Badminton Court
 2012-07-06 11:00:00 | Table Tennis
 2012-07-06 12:00:00 | Massage Room 1
 2012-07-06 14:00:00 | Squash Court
 2012-07-06 08:30:00 | Snooker Table
 2012-07-06 13:30:00 | Snooker Table
 2012-07-06 15:30:00 | Pool Table
 2012-07-07 08:30:00 | Tennis Court 1
 2012-07-07 12:30:00 | Tennis Court 1
 2012-07-07 14:30:00 | Tennis Court 1
 2012-07-07 08:30:00 | Tennis Court 2
 2012-07-07 09:00:00 | Badminton Court
 2012-07-07 11:30:00 | Badminton Court
 2012-07-07 16:00:00 | Badminton Court
 2012-07-07 12:30:00 | Table Tennis
 2012-07-07 11:30:00 | Massage Room 1
 2012-07-07 14:00:00 | Massage Room 1
 2012-07-07 17:30:00 | Massage Room 1
 2012-07-07 08:30:00 | Squash Court
 2012-07-07 10:30:00 | Squash Court
 2012-07-07 14:30:00 | Squash Court
 2012-07-07 16:00:00 | Squash Court
 2012-07-07 11:30:00 | Snooker Table
 2012-07-07 16:00:00 | Pool Table
 2012-07-07 17:30:00 | Pool Table
 2012-07-08 13:00:00 | Tennis Court 1
 2012-07-08 17:30:00 | Tennis Court 1
 2012-07-08 15:00:00 | Tennis Court 2
 2012-07-08 17:30:00 | Tennis Court 2
 2012-07-08 11:30:00 | Table Tennis
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE facilities IN ('Tennis Court 1','Tennis Court 2');
ERROR:  malformed record literal: "Tennis Court 1"
LINE 1: ....facility_id = facilities.id WHERE facilities IN ('Tennis Co...
                                                             ^
DETAIL:  Missing left parenthesis.
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE facilities IN ('Tennis Court 1','Tennis Court 2');
ERROR:  malformed record literal: "Tennis Court 1"
LINE 1: ....facility_id = facilities.id WHERE facilities IN ('Tennis Co...
                                                             ^
DETAIL:  Missing left parenthesis.
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE facilities IN ('Tennis Court 1' , 'Tennis Court 2');
ERROR:  malformed record literal: "Tennis Court 1"
LINE 1: ....facility_id = facilities.id WHERE facilities IN ('Tennis Co...
                                                             ^
DETAIL:  Missing left parenthesis.
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2');
     start_time      |      name
---------------------+----------------
 2012-07-04 09:00:00 | Tennis Court 1
 2012-07-04 15:00:00 | Tennis Court 1
 2012-07-05 17:30:00 | Tennis Court 2
 2012-07-06 08:00:00 | Tennis Court 1
 2012-07-06 14:00:00 | Tennis Court 1
 2012-07-06 15:30:00 | Tennis Court 1
 2012-07-07 08:30:00 | Tennis Court 1
 2012-07-07 12:30:00 | Tennis Court 1
 2012-07-07 14:30:00 | Tennis Court 1
 2012-07-07 08:30:00 | Tennis Court 2
 2012-07-08 13:00:00 | Tennis Court 1
 2012-07-08 17:30:00 | Tennis Court 1
 2012-07-08 15:00:00 | Tennis Court 2
 2012-07-08 17:30:00 | Tennis Court 2
 2012-07-09 12:30:00 | Tennis Court 1
 2012-07-09 15:30:00 | Tennis Court 1
 2012-07-09 19:00:00 | Tennis Court 1
 2012-07-09 13:00:00 | Tennis Court 2
 2012-07-09 19:00:00 | Tennis Court 2
 2012-07-10 11:30:00 | Tennis Court 1
 2012-07-10 16:00:00 | Tennis Court 1
 2012-07-11 08:00:00 | Tennis Court 1
 2012-07-11 10:00:00 | Tennis Court 1
 2012-07-11 12:00:00 | Tennis Court 1
 2012-07-11 14:00:00 | Tennis Court 1
 2012-07-11 15:30:00 | Tennis Court 1
 2012-07-11 18:30:00 | Tennis Court 1
 2012-07-11 12:30:00 | Tennis Court 2
 2012-07-11 16:00:00 | Tennis Court 2
 2012-07-12 13:30:00 | Tennis Court 1
 2012-07-12 16:30:00 | Tennis Court 1
 2012-07-12 11:30:00 | Tennis Court 2
 2012-07-13 10:30:00 | Tennis Court 1
 2012-07-13 14:00:00 | Tennis Court 1
 2012-07-13 17:00:00 | Tennis Court 1
 2012-07-13 15:00:00 | Tennis Court 2
 2012-07-14 08:30:00 | Tennis Court 1
 2012-07-14 11:30:00 | Tennis Court 1
 2012-07-14 15:00:00 | Tennis Court 1
 2012-07-14 10:30:00 | Tennis Court 2
 2012-07-14 12:30:00 | Tennis Court 2
 2012-07-14 14:30:00 | Tennis Court 2
 2012-07-15 08:00:00 | Tennis Court 1
 2012-07-15 16:00:00 | Tennis Court 1
 2012-07-15 19:00:00 | Tennis Court 1
 2012-07-15 10:00:00 | Tennis Court 2
 2012-07-15 12:00:00 | Tennis Court 2
 2012-07-15 15:30:00 | Tennis Court 2
 2012-07-16 11:00:00 | Tennis Court 1
 2012-07-16 19:00:00 | Tennis Court 1
 2012-07-16 08:00:00 | Tennis Court 2
 2012-07-16 12:30:00 | Tennis Court 2
 2012-07-17 12:30:00 | Tennis Court 1
 2012-07-17 18:00:00 | Tennis Court 1
 2012-07-17 10:00:00 | Tennis Court 2
 2012-07-17 14:30:00 | Tennis Court 2
 2012-07-18 13:00:00 | Tennis Court 1
 2012-07-18 17:30:00 | Tennis Court 1
 2012-07-18 14:00:00 | Tennis Court 2
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') BETWEEN '2012-09-22' AND '2012-09-21' ;
ERROR:  invalid input syntax for type boolean: "2012-09-22"
LINE 1: ... IN ('Tennis Court 1' , 'Tennis Court 2') BETWEEN '2012-09-2...
                                                             ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2')AND start_time BETWEEN '2012-09-22' AND '2012-09-21' ;
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') WHERE start_time BETWEEN '2012-09-22' AND '2012-09-21' ;
ERROR:  syntax error at or near "WHERE"
LINE 1: ...ERE name IN ('Tennis Court 1' , 'Tennis Court 2') WHERE star...
                                                             ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') AND WHERE start_time BETWEEN '2012-09-22' AND '2012-09-21' ;
ERROR:  syntax error at or near "WHERE"
LINE 1: ...name IN ('Tennis Court 1' , 'Tennis Court 2') AND WHERE star...
                                                             ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2');
     start_time      |      name
---------------------+----------------
 2012-07-04 09:00:00 | Tennis Court 1
 2012-07-04 15:00:00 | Tennis Court 1
 2012-07-05 17:30:00 | Tennis Court 2
 2012-07-06 08:00:00 | Tennis Court 1
 2012-07-06 14:00:00 | Tennis Court 1
 2012-07-06 15:30:00 | Tennis Court 1
 2012-07-07 08:30:00 | Tennis Court 1
 2012-07-07 12:30:00 | Tennis Court 1
 2012-07-07 14:30:00 | Tennis Court 1
 2012-07-07 08:30:00 | Tennis Court 2
 2012-07-08 13:00:00 | Tennis Court 1
 2012-07-08 17:30:00 | Tennis Court 1
 2012-07-08 15:00:00 | Tennis Court 2
 2012-07-08 17:30:00 | Tennis Court 2
 2012-07-09 12:30:00 | Tennis Court 1
 2012-07-09 15:30:00 | Tennis Court 1
 2012-07-09 19:00:00 | Tennis Court 1
 2012-07-09 13:00:00 | Tennis Court 2
 2012-07-09 19:00:00 | Tennis Court 2
 2012-07-10 11:30:00 | Tennis Court 1
 2012-07-10 16:00:00 | Tennis Court 1
 2012-07-11 08:00:00 | Tennis Court 1
 2012-07-11 10:00:00 | Tennis Court 1
 2012-07-11 12:00:00 | Tennis Court 1
 2012-07-11 14:00:00 | Tennis Court 1
 2012-07-11 15:30:00 | Tennis Court 1
 2012-07-11 18:30:00 | Tennis Court 1
 2012-07-11 12:30:00 | Tennis Court 2
 2012-07-11 16:00:00 | Tennis Court 2
 2012-07-12 13:30:00 | Tennis Court 1
 2012-07-12 16:30:00 | Tennis Court 1
 2012-07-12 11:30:00 | Tennis Court 2
 2012-07-13 10:30:00 | Tennis Court 1
 2012-07-13 14:00:00 | Tennis Court 1
 2012-07-13 17:00:00 | Tennis Court 1
 2012-07-13 15:00:00 | Tennis Court 2
 2012-07-14 08:30:00 | Tennis Court 1
 2012-07-14 11:30:00 | Tennis Court 1
 2012-07-14 15:00:00 | Tennis Court 1
 2012-07-14 10:30:00 | Tennis Court 2
 2012-07-14 12:30:00 | Tennis Court 2
 2012-07-14 14:30:00 | Tennis Court 2
 2012-07-15 08:00:00 | Tennis Court 1
 2012-07-15 16:00:00 | Tennis Court 1
 2012-07-15 19:00:00 | Tennis Court 1
 2012-07-15 10:00:00 | Tennis Court 2
 2012-07-15 12:00:00 | Tennis Court 2
 2012-07-15 15:30:00 | Tennis Court 2
 2012-07-16 11:00:00 | Tennis Court 1
 2012-07-16 19:00:00 | Tennis Court 1
 2012-07-16 08:00:00 | Tennis Court 2
 2012-07-16 12:30:00 | Tennis Court 2
 2012-07-17 12:30:00 | Tennis Court 1
 2012-07-17 18:00:00 | Tennis Court 1
 2012-07-17 10:00:00 | Tennis Court 2
 2012-07-17 14:30:00 | Tennis Court 2
 2012-07-18 13:00:00 | Tennis Court 1
 2012-07-18 17:30:00 | Tennis Court 1
 2012-07-18 14:00:00 | Tennis Court 2
:
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') DATE ('2012-09-21');
ERROR:  syntax error at or near "DATE"
LINE 1: ...ERE name IN ('Tennis Court 1' , 'Tennis Court 2') DATE ('201...
                                                             ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') WHERE start_time DATE ('2012-09-21');
ERROR:  syntax error at or near "WHERE"
LINE 1: ...ERE name IN ('Tennis Court 1' , 'Tennis Court 2') WHERE star...
                                                             ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') WHERE start_time= DATE ('2012-09-21');
ERROR:  syntax error at or near "WHERE"
LINE 1: ...ERE name IN ('Tennis Court 1' , 'Tennis Court 2') WHERE star...
                                                             ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') AND start_time= DATE ('2012-09-21');
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE facilities.name IN ('Tennis Court 1' , 'Tennis Court 2') AND booking.start_time= DATE ('2012-09-21');
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time BETWEEN '2012-09-22' AND '2012-09-21' ;
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time= '2012-09-22' ;
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time= '2012-09-21' ;
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time BETWEEN '2012-09-21' AND '2012-09-21' ;
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT * FROM booking;
  id  | facility_id | member_id |     start_time      | slots
------+-------------+-----------+---------------------+-------
    0 |           3 |         1 | 2012-07-03 11:00:00 |     2
    1 |           4 |         1 | 2012-07-03 08:00:00 |     2
    2 |           6 |         0 | 2012-07-03 18:00:00 |     2
    3 |           7 |         1 | 2012-07-03 19:00:00 |     2
    4 |           8 |         1 | 2012-07-03 10:00:00 |     1
    5 |           8 |         1 | 2012-07-03 15:00:00 |     1
    6 |           0 |         2 | 2012-07-04 09:00:00 |     3
    7 |           0 |         2 | 2012-07-04 15:00:00 |     3
    8 |           4 |         3 | 2012-07-04 13:30:00 |     2
    9 |           4 |         0 | 2012-07-04 15:00:00 |     2
   10 |           4 |         0 | 2012-07-04 17:30:00 |     2
   11 |           6 |         0 | 2012-07-04 12:30:00 |     2
   12 |           6 |         0 | 2012-07-04 14:00:00 |     2
   13 |           6 |         1 | 2012-07-04 15:30:00 |     2
   14 |           7 |         2 | 2012-07-04 14:00:00 |     2
   15 |           8 |         2 | 2012-07-04 12:00:00 |     1
   16 |           8 |         3 | 2012-07-04 18:00:00 |     1
   17 |           1 |         0 | 2012-07-05 17:30:00 |     3
   18 |           2 |         1 | 2012-07-05 09:30:00 |     3
   19 |           3 |         3 | 2012-07-05 09:00:00 |     2
   20 |           3 |         1 | 2012-07-05 19:00:00 |     2
   21 |           4 |         3 | 2012-07-05 18:30:00 |     2
   22 |           6 |         0 | 2012-07-05 13:00:00 |     2
   23 |           6 |         1 | 2012-07-05 14:30:00 |     2
   24 |           7 |         2 | 2012-07-05 18:30:00 |     2
   25 |           8 |         3 | 2012-07-05 12:30:00 |     1
   26 |           0 |         0 | 2012-07-06 08:00:00 |     3
   27 |           0 |         0 | 2012-07-06 14:00:00 |     3
   28 |           0 |         2 | 2012-07-06 15:30:00 |     3
   29 |           2 |         1 | 2012-07-06 17:00:00 |     3
   30 |           3 |         1 | 2012-07-06 11:00:00 |     2
   31 |           4 |         3 | 2012-07-06 12:00:00 |     2
   32 |           6 |         1 | 2012-07-06 14:00:00 |     2
   33 |           7 |         2 | 2012-07-06 08:30:00 |     2
   34 |           7 |         2 | 2012-07-06 13:30:00 |     2
   35 |           8 |         3 | 2012-07-06 15:30:00 |     1
   36 |           0 |         2 | 2012-07-07 08:30:00 |     3
   37 |           0 |         0 | 2012-07-07 12:30:00 |     3
   38 |           0 |         2 | 2012-07-07 14:30:00 |     3
   39 |           1 |         3 | 2012-07-07 08:30:00 |     3
   40 |           2 |         1 | 2012-07-07 09:00:00 |     3
   41 |           2 |         1 | 2012-07-07 11:30:00 |     3
   42 |           2 |         1 | 2012-07-07 16:00:00 |     3
   43 |           3 |         2 | 2012-07-07 12:30:00 |     2
   44 |           4 |         3 | 2012-07-07 11:30:00 |     2
   45 |           4 |         3 | 2012-07-07 14:00:00 |     2
   46 |           4 |         0 | 2012-07-07 17:30:00 |     2
   47 |           6 |         0 | 2012-07-07 08:30:00 |     2
   48 |           6 |         1 | 2012-07-07 10:30:00 |     2
   49 |           6 |         1 | 2012-07-07 14:30:00 |     2
   50 |           6 |         0 | 2012-07-07 16:00:00 |     2
   51 |           7 |         2 | 2012-07-07 11:30:00 |     2
   52 |           8 |         3 | 2012-07-07 16:00:00 |     1
   53 |           8 |         3 | 2012-07-07 17:30:00 |     2
   54 |           0 |         3 | 2012-07-08 13:00:00 |     3
   55 |           0 |         2 | 2012-07-08 17:30:00 |     3
   56 |           1 |         1 | 2012-07-08 15:00:00 |     3
   57 |           1 |         1 | 2012-07-08 17:30:00 |     3
   58 |           3 |         1 | 2012-07-08 11:30:00 |     2
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time BETWEEN '2012-09-21 00:00:01' AND '2012-09-22 00:00:01' ;
     start_time      |      name
     start_time      |      name
---------------------+-----------------
 2012-09-21 08:00:00 | Tennis Court 1
 2012-09-21 09:30:00 | Tennis Court 1
 2012-09-21 12:00:00 | Tennis Court 1
 2012-09-21 13:30:00 | Tennis Court 1
 2012-09-21 15:30:00 | Tennis Court 1
 2012-09-21 17:00:00 | Tennis Court 1
 2012-09-21 08:00:00 | Tennis Court 2
 2012-09-21 10:00:00 | Tennis Court 2
 2012-09-21 11:30:00 | Tennis Court 2
 2012-09-21 14:00:00 | Tennis Court 2
 2012-09-21 16:00:00 | Tennis Court 2
 2012-09-21 18:00:00 | Tennis Court 2
 2012-09-21 09:00:00 | Badminton Court
 2012-09-21 10:30:00 | Badminton Court
 2012-09-21 12:00:00 | Badminton Court
 2012-09-21 14:00:00 | Badminton Court
 2012-09-21 09:00:00 | Table Tennis
 2012-09-21 10:00:00 | Table Tennis
 2012-09-21 11:00:00 | Table Tennis
 2012-09-21 13:00:00 | Table Tennis
 2012-09-21 14:00:00 | Table Tennis
 2012-09-21 15:30:00 | Table Tennis
 2012-09-21 16:30:00 | Table Tennis
 2012-09-21 18:30:00 | Table Tennis
 2012-09-21 19:30:00 | Table Tennis
 2012-09-21 08:30:00 | Massage Room 1
 2012-09-21 09:30:00 | Massage Room 1
 2012-09-21 10:30:00 | Massage Room 1
 2012-09-21 11:30:00 | Massage Room 1
 2012-09-21 13:00:00 | Massage Room 1
 2012-09-21 14:30:00 | Massage Room 1
 2012-09-21 15:30:00 | Massage Room 1
 2012-09-21 16:30:00 | Massage Room 1
 2012-09-21 17:30:00 | Massage Room 1
 2012-09-21 18:30:00 | Massage Room 1
 2012-09-21 19:30:00 | Massage Room 1
 2012-09-21 12:00:00 | Massage Room 2
 2012-09-21 17:30:00 | Massage Room 2
 2012-09-21 09:30:00 | Squash Court
 2012-09-21 10:30:00 | Squash Court
 2012-09-21 11:30:00 | Squash Court
 2012-09-21 14:00:00 | Squash Court
 2012-09-21 15:30:00 | Squash Court
 2012-09-21 17:30:00 | Squash Court
 2012-09-21 18:30:00 | Squash Court
 2012-09-21 08:30:00 | Snooker Table
 2012-09-21 09:30:00 | Snooker Table
 2012-09-21 11:30:00 | Snooker Table
 2012-09-21 13:00:00 | Snooker Table
 2012-09-21 14:30:00 | Snooker Table
 2012-09-21 16:00:00 | Snooker Table
 2012-09-21 17:00:00 | Snooker Table
 2012-09-21 19:00:00 | Snooker Table
 2012-09-21 08:30:00 | Pool Table
 2012-09-21 09:30:00 | Pool Table
 2012-09-21 10:30:00 | Pool Table
 2012-09-21 11:00:00 | Pool Table
 2012-09-21 12:30:00 | Pool Table
 2012-09-21 13:00:00 | Pool Table
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') AND WHERE start_time BETWEEN '2012-09-22 00:00:01' AND '2012-09-21 00:00:01';
ERROR:  syntax error at or near "WHERE"
LINE 1: ...name IN ('Tennis Court 1' , 'Tennis Court 2') AND WHERE star...
                                                             ^
countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE name IN ('Tennis Court 1' , 'Tennis Court 2') AND start_time BETWEEN '2012-09-22 00:00:01' AND '2012-09-21 00:00:01';
 start_time | name
------------+------
(0 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time BETWEEN '2012-09-21 00:00:01' AND '2012-09-22 00:00:01' AND name IN('Tennis Court 1' , 'Tennis Court 2');
     start_time      |      name
---------------------+----------------
 2012-09-21 08:00:00 | Tennis Court 1
 2012-09-21 09:30:00 | Tennis Court 1
 2012-09-21 12:00:00 | Tennis Court 1
 2012-09-21 13:30:00 | Tennis Court 1
 2012-09-21 15:30:00 | Tennis Court 1
 2012-09-21 17:00:00 | Tennis Court 1
 2012-09-21 08:00:00 | Tennis Court 2
 2012-09-21 10:00:00 | Tennis Court 2
 2012-09-21 11:30:00 | Tennis Court 2
 2012-09-21 14:00:00 | Tennis Court 2
 2012-09-21 16:00:00 | Tennis Court 2
 2012-09-21 18:00:00 | Tennis Court 2
(12 rows)

countryclub=# SELECT booking.start_time, facilities.name FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time BETWEEN '2012-09-21 00:00:01' AND '2012-09-22 00:00:01' AND name IN ('Tennis Court 1' , 'Tennis Court 2');
     start_time      |      name
---------------------+----------------
 2012-09-21 08:00:00 | Tennis Court 1
 2012-09-21 09:30:00 | Tennis Court 1
 2012-09-21 12:00:00 | Tennis Court 1
 2012-09-21 13:30:00 | Tennis Court 1
 2012-09-21 15:30:00 | Tennis Court 1
 2012-09-21 17:00:00 | Tennis Court 1
 2012-09-21 08:00:00 | Tennis Court 2
 2012-09-21 10:00:00 | Tennis Court 2
 2012-09-21 11:30:00 | Tennis Court 2
 2012-09-21 14:00:00 | Tennis Court 2
 2012-09-21 16:00:00 | Tennis Court 2
 2012-09-21 18:00:00 | Tennis Court 2
(12 rows)

countryclub=# SELECT facilities.name, booking.start_time FROM booking INNER JOIN facilities on booking.facility_id = facilities.id WHERE start_time BETWEEN '2012-09-21 00:00:01' AND '2012-09-22 00:00:01' AND name IN ('Tennis Court 1' , 'Tennis Court 2');
      name      |     start_time
----------------+---------------------
 Tennis Court 1 | 2012-09-21 08:00:00
 Tennis Court 1 | 2012-09-21 09:30:00
 Tennis Court 1 | 2012-09-21 12:00:00
 Tennis Court 1 | 2012-09-21 13:30:00
 Tennis Court 1 | 2012-09-21 15:30:00
 Tennis Court 1 | 2012-09-21 17:00:00
 Tennis Court 2 | 2012-09-21 08:00:00
 Tennis Court 2 | 2012-09-21 10:00:00
 Tennis Court 2 | 2012-09-21 11:30:00
 Tennis Court 2 | 2012-09-21 14:00:00
 Tennis Court 2 | 2012-09-21 16:00:00
 Tennis Court 2 | 2012-09-21 18:00:00
(12 rows)

countryclub=#
