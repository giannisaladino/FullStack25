-- 1. Ordina tutti gli artisti alfabeticamente
SELECT * FROM artists ORDER BY name ASC;

-- 2. Mostra gli album ordinati per artist (crescente)
SELECT * FROM albums ORDER BY artist ASC;

-- 3. Elenca le canzoni ordinate per track (decrescente)
SELECT * FROM songs ORDER BY track DESC;

-- 4. Ordina gli artisti per nome in ordine inverso
SELECT * FROM artists ORDER BY name DESC;

-- 5. Mostra gli album ordinati prima per artist, poi per name
SELECT * FROM albums ORDER BY artist, name;

-- 6. Trova le prime 10 canzoni ordinate per title
SELECT * FROM songs ORDER BY title LIMIT 10;

-- 7. Ordina gli artisti per lunghezza del nome
SELECT * FROM artists ORDER BY LENGTH(name);

-- 8. Mostra le canzoni ordinate per album e poi per track
SELECT * FROM songs ORDER BY album, track;

-- 9. Elenca gli ultimi 5 artisti in ordine alfabetico
SELECT * FROM artists ORDER BY name DESC LIMIT 5;

-- 10. Ordina gli album per id decrescente
SELECT * FROM albums ORDER BY _id DESC;