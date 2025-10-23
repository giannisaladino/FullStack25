-- 1. Mostra album con i nomi degli artisti
SELECT al.*, ar.name as artist_name 
FROM albums al
INNER JOIN artists ar ON al.artist = ar._id;

-- 2. Elenca le canzoni con il nome dell'album
SELECT s.*, al.name as album_name 
FROM songs s
INNER JOIN albums al ON s.album = al._id
ORDER BY album_name, s.track --opzionale
;

-- 3. Mostra artisti con i loro album (artist name e album name)
SELECT ar.name as artist_name, al.name as album_name 
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist
ORDER BY artist_name, album_name;

-- 4. Trova tutte le canzoni con artista e album
SELECT s.title, s.track, al.name as album_name, ar.name as artist_name
FROM songs s
INNER JOIN albums al ON s.album = al._id
INNER JOIN artists ar ON al.artist = ar._id
ORDER BY artist_name, album_name,s.track --opzionale
; 

-- 5. Mostra le canzoni di 'Led Zeppelin'
SELECT s.*, al.name as album_name
FROM songs s
INNER JOIN albums al ON s.album = al._id
INNER JOIN artists ar ON al.artist = ar._id
WHERE ar.name = 'Led Zeppelin';

-- 6. Elenca album e artisti ordinati per nome artista
SELECT ar.name as artist_name, al.name as album_name
FROM albums al
INNER JOIN artists ar ON al.artist = ar._id
ORDER BY ar.name, al.name;

-- 7. Trova le prime tracce (track=1) con nome album e artista
SELECT s.title, al.name as album_name, ar.name as artist_name
FROM songs s
INNER JOIN albums al ON s.album = al._id
INNER JOIN artists ar ON al.artist = ar._id
WHERE s.track = 1;

-- 8. Mostra canzoni di artisti il cui nome inizia con 'Black'
SELECT s.title, ar.name as artist_name, al.name as album_name
FROM songs s
INNER JOIN albums al ON s.album = al._id
INNER JOIN artists ar ON al.artist = ar._id
WHERE ar.name LIKE 'Black%';

-- 9. Conta quante canzoni ha ogni artista
SELECT ar.name, COUNT(s._id) as numero_canzoni
FROM artists ar
INNER JOIN albums al ON ar._id = al.artist
INNER JOIN songs s ON al._id = s.album
GROUP BY ar.name
ORDER BY numero_canzoni DESC;

-- 10. Trova gli album di artisti con 'Zeppelin' nel nome
SELECT ar.name as artist_name, al.name as album_name
FROM albums al
INNER JOIN artists ar ON al.artist = ar._id
WHERE ar.name LIKE '%Zeppelin%';