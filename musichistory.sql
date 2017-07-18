select *
from Genre;
select *
from Artist;
select *
from Album;
select *
from Artist;
select *
from Song;

--Query all of the entries in the Genre table
select g.Label, g.GenreId
from Genre g;

--using the INSERT statement, add one of your fav artists to the Artist table
insert into Artist
values (null, "Bruno Mars", 2010);

--using the INSERT statement, add one, or more albums by your artist to the album table
insert into Album
values (null, "24K Magic", 2016, 50, "Bruno Mars", 30, 7);

--Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song
values (null, "That's What I Like", 4, 2016, 7, 30, 24);

--brings back the joined table
select a.ArtistName, al.Title
from Artist a, Album al

--filter by artistID
select Title
From Album
where artistId = 1;

select a.ArtistName, al.Title
from Artist a, Album al
where a.ArtistId = al.ArtistId
order by a.ArtistName desc;

--Write a select query that provides the song title, album title, and artitst name

select s.Title "Song Title", al.Title "Album Title", a.ArtistName
from Song s, Album al, Artist a
where s.AlbumId = al.AlbumId
and s.ArtistId = a.ArtistId;

select s.Title "Song Title", al.Title "Album Title", a.ArtistName
from Song s
left join Album al
on s.AlbumId = al.AlbumId
left join Artist a
on s.ArtistId = a.ArtistId;

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

select al.Title, count(s.AlbumId)
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.Title;

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
select s.Title "Song Title", al.Title "Album Title", a.ArtistName "Artist Name"
from Song s, Album al, Artist a
where s.AlbumId = al.AlbumId
and al.ArtistId = a.ArtistId
and a.ArtistId = 30;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select a.ArtistName, count(s.ArtistId)
from Artist a, Song s
where a.ArtistId = s.ArtistId
group by a.ArtistName;
 
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select g.Label, count(s.GenreId)
from Genre g, Song s
where g.GenreId = s.GenreId
group by g.Label;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select al.Title, max(al.AlbumLength)
from Album al;

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
select s.Title, max(s.SongLength)
from Song s;

--Modify the previous query to also display the title of the album.
select s.Title as "Song Tite",  al.Title as "Album Title", max(s.SongLength)
from Song s, Album al
where s.AlbumId = al.AlbumId;