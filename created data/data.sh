#!/bin/bash

# Export tables to CSV files
psql -d VideoGames -c "COPY all_games TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/all_games.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY games TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/games.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_3ds TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_3ds.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_dreamcast TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_dreamcase.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_ds TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_ds.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_gameboyadvance TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_gameboyadvance.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_gamecube TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_gamecube.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_nintendo64 TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_nintendo64.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_pc TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_pc.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_playstation TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_playstation.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_playstation2 TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_playstation2.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_playstation3 TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_playstation3.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_playstation4 TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_playstation4.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_playstation5 TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_playstation5.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_playstationvita TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_playstationvita.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_psp TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_psp.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_stadia TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_stadia.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_switch TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_switch.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_wii TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_wiiu.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_xbox TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_xbox.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_xbox360 TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_xbox360.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_xboxone TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_xboxone.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY console_xboxseriesx TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/console_xboxseriesx.csv' DELIMITER ',' CSV HEADER;"
################################################################################################################################################################################################################################################################################################################################################################################################
# Exporting the querries from analysis

# Total Number of games in the dataset
psql -d VideoGames -c "COPY (
SELECT COUNT(*) AS \"Number of games in dataset\" 
FROM all_games
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/number_of_games.csv' DELIMITER ',' CSV HEADER;"

#Calculate average meta_score and user_review ratings. (FROM 1995-2001)
psql -d VideoGames -c "COPY (
SELECT AVG(meta_score) AS \"Average Meta Score\",
       AVG(CAST(user_review AS NUMERIC)) AS \"Average User Review\"
FROM all_games
WHERE user_review IS NOT NULL
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/avg_meta_score.csv' DELIMITER ',' CSV HEADER;"

#Find the maximum and minimum ratings for both meta_score and user_review.
psql -d VideoGames -c "COPY (
SELECT name,
	      platform,
       meta_score AS \"Max Meta Score\"
FROM all_games
WHERE meta_score = ( SELECT MAX(meta_score) FROM all_games)
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/max_meta_score.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT name,
    	       platform,
       meta_score AS \"Min Meta Score\"
FROM all_games
WHERE meta_score = ( SELECT MIN(meta_score) FROM all_games)
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/min_meta_score.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT name,
               platform,
       user_review AS \"Max User Review\"
FROM all_games
WHERE user_review = (SELECT MAX(user_review) FROM all_games)
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/max_user_review.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT name,
              platform,
       user_review AS \"Min User Review\"
FROM all_games
WHERE user_review = ( SELECT MIN(user_review) FROM all_games)
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/min_user_review.csv' DELIMITER ',' CSV HEADER;"

# Count the number of games available on each gaming platform.
psql -d VideoGames -c "COPY (
SELECT platform,
       COUNT(platform) AS \"Number of games available\"
FROM all_games
GROUP BY platform
ORDER BY 2 DESC
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/gameNumber_onplatforms.csv' DELIMITER ',' CSV HEADER;"

#Determine average ratings (meta_score and user_review) for each platform.
psql -d VideoGames -c "COPY (
SELECT platform,
       AVG(meta_score) AS \"Average Meta Score\",
       AVG(CAST(user_review AS NUMERIC)) AS \"Average User Review\"
FROM all_games
GROUP BY 1
ORDER BY 2,3 DESC
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/platform_avg_ratings.csv' DELIMITER ',' CSV HEADER;"

#average scores and number of releases  accross each platform for each year from 1995 - 2021
psql -d VideoGames -c "COPY (
SELECT DATE_PART('year', TO_DATE(release_date, 'YYYY-MM-DD')) AS \"Release Year\",
       COUNT(*) AS \"Number of Releases\",
       platform,
       AVG(meta_score) AS \"Average Meta Score\",
       AVG(CAST(user_review AS NUMERIC)) AS \"Average User Review\"
FROM all_games
WHERE user_review IS NOT NULL
GROUP BY 1, 3
ORDER BY 1
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/yearly_avg_score_and_qty.csv' DELIMITER ',' CSV HEADER;"

#Retrieve the top-rated games based on meta_score and user_review.
psql -d VideoGames -c "COPY (
SELECT name AS \"Top 10 Meta Scored Games\",
       platform,
       meta_score AS \"Meta Score\"
FROM all_games
ORDER BY 3 DESC
LIMIT 10
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/top10_meta_scores.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT name AS \"Worst 10 Meta Scored Games\",
       platform,
       meta_score AS \"Meta Score\"
FROM all_games
ORDER BY 3
LIMIT 10
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/worst10_meta_scores.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT name AS \"Top 10 User Rated Games\",
       platform,
       user_review AS \"User Rating\"
FROM all_games
WHERE user_review IS NOT NULL
ORDER BY 3 DESC
LIMIT 10
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/top10_user_reviews.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT name AS \"Worst 10 User Rated Games\",
       platform,
       user_review AS \"User Rating\"
FROM all_games
ORDER BY 3
LIMIT 10
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/worst10_user_reviews.csv' DELIMITER ',' CSV HEADER;"

# Check for any correlation between meta_score and user_review using SQL functions like CORR() or by calculating covariance.
psql -d VideoGames -c "COPY (
SELECT 
    (SUM((meta_score - meta_mean) * (CAST(user_review AS NUMERIC) - user_mean)) / COUNT(*)) /
    (STDDEV_POP(meta_score) * STDDEV_POP(CAST(user_review AS NUMERIC))) AS correlation_coef_between_metascore_and_userreview
FROM (
    SELECT 
        meta_score,
        user_review,
        AVG(meta_score) OVER () AS meta_mean,
        AVG(CAST(user_review AS NUMERIC)) OVER () AS user_mean
    FROM all_games
) subquery
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/correlation_meta_user.csv' DELIMITER ',' CSV HEADER;"

#Analyze the relationship between summary length and ratings
psql -d VideoGames -c "COPY (
SELECT name,
       platform,
       LENGTH(summary) \"Length of summary\",
       meta_score
FROM all_games
WHERE summary IS NOT NULL
ORDER BY 3 DESC
LIMIT 10
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/summarylength_vs_meta.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT name,
       platform,
       LENGTH(summary) \"Length of summary\",
       user_review
FROM all_games
WHERE summary IS NOT NULL
ORDER BY 3 DESC
LIMIT 10
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/summarylength_vs_user.csv' DELIMITER ',' CSV HEADER;"

# calculating correlation coefficient between length of summary and ratings
psql -d VideoGames -c "COPY (
SELECT 
    (SUM((meta_score - meta_mean) * (summary_length - length_mean)) / COUNT(*)) /
    (STDDEV_POP(meta_score) * STDDEV_POP(summary_length)) AS \"correlation_coef between summary length and meta_score\"
FROM (
    SELECT 
        meta_score,
        LENGTH(summary) AS summary_length,
        AVG(meta_score) OVER () AS meta_mean,
        AVG(LENGTH(summary)) OVER () AS length_mean
    FROM all_games
) subquery
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/coeff_summary_meta.csv' DELIMITER ',' CSV HEADER;"

psql -d VideoGames -c "COPY (
SELECT 
        (SUM((CAST(user_review AS NUMERIC) - user_mean) * (summary_length - length_mean)) / COUNT(*)) /
    (STDDEV_POP(CAST(user_review AS NUMERIC)) * STDDEV_POP(summary_length)) AS \"correlation_coef between summary length and user_review\"
FROM (
    SELECT 
        user_review,
        LENGTH(summary) AS summary_length,
        AVG(CAST(user_review AS NUMERIC)) OVER () AS user_mean,
        AVG(LENGTH(summary)) OVER () AS length_mean
    FROM all_games
) subquery
) TO '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/created data/coeff_summary_user.csv' DELIMITER ',' CSV HEADER;"