INSERT INTO genre (genre_name)
    VALUES
    ('Русский рок'),
    ('Инди'),
    ('Иностранный рок'),
    ('Металл'),
    ('Альтернатива'),
    ('Электроника');

INSERT INTO artist (artist_name)
    VALUES
    ('Linkin Park'),
    ('Skillet'),
    ('Nirvana'),
    ('Depeche Mode'),
    ('The Prodigy'),
    ('Billie Eilish'),
    ('Gorillaz'),
    ('Metallica'),
    ('Limp Bizkit'),
    ('Пикник');
    ('Би-2');

INSERT INTO album (album_name, album_year)
    VALUES
    ('Пекло', 2020),
    ('Burn It Down', 2012),
    ('Sounds of the Universe', 2009),
    ('Большая игра', 2015),
    ('bitches broken hearts', 2018),
    ('Victorious: The Aftermath', 2020),
    ('Unleashed Beyond', 2018),
    ('Чёрное солнце', 2018),
    ('Лётчик', 2017),
    ('Demon Days', 2005),
    ('Humanz', 2017);


INSERT INTO collection (collection_name, collection_year)
    VALUES
    ('Очередные легенды русского рока: часть 155', 2018),
    ('Очередные легенды русского рока: часть 156', 2019),
    ('RElAX music', 2020),
    ('Infinite Pleasure', 2021),
    ('Долгая дорога', 2005),
    ('Электроника', 2005),
    ('Всякое разное', 2019),
    ('Personal Jesus - meditation', 2020),
    ('Romantic Collection', 2001),
    ('2000s Hits', 2000);

INSERT INTO track (track_name, track_duration, album_id)
    VALUES
    ('Чёрное солнце Midnight Faces Remix', 266, 8),
    ('Saturnz Barz', 181, 11),
    ('Большая игра', 235, 4),
    ('Недобитый романтик', 255, 4),
    ('my strange addiction', 179, 5),
    ('My Personal Jesus', 279, 3),
    ('Spacewalker', 166, 3),
    ('My Sympathy', 260, 3),
    ('Wrong', 193, 3),
    ('November Has Come', 203, 10),
    ('Dont Get Lost In Heaven', 234, 10),
    ('Fire Coming Out Of The Monkeys Head', 209, 10),
    ('I Want to Live', 208, 7),
    ('Lions', 229, 7),
    ('Это мой мир', 260, 4),
    ('Burn It Down', 304, 7),
    ('Wrong Wrong Wrong', 193, 6),
    ('Burn It', 304, 6),
    ('Tigers', 229, 1),
    ('November Has Gone', 203, 6);

INSERT INTO GenreArtist (genre_id, artist_id)
    VALUES
    (5, 1),
    (5, 2),
    (5, 3),
    (3, 4),
    (3, 2),
    (3, 3),
    (6, 4),
    (6, 5),
    (2, 6),
    (2, 7),
    (4, 8),
    (3, 9),
    (4, 9),
    (5, 9),
    (1, 10),
    (1, 11);

INSERT INTO ArtistAlbum (artist_id, album_id)
    VALUES
    (11, 1),
    (9, 2),
    (4, 3),
    (10, 4),
    (6, 5),
    (2, 6),
    (2, 7),
    (11, 8),
    (11, 9),
    (7, 10),
    (7, 11);

INSERT INTO CollectionTrack (collection_id, track_id)
    VALUES
    (1, 1),
    (2, 1),
    (1, 2),
    (2, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (5, 8),
    (6, 9),
    (5, 10),
    (5, 3),
    (5, 4),
    (5, 5);

