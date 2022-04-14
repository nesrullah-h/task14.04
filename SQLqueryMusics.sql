CREATE DATABASE SPOTIFY
USE SPOTIFY

CREATE table ALBOMS(
 Id int PRIMARY KEY IDENTITY,
 [Name] nvarchar(255)Not Null,
 MusicCount int NOT NULL,
 ReleaseDate int NOT NULL
)

Create TABLE MUSICS(
 Id int PRIMARY KEY IDENTITY,
 [Name] NVARCHAR(255)Not Null,
 MusicSecond int Not Null,
 ListenerCounts int NOT NULL,
 AlbomId int REFERENCES ALBOMS(Id),
)

CREATE TABLE ARTISTS(
 Id int PRIMARY KEY IDENTITY,
 [Name] NVARCHAR(255)Not Null,
 SurName NVARCHAR(255)Not Null,
 AlbomId int REFERENCES ALBOMS(Id),
)

CREATE TABLE ArtisMusic(
 Id int PRIMARY KEY IDENTITY,
 MusicId int REFERENCES MUSICS(Id),
 ArtistId int REFERENCES ARTISTS(Id),
)
--1) Musics-in name-ni, totalSecond-nu, artist nama-ni, album name-ni göstərən bir view yazırsız.

CREATE VIEW vW_GetFullMusics AS
SELECT MUSICS.Name,	MUSICS.MusicSecond,ARTISTS.Name 'ARTISTSNAME',ALBOMS.Name 'ALBOMSNAME'
FROM MUSICS
JOIN ARTISTS ON ARTISTS.Id=MUSICS.Id
JOIN ALBOMS ON ALBOMS.Id=MUSICS.AlbomId
