-- 1. Seleziona tutti gli artisti dalla tabella artists
SELECT * 
FROM artists

-- 2. Mostra solo i nomi degli artisti
SELECT name 
FROM artists

-- 3. Trova tutti gli album con il loro nome
SELECT * 
FROM albums

-- 4. Elenca tutte le canzoni mostrando titolo e numero di traccia
SELECT title, track 
FROM songs

-- 5. Mostra i primi 5 artisti
SELECT * 
FROM artists LIMIT 5

-- 6. Trova l'artista con _id = 10
SELECT * 
FROM artists 
WHERE _id = 10

-- 7. Seleziona tutti gli album dove artist = 36 (Black Sabbath)
SELECT * 
FROM albums 
WHERE artist = 36


-- 8. Mostra le canzoni con track maggiore di 5
SELECT * 
FROM songs 
WHERE track > 5

-- 9. Trova tutti gli album il cui nome contiene "Live"
SELECT * 
FROM albums 
WHERE name LIKE '%Live%'

-- 10. Elenca le canzoni ordinate per titolo
SELECT * 
FROM songs 
ORDER BY title ASC --DESC