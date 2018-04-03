SELECT c.description, COUNT(*) AS cancelled_flights, COLLECT_SET(a.city) AS departure_cities
FROM flights f
JOIN carriers c ON f.unique_carrier = c.code
JOIN airports a ON f.origin = a.iata
WHERE f.cancelled = 1
GROUP BY c.description
HAVING cancelled_flights > 1
ORDER BY cancelled_flights DESC;