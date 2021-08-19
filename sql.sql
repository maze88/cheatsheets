SELECT [DISTINCT] firstName, lastName FROM members WHERE height > 170 AND (age % 2 = 0 OR age = 33);  /* returns [unique] values of columns 'firstName' & 'lastName' from the table 'members', for people higher than 170 and with an even age or exactly 33y/o. */
SELECT CONCAT("there are ", COUNT(col), " of these") FROM TABLE WHERE col IN ("x", "y") AND NOT = "z";  /* pseudo query demonstrating `CONCAT` and `IN`. */
SUBSTRING(city, 1, 1)  /* function returns first letter of `city`. */

