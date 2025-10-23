-- 1. Trova tutti i valori unici di artist dalla tabella albums
SELECT DISTINCT artist 
FROM albums

-- 2. Quanti artisti diversi hanno album nel database?
SELECT COUNT(DISTINCT artist) 
FROM albums

-- 3. Mostra gli album_id unici dalla tabella songs
SELECT DISTINCT album 
FROM songs

-- 4. Trova tutti i numeri di traccia unici presenti
SELECT DISTINCT track 
FROM songs 
ORDER BY track

-- 5. Elenca gli artisti che hanno almeno un album
SELECT DISTINCT ar.* 
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist

-- 6. Trova i track numbers che appaiono più volte
SELECT track, COUNT(*) as occorrenze 
FROM songs 
GROUP BY track 
HAVING COUNT(*) > 1

-- 7. Mostra gli artist_id che hanno sia album che canzoni
SELECT DISTINCT al.artist 
FROM albums al
INNER JOIN songs s ON al._id = s.album

-- 8. Conta quanti album diversi ci sono
SELECT COUNT(DISTINCT _id) 
FROM albums

-- 9. Trova gli artisti con nome che inizia per 'B' (valori distinti)
SELECT DISTINCT name 
FROM artists 
WHERE name LIKE 'B%'

-- 10. Mostra tutti i numeri di traccia ordinati
SELECT DISTINCT track 
FROM songs 
ORDER BY track