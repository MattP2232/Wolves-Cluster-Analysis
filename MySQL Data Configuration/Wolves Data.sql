USE timberwolves;

ALTER TABLE `12-13 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2012-2013';
ALTER TABLE `13-14 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2013-2014';
ALTER TABLE `13-14 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2013-2014';
ALTER TABLE `14-15 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2014-2015';
ALTER TABLE `14-15 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2014-2015';
ALTER TABLE `15-16 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2015-2016';
ALTER TABLE `15-16 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2015-2016';
ALTER TABLE `16-17 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2016-2017';
ALTER TABLE `16-17 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2016-2017';
ALTER TABLE `17-18 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2017-2018';
ALTER TABLE `17-18 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2017-2018';
ALTER TABLE `18-19 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2018-2019';
ALTER TABLE `18-19 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2018-2019';
ALTER TABLE `19-20 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2019-2020';
ALTER TABLE `19-20 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2019-2020';
ALTER TABLE `20-21 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2020-2021';
ALTER TABLE `20-21 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2020-2021';
ALTER TABLE `21-22 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2021-2022';
ALTER TABLE `21-22 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2021-2022';
ALTER TABLE `22-23 pg`
ADD COLUMN Year VARCHAR(50) DEFAULT '2022-2023';
ALTER TABLE `22-23 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2022-2023';
ALTER TABLE `2023-2024 per game`
ADD COLUMN Year VARCHAR(50) DEFAULT '2023-2024';
ALTER TABLE `23-24 adv`
ADD COLUMN Year VARCHAR(50) DEFAULT '2023-2024';

CREATE TABLE wolves_data AS

SELECT 
	y1a.Year,
	y1a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `12-13 adv` y1a
JOIN `12-13 pg` y1p
	USING (Player)
UNION
SELECT 
	y2a.Year,
	y2a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `13-14 adv` y2a
JOIN `13-14 pg` y2p
	USING (Player)
UNION
SELECT 
	y3a.Year,
	y3a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `14-15 adv` y3a
JOIN `14-15 pg` y3p
	USING (Player)
UNION
SELECT 
	y4a.Year,
	y4a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `15-16 adv` y4a
JOIN `15-16 pg` y4p
	USING (Player)
UNION
SELECT 
	y5a.Year,
	y5a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `16-17 adv` y5a
JOIN `16-17 pg` y5p
	USING (Player)
UNION
SELECT 
	y6a.Year,
	y6a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `17-18 adv` y6a
JOIN `17-18 pg` y6p
	USING (Player)
UNION
SELECT 
	y7a.Year,
	y7a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `18-19 adv` y7a
JOIN `18-19 pg` y7p
	USING (Player)
UNION
SELECT 
	y8a.Year,
	y8a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `19-20 adv` y8a
JOIN `19-20 pg` y8p
	USING (Player)
UNION
SELECT 
	y9a.Year,
	y9a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `20-21 adv` y9a
JOIN `20-21 pg` y9p
	USING (Player)
UNION
SELECT 
	y10a.Year,
	y10a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `21-22 adv` y10a
JOIN `21-22 pg` y10p
	USING (Player)
UNION
SELECT 
	y11a.Year,
	y11a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `22-23 adv` y11a
JOIN `22-23 pg` y11p
	USING (Player)
UNION
SELECT 
	y12a.Year,
	y12a.MP,
	Player,
    FTr,
    `TS%`,
    `3PAr`,
    `ORB%`,
    `DRB%`,
    `AST%`,
    `STL%`,
    `BLK%`,
    `TOV%`,
    `USG%`,
    PER,
    OWS,
    DWS,
    `WS/48`,
    OBPM,
	DBPM,
    VORP,
    PTS,
    TRB,
    AST,
    STL,
    BLK,
    TOV
FROM `23-24 adv` y12a
JOIN `2023-2024 per game` y12p
	USING (Player)
    
