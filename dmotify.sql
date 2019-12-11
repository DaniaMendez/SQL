CREATE TABLE users (
    email CHARACTER(250) PRIMARY KEY NOT NULL,
    name CHARACTER(250) NOT NULL,
    pass CHARACTER(250) NOT NULL,
    sex CHARACTER(250)
    );

CREATE TABLE genres (
    type_of_music CHARACTER(250) PRIMARY KEY NOT NULL
    );

CREATE TABLE genres_x_users (
    user_email CHARACTER(250) NOT NULL,
    genre_type_of_music CHARACTER(250) NOT NULL,
    PRIMARY KEY (user_email, genre_type_of_music),
    FOREIGN KEY (user_email) REFERENCES users(email),
    FOREIGN KEY (genre_type_of_music) REFERENCES genres(type_of_music)
    );

CREATE TABLE songs (
    song_code  INTEGER NOT NULL AUTO_INCREMENT,
    title CHARACTER(250) NOT NULL,
    lyrics TEXT,
    genre_type_of_music CHARACTER(250) NOT NULL,
    PRIMARY KEY (song_code, genre_type_of_music),
    FOREIGN KEY (genre_type_of_music ) REFERENCES genres(type_of_music)
    );

CREATE TABLE playlists (
    name CHARACTER(250) PRIMARY KEY NOT NULL
    );

CREATE TABLE genres_x_playlists (
    genre_type_of_music CHARACTER(250) NOT NULL,
    playlist_name CHARACTER(250) NOT NULL,
    PRIMARY KEY (genre_type_of_music, playlist_name),
    FOREIGN KEY (genre_type_of_music) REFERENCES genres(type_of_music),
    FOREIGN KEY (playlist_name) REFERENCES playlists(name)
    );

CREATE TABLE users_x_playlists (
    user_email CHARACTER(250) NOT NULL,
    playlist_name CHARACTER(250) NOT NULL,
    PRIMARY KEY (user_email, playlist_name),
    FOREIGN KEY (user_email) REFERENCES users(email),
    FOREIGN KEY (playlist_name) REFERENCES playlists(name)
    );

CREATE TABLE playlists_x_songs (
    song_song_code INTEGER NOT NULL,
    playlist_name CHARACTER(250) NOT NULL,
    PRIMARY KEY (song_song_code, playlist_name),
    FOREIGN KEY (song_song_code) REFERENCES songs(song_code),
    FOREIGN KEY (playlist_name) REFERENCES playlists(name)
    );

CREATE TABLE artists (
    name CHARACTER(250) PRIMARY KEY NOT NULL,
    Type CHARACTER(250) 
    );

CREATE TABLE songs_x_artists (
    song_song_code INTEGER NOT NULL,
    artist_name CHARACTER(250) NOT NULL,
    PRIMARY KEY (song_song_code, artist_name),
    FOREIGN KEY (song_song_code) REFERENCES songs(song_code),
    FOREIGN KEY (artist_name) REFERENCES artists(name)
    );

INSERT INTO users (email, name, pass, sex)
VALUES ('dm2cuiti@gmail.com','Dania', 'dani123', 'f');
INSERT INTO users (email, name, pass, sex)
VALUES ('efmcuiti@gmail.com','Edison', 'edii123', 'n');
INSERT INTO users (email, name, pass, sex)
VALUES ('vmendezpinto@gmail.com','Victor', 'vic123', 'm');
INSERT INTO users (email, name, pass)
VALUES ('olcuitiva@gmail.com','Olga', 'ol123');
INSERT INTO users (email, name, pass, sex)
VALUES ('giova@gmail.com','Deisy', 'dei123', 'f');

INSERT INTO genres (type_of_music)
VALUES ('rock');
INSERT INTO genres (type_of_music)
VALUES ('blues');
INSERT INTO genres (type_of_music)
VALUES ('popular');
INSERT INTO genres (type_of_music)
VALUES ('reggae');
INSERT INTO genres (type_of_music)
VALUES ('reggaeton');

INSERT INTO songs (title, lyrics, genre_type_of_music)
VALUES ("Heaven's on fire", 'I look at you and my blood boilds hot...', 'rock');
INSERT INTO songs (title, genre_type_of_music)
VALUES ("My way", 'blues');


ALTER TABLE users
ADD CONSTRAINT CHK_users_sex
CHECK (sex = 'f' OR sex = 'm' OR sex = 'n');









