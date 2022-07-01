Project Requirements



Quiz-2:

SELECT email_domain, COUNT(*) AS "Top 25 Schools"
FROM users
GROUP BY 1
ORDER BY 2 DESC
LIMIT 25;

SELECT city, COUNT(user_id) as no_of_users
FROM users
WHERE city = 'New York';

SELECT mobile_app, COUNT(mobile_app) as no_of_users
FROM users
GROUP BY 1;

SELECT strftime('%H', sign_up_at), COUNT(*)
FROM users
GROUP BY 1;


WITH cpp AS 
(
SELECT u.email_domain, COUNT(*) AS cpp
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_cpp = 'started' OR p.learn_cpp = 'completed'
GROUP BY 1
ORDER BY 1
), 
sql AS 
(
SELECT u.email_domain, COUNT(*) AS sql
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_sql = 'started' OR p.learn_sql = 'completed'
GROUP BY 1
ORDER BY 1
),
html AS 
(
SELECT u.email_domain, COUNT(*) AS html
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_html = 'started' OR p.learn_html = 'completed'
GROUP BY 1
ORDER BY 1
),
javascript AS 
(

SELECT u.email_domain, COUNT(*) AS javascript
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_javascript = 'started' OR p.learn_javascript = 'completed'
GROUP BY 1
ORDER BY 1
),
java AS 
(

SELECT u.email_domain, COUNT(*) AS java
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE p.learn_java = 'started' OR p.learn_java = 'completed'
GROUP BY 1
ORDER BY 1
)

SELECT c.email_domain, c.cpp, s.sql, h.html, j.javascript, i.java
FROM cpp c
JOIN sql s
ON c.email_domain = s.email_domain
JOIN html h
ON c.email_domain = h.email_domain
JOIN javascript j
ON c.email_domain = j.email_domain
JOIN java i
ON c.email_domain = i.email_domain
LIMIT 10;

WITH joined AS 
(
SELECT *
FROM users u
JOIN progress p
ON u.user_id = p.user_id
),
ny_cpp AS 
(

SELECT city, COUNT(*) AS cpp_count
FROM joined
WHERE (learn_cpp = 'completed' OR learn_cpp = 'started') AND (city = 'New York' OR city = 'Chicago')
GROUP BY 1
),
ny_sql AS 
(

SELECT city, COUNT(*) AS sql_count
FROM joined
WHERE (learn_sql = 'completed' OR learn_sql = 'started') AND (city = 'New York' OR city = 'Chicago')
GROUP BY 1
),
ny_html AS
(

SELECT city, COUNT(*) AS html_count
FROM joined
WHERE (learn_html = 'completed' OR learn_html = 'started') AND (city = 'New York' OR city = 'Chicago')
GROUP BY 1
),
ny_javascript AS
( 

SELECT city, COUNT(*) AS javascript_count
FROM joined
WHERE (learn_javascript = 'completed' OR learn_javascript = 'started') AND (city = 'New York' OR city = 'Chicago')
GROUP BY 1
),
ny_java AS
(

SELECT city, COUNT(*) AS java_count
FROM joined
WHERE (learn_java = 'completed' OR learn_java = 'started') AND (city = 'New York' OR city = 'Chicago')
GROUP BY 1
)

SELECT c.city, c.cpp_count, s.sql_count, h.html_count, j.javascript_count, i.java_count
FROM ny_cpp c
JOIN ny_sql s
ON c.city = s.city
JOIN ny_html h
ON c.city = h.city
JOIN ny_javascript j
ON c.city = j.city
JOIN ny_java i
ON c.city = i.city
;
