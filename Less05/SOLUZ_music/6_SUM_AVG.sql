-- 1. Qual è il numero medio di traccia nelle canzoni?
SELECT AVG(track) as media_track 
FROM songs

-- 2. Somma tutti gli _id degli artisti
SELECT SUM(_id) as somma_id 
FROM artists;

-- 3. Calcola la media degli artist_id negli album
SELECT AVG(artist) as media_artist_id FROM albums;

-- 4. Qual è il track number massimo nel database?
SELECT MAX(track) as track_massimo FROM songs;

-- 5. Somma tutti i track numbers delle canzoni
SELECT SUM(track) as somma_tracks FROM songs;

-- 6. Calcola il numero medio di canzoni per album
SELECT AVG(canzoni_per_album) as media 
FROM (
    SELECT album, COUNT(*) as canzoni_per_album 
    FROM songs 
    GROUP BY album
);

-- 7. Qual è il minimo valore di _id tra gli artisti?
SELECT MIN(_id) as id_minimo FROM artists;

-- 8. Trova la media dei track per ogni album
SELECT album, AVG(track) as media_track 
FROM songs 
GROUP BY album;

-- 9. Somma i track delle prime 3 canzoni di ogni album
SELECT album, SUM(track) as somma_primi_3 
FROM songs 
WHERE track <= 3 
GROUP BY album;

-- 10. Calcola la media dell'id degli album
SELECT AVG(_id) as media_id FROM albums;