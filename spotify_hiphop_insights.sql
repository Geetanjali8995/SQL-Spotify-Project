
-- 1. Artist Ranking by Average Popularity
SELECT 
    artist,
    ROUND(AVG(popularity), 2) AS avg_popularity,
    COUNT(*) AS track_count
FROM hiphop_tracks
GROUP BY artist
ORDER BY avg_popularity DESC
LIMIT 10;

-- 2. Genre Trend Over Time (Yearly Average Popularity)
SELECT 
    genre,
    EXTRACT(YEAR FROM release_date) AS year,
    ROUND(AVG(popularity), 2) AS avg_yearly_popularity
FROM hiphop_tracks
GROUP BY genre, EXTRACT(YEAR FROM release_date)
ORDER BY genre, year;

-- 3. Filter Tracks by Feature Pattern (e.g., "trap" mentioned in features)
SELECT 
    track_name,
    artist,
    features
FROM hiphop_tracks
WHERE LOWER(features) LIKE '%trap%';

-- 4. Popular Tracks with Specific Duration Range (2.5 to 4 minutes)
SELECT 
    track_name,
    artist,
    duration_ms,
    popularity
FROM hiphop_tracks
WHERE duration_ms BETWEEN 150000 AND 240000
ORDER BY popularity DESC;

-- 5. Most Common Genres
SELECT 
    genre,
    COUNT(*) AS genre_count
FROM hiphop_tracks
GROUP BY genre
ORDER BY genre_count DESC
LIMIT 5;
