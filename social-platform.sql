use db;

-- Selezionare gli utenti che hanno postato almeno un video --

SELECT DISTINCT u.*
FROM users u
JOIN posts p ON u.id = p.user_id
JOIN media_post mp ON p.id = mp.post_id
JOIN medias m ON mp.media_id = m.id
WHERE m.type = 'video';

-- Seleziona tutti i post senza Like --

SELECT p.*
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
WHERE l.post_id IS NULL;


-- Conta il numero di like per ogni post-- 

SELECT p.id AS post_id, COUNT(l.user_id) AS numero_like
FROM posts p
JOIN likes l ON p.id = l.post_id
GROUP BY p.id
ORDER BY numero_like DESC;

-- Ordina gli utenti per il numero di media caricati --

SELECT u.id AS user_id, u.username, COUNT(m.id) AS numero_media
FROM users u
JOIN medias m ON u.id = m.user_id
GROUP BY u.id
ORDER BY numero_media DESC;

-- Ordina gli utenti per totale di likes ricevuti nei loro posts --

SELECT u.id AS user_id, u.username, COUNT(l.user_id) AS totale_likes
FROM users u
JOIN posts p ON u.id = p.user_id
JOIN likes l ON p.id = l.post_id
GROUP BY u.id
ORDER BY totale_likes DESC;
