/**
* 		Overall Statistics:
    * Count the total number of games in the dataset.
    * Calculate average meta_score and user_review ratings.
    * Find the maximum and minimum ratings for both meta_score and user_review.
*/
-- Total Number of games in the dataset
SELECT COUNT(*) "Number of games in dataset"
FROM all_games;

-- Calculate average meta_score and user_review ratings. (FROM 1995-2001)
SELECT AVG(meta_score) AS "Average Meta Score",
       AVG(CAST(user_review AS NUMERIC)) AS "Average User Review"
FROM all_games
-- ignoring the null values
WHERE user_review IS NOT NULL;

-- * Find the maximum and minimum ratings for both meta_score and user_review.
SELECT name,
       meta_score AS "Max Meta Score"
FROM all_games
WHERE meta_score = ( SELECT MAX(meta_score) FROM all_games);

SELECT name,
       meta_score AS "Min Meta Score"
FROM all_games
WHERE meta_score = ( SELECT MIN(meta_score) FROM all_games);

SELECT name,
       user_review AS "Max User Review"
FROM all_games
WHERE user_review = (SELECT MAX(user_review) FROM all_games);

SELECT name,
       user_review AS "Min User Review"
FROM all_games
WHERE user_review = ( SELECT MIN(user_review) FROM all_games);
----------------------------------------------------------------
/**
* 	Platform-wise Analysis:
    * Count the number of games available on each gaming platform.
    * Determine average ratings (meta_score and user_review) for each platform.
    * Identify platforms with the highest and lowest average ratings.
*/
-- Count the number of games available on each gaming platform.
SELECT platform,
       COUNT(platform) AS "Number of games available"
FROM all_games
GROUP BY platform
ORDER BY 2 DESC;

-- Determine average ratings (meta_score and user_review) for each platform.
SELECT platform,
       AVG(meta_score) AS "Average Meta Score",
       AVG(CAST(user_review AS NUMERIC)) AS "Average User Review"
FROM all_games
GROUP BY 1
ORDER BY 2,3 DESC;

-- Identify platforms with the highest and lowest average ratings.


----------------------------------------------------------------
/**
	Release Date Analysis:
    * Group games by release year or month to observe trends in the number of releases over time.
    * Analyze average ratings over different release years or months to see if there's any correlation between release date and ratings.
*/
-- Below is a table of the average scores and number of releases  accross each platform for each year from 1995 - 2021
SELECT DATE_PART('year', TO_DATE(release_date, 'YYYY-MM-DD')) AS "Release Year",
       COUNT(*) AS "Number of Releases",
       platform,
       AVG(meta_score) AS "Average Meta Score",
       AVG(CAST(user_review AS NUMERIC)) AS "Average User Review"
FROM all_games
-- ignoring the null values
WHERE user_review IS NOT NULL
GROUP BY 1, 3
ORDER BY 1;
----------------------------------------------------------------

/**
* Top-rated Games:
    * Retrieve the top-rated games based on meta_score and user_review.
    * Find games with the highest meta_score but lower user_review (or vice versa) to identify discrepancies between critic and user opinions.
*/
-- Retrieve the top-rated games based on meta_score and user_review.
SELECT name AS "Top 10 Meta Scored Games",
       platform,
       meta_score AS "Meta Score"
FROM all_games
ORDER BY 3 DESC
LIMIT 10;

SELECT name AS "Worst 10 Meta Scored Games",
       platform,
       meta_score AS "Meta Score"
FROM all_games
ORDER BY 3
LIMIT 10;

SELECT name AS "Top 10 User Rated Games",
       platform,
       user_review AS "User Rating"
FROM all_games
WHERE user_review IS NOT NULL
ORDER BY 3 DESC
LIMIT 10;

SELECT name AS "Worst 10 User Rated Games",
       platform,
       user_review AS "User Rating"
FROM all_games
ORDER BY 3
LIMIT 10;

-- Find games with the highest meta_score but lower user_review (or vice versa) to identify discrepancies between critic and user opinions.
-- no games on the top rated meta scores are on the top user rated list

----------------------------------------------------------------
/**
* Correlation Analysis:
    * Check for any correlation between meta_score and user_review using SQL functions like CORR() or by calculating covariance.
    * Explore if the meta_score tends to align with user_reviews or if there's a significant difference.
*/
-- Check for any correlation between meta_score and user_review using SQL functions like CORR() or by calculating covariance.
SELECT 
    (SUM((meta_score - meta_mean) * (CAST(user_review AS NUMERIC) - user_mean)) / COUNT(*)) /
    (STDDEV_POP(meta_score) * STDDEV_POP(CAST(user_review AS NUMERIC))) AS correlation_coef
FROM (
    SELECT 
        meta_score,
        user_review,
        AVG(meta_score) OVER () AS meta_mean,
        AVG(CAST(user_review AS NUMERIC)) OVER () AS user_mean
    FROM all_games
) AS subquery;


----------------------------------------------------------------

/**
* Summary Analysis:
    * Count the number of games with a summary longer than a certain character limit.
    * Analyze the relationship between summary length and ratings.
*/
SELECT name,
       platform,
       LENGTH(summary) "Length of summary",
       meta_score
FROM all_games
WHERE summary IS NOT NULL
ORDER BY 3 DESC
LIMIT 10;

SELECT name,
       platform,
       LENGTH(summary) "Length of summary",
       user_review
FROM all_games
WHERE summary IS NOT NULL
ORDER BY 3 DESC
LIMIT 10;

-- calculating correlation coefficient between length of summary and ratings
SELECT 
    (SUM((meta_score - meta_mean) * (summary_length - length_mean)) / COUNT(*)) /
    (STDDEV_POP(meta_score) * STDDEV_POP(summary_length)) AS "correlation_coef between summary length and meta_score"
FROM (
    SELECT 
        meta_score,
        LENGTH(summary) AS summary_length,
        AVG(meta_score) OVER () AS meta_mean,
        AVG(LENGTH(summary)) OVER () AS length_mean
    FROM all_games
) AS subquery;


SELECT 
    (SUM((CAST(user_review AS NUMERIC) - user_mean) * (summary_length - length_mean)) / COUNT(*)) /
    (STDDEV_POP(CAST(user_review AS NUMERIC)) * STDDEV_POP(summary_length)) AS "correlation_coef between summary length and user_review"
FROM (
    SELECT 
        user_review,
        LENGTH(summary) AS summary_length,
        AVG(CAST(user_review AS NUMERIC)) OVER () AS user_mean,
        AVG(LENGTH(summary)) OVER () AS length_mean
    FROM all_games
) AS subquery;

----------------------------------------------------------------
