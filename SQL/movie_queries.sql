ALTER TABLE "title_ratings"
ADD PRIMARY KEY (tconst);

ALTER TABLE "title_basics"
ADD PRIMARY KEY (tconst);

ALTER TABLE "movie_grosses"
ADD PRIMARY KEY ("Title", "Year");

/* gets 996 of 1000 movies titles + their grosses and ratings. */
SELECT DISTINCT ON (mg."grossint") tr."tconst", mg.*, tr."averageRating", tr."numVotes", tb."titleType"
FROM "movie_grosses" mg
LEFT JOIN "title_basics" tb ON ((tb."originalTitle" = mg."Title" OR tb."primaryTitle" = mg."Title") 
								AND (tb."startYear" = mg."Year" OR (tb."startYear"::int8)+1 = mg."Year"::int8 OR (tb."startYear"::int8)+2 = mg."Year"::int8))
INNER JOIN "title_ratings" tr ON tr."tconst" = tb."tconst"
WHERE tb."titleType" = 'movie'
ORDER BY mg."grossint" DESC;

/* specifically for two movies: 'Everest', which didn't matching years between tables, 
and 'Once Upon a Time... in Hollywood', which didnlt have matching titles. */
SELECT DISTINCT ON (tr."numVotes") tb."originalTitle", tr."tconst", tr."averageRating", tr."numVotes"
FROM "title_basics" tb 
INNER JOIN "title_ratings" tr ON tr."tconst" = tb."tconst"
WHERE tb."titleType" = 'movie' AND (tb."originalTitle" in ('Everest', 'Once Upon a Time... in Hollywood') OR tb."primaryTitle" in ('Everest', 'Once Upon a Time ...in Hollywood'))
ORDER BY tr."numVotes" DESC;

/* final table excludes latest Star Wars and Jumanji because they weren't included in ratings table*/
ALTER TABLE "movie_grosses_ratings"
ADD PRIMARY KEY (tconst);