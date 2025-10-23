-- 1. Mostra tutti gli artisti anche senza album
SELECT ar.*, al.name as album_name
FROM artists ar
LEFT JOIN albums al ON ar._id = al.artist;

-- 2. Trova gli artisti che NON hanno album
SELECT ar.*
FROM artists ar
LEFT JOIN albums al ON ar._id = al.artist
WHERE al._id IS NULL;

-- 3. Elenca tutti gli album anche senza canzoni
SELECT al.*, s.title as song_title
FROM albums al
LEFT JOIN songs s ON al._id = s.album;

-- 4. Conta gli album per artista (inclusi artisti senza album)
SELECT ar.name, COUNT(al._id) as numero_album
FROM artists ar
LEFT JOIN albums al ON ar._id = al.artist
GROUP BY ar._id, ar.name
ORDER BY numero_album DESC;

-- 5. Mostra gli album senza canzoni
SELECT al.*
FROM albums al
LEFT JOIN songs s ON al._id = s.album
WHERE s._id IS NULL;

-- 6. Trova quanti artisti hanno 0 album
SELECT COUNT(*) as artisti_senza_album
FROM artists ar
LEFT JOIN albums al ON ar._id = al.artist
WHERE al._id IS NULL;

-- 7. Elenca tutti gli artisti con conteggio album (anche 0)
SELECT ar.name, COUNT(al._id) as numero_album
FROM artists ar
LEFT JOIN albums al ON ar._id = al.artist
GROUP BY ar._id, ar.name
ORDER BY ar.name;

-- 8. Mostra gli album con conteggio canzoni (anche 0)
SELECT al.name, COUNT(s._id) as numero_canzoni
FROM albums al
LEFT JOIN songs s ON al._id = s.album
GROUP BY al._id, al.name
ORDER BY al.name;

-- 9. Trova gli artisti con nome 'Dio' e i loro album (se esistono)
SELECT ar.name, al.name as album_name
FROM artists ar
LEFT JOIN albums al ON ar._id = al.artist
WHERE ar.name = 'Dio';

-- 10. Elenca tutti gli album con nome artista (se disponibile)
SELECT al.name as album_name, ar.name as artist_name
FROM albums al
LEFT JOIN artists ar ON al.artist = ar._id;