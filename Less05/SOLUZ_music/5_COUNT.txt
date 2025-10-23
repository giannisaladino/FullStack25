-- 1. Conta quanti artisti ci sono in totale
SELECT COUNT(*) as totale_artisti FROM artists;

-- 2. Quanti album ha l'artista 56 (Rolling Stones)?
SELECT COUNT(*) as numero_album FROM albums WHERE artist = 56;

-- 3. Conta quante canzoni ci sono nel database
SELECT COUNT(*) as totale_canzoni FROM songs;

-- 4. Quanti album ci sono in totale?
SELECT COUNT(*) as totale_album FROM albums;

-- 5. Conta gli artisti il cui nome inizia con 'B'
SELECT COUNT(*) as artisti_con_B FROM artists WHERE name LIKE 'B%';

-- 6. Quante canzoni hanno track = 1?
SELECT COUNT(*) as prime_tracce FROM songs WHERE track = 1;

-- 7. Conta gli album per ogni artista (GROUP BY artist)
SELECT artist, COUNT(*) as numero_album 
FROM albums 
GROUP BY artist;

-- 8. Quanti artisti hanno nome con più di 10 caratteri?
SELECT COUNT(*) as artisti_nome_lungo 
FROM artists 
WHERE LENGTH(name) > 10;

-- 9. Conta le canzoni per ogni album
SELECT album, COUNT(*) as numero_canzoni 
FROM songs 
GROUP BY album;

-- 10. Quanti artisti diversi hanno almeno un album?
SELECT COUNT(DISTINCT artist) as artisti_con_album FROM albums;