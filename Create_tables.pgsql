-- Querry to create all_games table in database VideoGames

CREATE TABLE all_games
(
  index INT,
  name VARCHAR(100),
  platform VARCHAR(100),
  release_date VARCHAR(100),
  summary VARCHAR(10000),
  meta_score FLOAT,
  user_review VARCHAR(10)
);

COPY all_games FROM '/Users/melvinquashie/Documents/Data Analytics /sql projects/Video games/all_games.csv' DELIMITER ',' CSV HEADER;

-- Updating the all_games table to have user_reviews as floats and when 'tbd', user_review is set to NULL, meaning the review hasn't been set.
-- removing 'tbd' from user reviews and changing the text to floats
-- also converting the release date from text to date format
UPDATE all_games
SET user_review = CASE
    WHEN user_review = 'tbd' THEN NULL
    WHEN user_review::FLOAT = 0 THEN 0
    ELSE user_review::FLOAT
    END,
    release_date = TO_DATE(release_date, 'Month DD, YYYY'); 
----------------------------------------------------------------

-- Table of Games and their Index(PK)
CREATE TABLE games
AS
(
  SELECT index,
         name
  FROM all_games
);

/**
Now to create tables for each plaatform:
- 3DS
- Dreamcast
- DS
- Game Boy Advance
- GameCube
- Nintendo 64
- PC
- PlayStation
- PlayStation 2
- Playstation 3
- PlayStation 4
- PlayStation 5
- PlayStation Vita
- PSP
- Stadia
- Switch
- Wii
- Wii U
- Xbox
- Xbox 360
- Xbox One
- Xbox Series X
*/

-- 3DS
CREATE TABLE console_3DS
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' 3DS'       
);

-- Dreamcast
CREATE TABLE console_Dreamcast
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Dreamcast'       
);

-- DS
CREATE TABLE console_DS
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' DS'       
);

-- Game Boy Advance
CREATE TABLE console_GameBoyAdvance
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Game Boy Advance'       
);

-- GameCube
CREATE TABLE console_GameCube
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' GameCube'       
);

-- Nintendo 64
CREATE TABLE console_Nintendo64
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Nintendo 64'       
);

-- PC
CREATE TABLE console_PC
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PC'       
);

-- PlayStation
CREATE TABLE console_PlayStation
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PlayStation'
);

-- PlayStation 2
CREATE TABLE console_PlayStation2
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PlayStation2'
);

-- Playstation 3
CREATE TABLE console_PlayStation3
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PlayStation3'
);

-- PlayStation 4
CREATE TABLE console_PlayStation4
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PlayStation4'
);

-- PlayStation 5
CREATE TABLE console_PlayStation5
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PlayStation5'
);

-- PlayStation Vita
CREATE TABLE console_PlayStationVita
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PlayStation Vita'
);

-- PSP
CREATE TABLE console_PSP
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' PSP'
);

-- Stadia
CREATE TABLE console_Stadia
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Stadia'
);

-- Switch
CREATE TABLE console_Switch
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Switch'
);

-- Wii
CREATE TABLE console_Wii
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Wii'
);

-- Wii U
CREATE TABLE console_WiiU
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Wii U'
);

-- Xbox
CREATE TABLE console_Xbox
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Xbox'
);

-- Xbox 360
CREATE TABLE console_Xbox360
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Xbox 360'
);

-- Xbox One
CREATE TABLE console_XboxOne
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Xbox One'
);

-- Xbox Series X
CREATE TABLE console_XboxSeriesX
AS
(
  SELECT index,
         name,
         release_date,
         summary,
         meta_score,
         user_review
  FROM all_games
  WHERE platform = ' Xbox Series X'
);
----------------------------------------------------------------

