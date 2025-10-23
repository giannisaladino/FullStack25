-- 1. Trova gli artisti che hanno più di 5 album
SELECT ar.name, COUNT(al._id) as numero_album
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist
GROUP BY ar._id, ar.name
HAVING COUNT(al._id) > 5
ORDER BY numero_album DESC;

-- 2. Mostra gli album con più di 8 canzoni
SELECT al.name as album_name, ar.name as artist_name, COUNT(s._id) as numero_canzoni
FROM albums al
INNER JOIN artists ar ON al.artist = ar._id
INNER JOIN songs s ON al._id = s.album
GROUP BY al._id, al.name, ar.name
HAVING COUNT(s._id) > 8
ORDER BY numero_canzoni DESC;

-- 3. Trova i numeri di traccia che appaiono in più di 50 canzoni
SELECT track, COUNT(*) as occorrenze
FROM songs
GROUP BY track
HAVING COUNT(*) > 50
ORDER BY occorrenze DESC;

-- 4. Mostra gli artisti che hanno almeno 3 album e almeno 20 canzoni totali
SELECT ar.name, COUNT(DISTINCT al._id) as numero_album, COUNT(s._id) as totale_canzoni
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist
INNER JOIN songs s ON al._id = s.album
GROUP BY ar._id, ar.name
HAVING COUNT(DISTINCT al._id) >= 3 AND COUNT(s._id) >= 20
ORDER BY totale_canzoni DESC;

-- 5. Trova gli album dove la media dei track number è maggiore di 5
SELECT al.name as album_name, ar.name as artist_name, AVG(s.track) as media_track
FROM albums al
INNER JOIN artists ar ON al.artist = ar._id
INNER JOIN songs s ON al._id = s.album
GROUP BY al._id, al.name, ar.name
HAVING AVG(s.track) > 5
ORDER BY media_track DESC;

-- 6. Mostra gli artisti il cui nome medio degli album è più lungo di 15 caratteri
SELECT ar.name, AVG(LENGTH(al.name)) as lunghezza_media, COUNT(al._id) as numero_album
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist
GROUP BY ar._id, ar.name
HAVING AVG(LENGTH(al.name)) > 15
ORDER BY lunghezza_media DESC;

-- 7. Trova i track number che hanno esattamente 5 canzoni
SELECT track, COUNT(*) as numero_canzoni
FROM songs
GROUP BY track
HAVING COUNT(*) = 5
ORDER BY track;

-- 8. Mostra gli artisti che hanno tra 2 e 4 album (inclusi)
SELECT ar.name, COUNT(al._id) as numero_album
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist
GROUP BY ar._id, ar.name
HAVING COUNT(al._id) BETWEEN 2 AND 4
ORDER BY numero_album DESC, ar.name;

-- 9. Trova gli album con meno di 5 canzoni
SELECT al.name as album_name, ar.name as artist_name, COUNT(s._id) as numero_canzoni
FROM albums al
INNER JOIN artists ar ON al.artist = ar._id
LEFT JOIN songs s ON al._id = s.album
GROUP BY al._id, al.name, ar.name
HAVING COUNT(s._id) < 5
ORDER BY numero_canzoni, al.name;

-- 10. Mostra gli artisti che hanno più canzoni totali di Led Zeppelin (usa subquery)
SELECT ar.name, COUNT(s._id) as totale_canzoni
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist
INNER JOIN songs s ON al._id = s.album
GROUP BY ar._id, ar.name
HAVING COUNT(s._id) > (
    SELECT COUNT(s2._id)
    FROM artists ar2
    INNER JOIN albums al2 ON ar2._id = al2.artist
    INNER JOIN songs s2 ON al2._id = s2.album
    WHERE ar2.name = 'Led Zeppelin'
)
ORDER BY totale_canzoni DESC;