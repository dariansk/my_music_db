--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.
--Внимание! Результаты запросов не должны быть пустыми (при необходимости добавьте данные в таблицы).
--
--1. количество исполнителей в каждом жанре;
SELECT g.genre_name, COUNT(a.artist_name)
    FROM Genre as g
    LEFT JOIN GenreArtist as ga on g.id = ga.genre_id
    LEFT JOIN Artist as a on ga.artist_id = a.id
    GROUP BY g.genre_name;

--2. количество треков, вошедших в альбомы 2019-2020 годов;
SELECT t.track_name, a.album_name, a.album_year
    FROM Album as a
    LEFT JOIN Track as t on t.album_id = a.id
    WHERE (a.album_year >= 2019) and (a.album_year <= 2020)
	ORDER BY a.album_name;

--3. средняя продолжительность треков по каждому альбому;
SELECT a.album_name, AVG(t.track_duration)
    FROM Album as a
    LEFT JOIN Track as t on t.album_id = a.id
    GROUP BY a.album_name
    ORDER BY AVG(t.track_duration);

-- если выбрать только альбомы, где есть хоть какие-то треки, то так:
SELECT a.album_name, AVG(t.track_duration)
    FROM Album as a
    JOIN Track as t on t.album_id = a.id
    GROUP BY a.album_name
    ORDER BY AVG(t.track_duration);

--4. все исполнители, которые не выпустили альбомы в 2020 году;
SELECT DISTINCT a.artist_name
    FROM Artist as a
    WHERE a.artist_name NOT IN (
    SELECT a.artist_name
    FROM Artist as a
    LEFT JOIN ArtistAlbum as aa on a.id = aa.artist_id
    LEFT JOIN Album as b on b.id = aa.album_id
    WHERE b.album_year = 2020
    );

--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT DISTINCT c.collection_name
    FROM Collection as c
    LEFT JOIN CollectionTrack as ct on c.id = ct.collection_id
    LEFT JOIN Track as t on t.id = ct.track_id
    LEFT JOIN Album as a on a.id = t.album_id
    LEFT JOIN ArtistAlbum as aa on aa.album_id = a.id
    LEFT JOIN Artist as art on art.id = aa.artist_id
    WHERE art.artist_name LIKE '%%Depeche Mode%%';

--6. название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.album_name
    FROM Album as a
    LEFT JOIN ArtistAlbum as aa on a.id = aa.album_id
    LEFT JOIN Artist as art on art.id = aa.artist_id
    LEFT JOIN GenreArtist as ga on art.id = ga.artist_id
    LEFT JOIN Genre as g on g.id = ga.genre_id
    GROUP BY a.album_name
    HAVING COUNT(DISTINCT g.genre_name) > 1
    ORDER BY a.album_name;

--7. наименование треков, которые не входят в сборники;
SELECT t.track_name
    FROM Track as t
    LEFT JOIN CollectionTrack as ct on t.id = ct.track_id
    WHERE ct.track_id is NULL;

--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек
--(теоретически таких треков может быть несколько);
SELECT art.artist_name, t.track_duration
    FROM Track as t
    LEFT JOIN Album as a on a.id = t.album_id
    LEFT JOIN ArtistAlbum as aa on aa.album_id = a.id
    LEFT JOIN Artist as art on art.id = aa.artist_id
    GROUP BY art.artist_name, t.track_duration
    HAVING t.track_duration = (SELECT min(track_duration) FROM Track);

--9. название альбомов, содержащих наименьшее количество треков.
SELECT DISTINCT a.album_name
    FROM Album as a
    LEFT JOIN Track as t on t.album_id = a.id
    WHERE t.album_id in (
        SELECT album_id
        FROM Track
        GROUP BY album_id
        HAVING COUNT(id) = (
        SELECT COUNT(id)
        FROM Track
        GROUP BY album_id
        ORDER BY COUNT
        LIMIT 1));
