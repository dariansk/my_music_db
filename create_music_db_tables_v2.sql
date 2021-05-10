create table if not exists Genre (
	id serial primary key,
	genre_name varchar(200) not null
);

create table if not exists Artist (
	id serial primary key,
	artist_name varchar(300) not null
);

create table if not exists Album (
	id serial primary key,
	album_name varchar(300) not null,
	album_year integer check(album_year > 0)
);

create table if not exists Track (
	id serial primary key,
	track_name varchar(500) not null,
	track_duration integer,
	album_id integer references Album(id)
);

create table if not exists Collection (
	id serial primary key,
	collection_name varchar(500) not null,
	collection_year integer check(collection_year > 0)
);

create table if not exists GenreArtist (
	genre_id integer references Genre(id),
	artist_id integer references Artist(id),
	constraint pk primary key (genre_id, artist_id)
);

create table if not exists ArtistAlbum (
	artist_id integer references Artist(id),
	album_id integer references Album(id),
	constraint pk1 primary key (artist_id, album_id)
);

create table if not exists CollectionTrack (
	collection_id integer references Collection(id),
	track_id integer references Track(id),
	constraint pk2 primary key (collection_id, track_id)
);