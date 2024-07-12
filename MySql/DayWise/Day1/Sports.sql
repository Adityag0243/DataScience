create database IF NOT EXISTS  sports;
-- create database healthcare;

-- CREATE DATABASE IF NOT EXISTS healthcare;

-- drop database if exists healthcare;

-- drop database healthcare;


use sports;
create table cricket_batsman
(
	player_name  varchar(20),
    team varchar(30),
    total_score  int,
    ball_played int,
    fours int,
    sixes int
);

create table sports.cricket_bowler
(
	player_name  varchar(20),
    team varchar(30),
    run_conceded int,
    overs decimal
);

select * from cricket_batsman;

drop table cricket_bowler;

-- create or replace table cricket_batsman
-- (
-- 	player_name  varchar(20),
--     team varchar(30),
--     total_score  int,
--     ball_played int,
--     fours int,
--     sixes int
-- );

-- batsman data
-- season	match_id	venue	city	innings_id	fullName	overs	maidens	conceded	
-- wickets	dots	foursConceded	sixesConceded	wides	noballs


 create table sports.bowlers_data
(
	season char(4),
    match_id char(7),
    venue varchar(75),
    city varchar(20),
    innings_id char(1),
	fullname  varchar(30),
    overs decimal,
    maidens int,
    conceded int,
    wickets int,
    dots int,
    foursConceded int,
    sixesConceded int,
    wides int,
    noballs int
);

select *  from bowlers_data;
SELECT VERSION();



