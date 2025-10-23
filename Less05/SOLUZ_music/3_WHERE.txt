-- 1. Trova gli artisti il cui nome inizia con 'Black'
SELECT * 
FROM artists 
WHERE name LIKE 'Black%';

-- 2. Seleziona gli album dell'artista con id 64 (Led Zeppelin)
SELECT * 
FROM albums 
WHERE artist = 64;

-- 3. Trova le canzoni con track = 1 (prime tracce degli album)
SELECT * 
FROM songs 
WHERE track = 1;

-- 4. Mostra gli artisti con nome che contiene 'Zeppelin'
SELECT * 
FROM artists 
WHERE name LIKE '%Zeppelin%';

-- 5. Trova gli album dove artist è tra 1 e 10
SELECT * 
FROM albums 
WHERE artist BETWEEN 1 AND 10;

-- 6. Seleziona le canzoni il cui titolo finisce con 'Love'
SELECT * 
FROM songs 
WHERE title LIKE '%Love';

-- 7. Trova gli artisti il cui nome NON inizia con 'The'
SELECT * 
FROM artists 
WHERE name NOT LIKE 'The%';

-- 8. Mostra gli album con id maggiore di 50
SELECT * 
FROM albums 
WHERE _id > 50;

-- 9. Trova le canzoni dove track è dispari (track % 2 = 1)
SELECT *
FROM songs 
WHERE track % 2 = 1;

-- 10. Seleziona gli artisti con esattamente 2 parole nel nome
SELECT * 
FROM artists 
WHERE name LIKE '% %' 
AND name NOT LIKE '% % %';