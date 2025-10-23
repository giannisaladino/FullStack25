-- 1. Conta quanti album ha ogni artista
SELECT artist, COUNT(*) as numero_album 
FROM albums 
GROUP BY artist;

-- 2. Trova il numero di canzoni per ogni album
SELECT album, COUNT(*) as numero_canzoni 
FROM songs 
GROUP BY album;

-- 3. Mostra gli artisti con più di 2 album
SELECT artist, COUNT(*) as numero_album 
FROM albums 
GROUP BY artist 
HAVING COUNT(*) > 2;

-- 4. Per ogni track number, conta quante canzoni ci sono
SELECT track, COUNT(*) as numero_canzoni 
FROM songs 
GROUP BY track 
ORDER BY track;

-- 5. Trova l'album con più canzoni
SELECT album, COUNT(*) as numero_canzoni 
FROM songs 
GROUP BY album 
ORDER BY numero_canzoni DESC 
LIMIT 1;

-- 6. Raggruppa gli album per artista e conta
SELECT artist, COUNT(*) as numero_album 
FROM albums 
GROUP BY artist 
ORDER BY numero_album DESC;

-- 7. Mostra gli artisti ordinati per numero di album (decrescente)
SELECT artist, COUNT(*) as numero_album 
FROM albums 
GROUP BY artist 
ORDER BY numero_album DESC;

-- 8. Conta le canzoni per track number, solo per track < 5
SELECT track, COUNT(*) as numero_canzoni 
FROM songs 
WHERE track < 5 
GROUP BY track;

-- 9. Trova gli album con almeno 10 canzoni
SELECT album, COUNT(*) as numero_canzoni 
FROM songs 
GROUP BY album 
HAVING COUNT(*) >= 10;

-- 10. Mostra il numero medio di tracce per artista
SELECT al.artist, AVG(track_count) as media_tracce
FROM albums al
JOIN (
    SELECT album, COUNT(*) as track_count 
    FROM songs 
    GROUP BY album
) s ON al._id = s.album
GROUP BY al.artist;