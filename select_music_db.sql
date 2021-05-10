--Задание 2
--
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.
--Внимание! Результаты запросов не должны быть пустыми (учтите при заполнении таблиц).
--
--название и год выхода альбомов, вышедших в 2018 году;
--название и продолжительность самого длительного трека;
--название треков, продолжительность которых не менее 3,5 минуты;
--названия сборников, вышедших в период с 2018 по 2020 год включительно;
--исполнители, чье имя состоит из 1 слова;
--название треков, которые содержат слово "мой"/"my".

SELECT album_name, album_year
    FROM album
    WHERE album_year = 2018;

SELECT track_name, track_duration
    FROM track
    ORDER BY track_duration DESC
    LIMIT 1;

SELECT track_name
    FROM track
    WHERE track_duration >= 210;

SELECT collection_name
    FROM collection
    WHERE collection_year BETWEEN 2018 AND 2020;

SELECT artist_name
    FROM artist
    WHERE artist_name NOT LIKE '%% %%' AND artist_name NOT LIKE '%%-%%';

SELECT track_name
    FROM track
    WHERE track_name iLIKE '%%my%%' OR track_name iLIKE '%%мой%%';


