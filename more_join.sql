-- Question 1
SELECT id, title
FROM movie
WHERE yr=1962

-- Question 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- Question 3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- Question 4
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- Question 5
SELECT id
FROM movie
WHERE title = 'Casablanca';

-- Question 6
SELECT name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
WHERE movieid = 11768;

-- Question 7
SELECT name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
INNER JOIN movie
ON casting.movieid = movie.id
WHERE title = 'Alien';

-- Question 8
SELECT title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON casting.actorid = actor.id
WHERE name = 'Harrison Ford';

-- Question 9
SELECT title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
AND ord != 1;

-- Question 10
SELECT title, name
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON casting.actorid = actor.id
WHERE yr = 1962
AND ord = 1;

-- Question 11
SELECT yr,COUNT(title) 
FROM movie 
INNER JOIN casting 
ON movie.id=movieid
INNER JOIN actor   
ON actorid=actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- Question 12
SELECT title, name
FROM movie
INNER JOIN casting ON id = movieid
INNER JOIN actor ON actorid = actor.id
WHERE movie.id IN (
SELECT movieid
FROM casting
WHERE actorid = (
SELECT id
FROM actor
WHERE name = 'Julie Andrews')) 
AND ord = 1;

-- Question 13
SELECT name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON  movie.id = casting.movieid
WHERE name IN (
SELECT name
FROM actor
WHERE ord = 1)
GROUP BY name
HAVING COUNT(name) >= 15;

-- Question 14
SELECT title, COUNT(name)
FROM movie
INNER JOIN casting ON id = movieid
INNER JOIN actor ON actorid = actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(name) DESC, title;

-- Question 15
SELECT name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON  movie.id = casting.movieid
WHERE movie.id IN (
SELECT movieid
FROM casting
WHERE actorid = (
SELECT actor.id
FROM actor
WHERE name = 'Art Garfunkel'))
AND name != 'Art Garfunkel';
