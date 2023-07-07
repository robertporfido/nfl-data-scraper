-- Step 0: Drop table if necessary
-- DROP TABLE dbo.nfl_game_data;

-- Step 1: Create the working table
CREATE TABLE IF NOT EXISTS dbo.nfl_game_data (
  espn_game_id INTEGER PRIMARY KEY,
  season INTEGER,
  part_of_season TEXT,
  week_number TEXT,
  away_team TEXT,
  home_team TEXT,
  game_location TEXT,
  game_stadium TEXT,
  game_time TIME WITHOUT TIME ZONE,
  game_date DATE,
  game_attendance INTEGER,
  stadium_capacity INTEGER,
  attendance_percent INTEGER,
  weather TEXT,
  away_team_total_wins INTEGER,
  away_team_total_losses INTEGER,
  away_team_total_ties INTEGER,
  away_team_away_wins INTEGER,
  away_team_away_losses INTEGER,
  away_team_away_ties INTEGER,
  away_team_total_win_percent NUMERIC(5,3),
  away_team_away_win_percent NUMERIC(5,3),
  home_team_total_wins INTEGER,
  home_team_total_losses INTEGER,
  home_team_total_ties INTEGER,
  home_team_home_wins INTEGER,
  home_team_home_losses INTEGER,
  home_team_home_ties INTEGER,
  home_team_total_win_percent NUMERIC(5,3),
  home_team_home_win_percent NUMERIC(5,3),
  away_team_quarter_first INTEGER,
  away_team_quarter_second INTEGER,
  away_team_quarter_third INTEGER,
  away_team_quarter_fourth INTEGER,
  away_team_quarter_ot INTEGER,
  away_team_final INTEGER,
  away_pass_completions INTEGER,
  away_pass_attempts INTEGER,
  away_pass_yards INTEGER,
  away_pass_yards_per_attempt NUMERIC(5,2),
  away_pass_tds INTEGER,
  away_pass_tds_percent NUMERIC(5,3),
  away_pass_ints INTEGER,
  away_pass_ints_percent NUMERIC(5,3),
  away_sacks_allowed INTEGER,
  away_sack_yardage_allowed INTEGER,
  away_pass_rating NUMERIC(5,2),
  away_rush_attempts INTEGER,
  away_rush_yards INTEGER,
  away_rush_yards_per_attempt NUMERIC(5,2),
  away_rush_tds INTEGER,
  away_rush_long INTEGER,
  away_rec_targets INTEGER,
  away_receptions INTEGER,
  away_rec_yards INTEGER,
  away_yards_per_reception NUMERIC(5,2),
  away_rec_tds INTEGER,
  away_rec_long INTEGER,
  home_team_quarter_first INTEGER,
  home_team_quarter_second INTEGER,
  home_team_quarter_third INTEGER,
  home_team_quarter_fourth INTEGER,
  home_team_quarter_ot INTEGER,
  home_team_final INTEGER,
  home_pass_completions INTEGER,
  home_pass_attempts INTEGER,
  home_pass_yards INTEGER,
  home_pass_yards_per_attempt NUMERIC(5,2),
  home_pass_tds INTEGER,
  home_pass_tds_percent NUMERIC(5,3),
  home_pass_ints INTEGER,
  home_pass_ints_percent NUMERIC(5,3),
  home_sacks_allowed INTEGER,
  home_sack_yardage_allowed INTEGER,
  home_pass_rating NUMERIC(5,2),
  home_rush_attempts INTEGER,
  home_rush_yards INTEGER,
  home_rush_yards_per_attempt NUMERIC(5,2),
  home_rush_tds INTEGER,
  home_rush_long INTEGER,
  home_rec_targets INTEGER,
  home_receptions INTEGER,
  home_rec_yards INTEGER,
  home_yards_per_reception NUMERIC(5,2),
  home_rec_tds INTEGER,
  home_rec_long INTEGER,
  game_result INTEGER
);

-- Step 2: Insert data from raw table into working table
INSERT INTO dbo.nfl_game_data (
  espn_game_id,
  season,
  part_of_season,
  week_number,
  away_team,
  home_team,
  game_location,
  game_stadium,
  game_time,
  game_date,
  game_attendance,
  stadium_capacity,
  attendance_percent,
  weather,
  away_team_total_wins,
  away_team_total_losses,
  away_team_total_ties,
  away_team_away_wins,
  away_team_away_losses,
  away_team_away_ties,
  away_team_total_win_percent,
  away_team_away_win_percent,
  home_team_total_wins,
  home_team_total_losses,
  home_team_total_ties,
  home_team_home_wins,
  home_team_home_losses,
  home_team_home_ties,
  home_team_total_win_percent,
  home_team_home_win_percent,
  away_team_quarter_first,
  away_team_quarter_second,
  away_team_quarter_third,
  away_team_quarter_fourth,
  away_team_quarter_ot,
  away_team_final,
  away_pass_completions,
  away_pass_attempts,
  away_pass_yards,
  away_pass_yards_per_attempt,
  away_pass_tds,
  away_pass_tds_percent,
  away_pass_ints,
  away_pass_ints_percent,
  away_sacks_allowed,
  away_sack_yardage_allowed,
  away_pass_rating,
  away_rush_attempts,
  away_rush_yards,
  away_rush_yards_per_attempt,
  away_rush_tds,
  away_rush_long,
  away_rec_targets,
  away_receptions,
  away_rec_yards,
  away_yards_per_reception,
  away_rec_tds,
  away_rec_long,
  home_team_quarter_first,
  home_team_quarter_second,
  home_team_quarter_third,
  home_team_quarter_fourth,
  home_team_quarter_ot,
  home_team_final,
  home_pass_completions,
  home_pass_attempts,
  home_pass_yards,
  home_pass_yards_per_attempt,
  home_pass_tds,
  home_pass_tds_percent,
  home_pass_ints,
  home_pass_ints_percent,
  home_sacks_allowed,
  home_sack_yardage_allowed,
  home_pass_rating,
  home_rush_attempts,
  home_rush_yards,
  home_rush_yards_per_attempt,
  home_rush_tds,
  home_rush_long,
  home_rec_targets,
  home_receptions,
  home_rec_yards,
  home_yards_per_reception,
  home_rec_tds,
  home_rec_long,
  game_result
)

SELECT
		CAST(raw.espn_game_id AS INTEGER) AS espn_game_id
,		CAST(raw.season AS INTEGER) AS season
,		CAST(raw.part_of_season AS TEXT) AS part_of_season
,		CAST(raw.week_number AS TEXT) AS week_number
,		CASE WHEN raw.away_team = '' OR raw.away_team = 'NaN' THEN null
			ELSE CAST(raw.away_team AS TEXT)
		END AS away_team
,		CASE WHEN raw.home_team = '' OR raw.home_team = 'NaN' THEN null
			ELSE CAST(raw.home_team AS TEXT)
		END AS home_team
,		CASE WHEN raw.game_location = '' OR raw.game_location = 'NaN' THEN null
			ELSE CAST(raw.game_location AS TEXT)
		END AS game_location
,		CASE WHEN raw.game_stadium = '' OR raw.game_stadium = 'NaN' THEN null
			ELSE CAST(raw.game_stadium AS TEXT)
		END AS game_stadium
,		CASE WHEN raw.game_time = '' OR raw.game_time = 'NaN' OR raw.game_time = 'TBD' THEN null
			ELSE CAST(raw.game_time AS TIME WITHOUT TIME ZONE)
		END AS game_time
,		CASE WHEN raw.game_date = '' OR raw.game_date = 'NaN' OR raw.game_date = 'TBD' THEN null
			ELSE CAST(raw.game_date AS DATE)
		END AS game_date
,		CASE WHEN raw.game_attendance = '' OR raw.game_attendance = 'NaN' THEN null
			ELSE CAST(raw.game_attendance AS INTEGER)
		END AS game_attendance
,		CASE WHEN raw.stadium_capacity = '' OR raw.stadium_capacity = 'NaN' THEN null
			ELSE CAST(raw.stadium_capacity AS INTEGER)
		END AS stadium_capacity
,		CASE WHEN raw.attendance_percent = '' OR raw.attendance_percent = 'NaN' THEN null
			ELSE CAST(raw.attendance_percent AS INTEGER)
		END AS stadium_capacity
,		CAST(raw.weather AS TEXT) AS weather
,		CASE WHEN raw.away_team_total_record = '' OR raw.away_team_total_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.away_team_total_record, '-', 1)::INTEGER
		END AS away_team_total_wins
,		CASE WHEN raw.away_team_total_record = '' OR raw.away_team_total_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.away_team_total_record, '-', 2)::INTEGER
		END AS away_team_total_losses
,		CASE WHEN raw.away_team_total_record = '' OR raw.away_team_total_record = 'NaN' THEN null
			WHEN SPLIT_PART(raw.away_team_total_record, '-', 3) = '' THEN 0
			ELSE SPLIT_PART(raw.away_team_total_record, '-', 3)::INTEGER
		END AS away_team_total_ties
,		CASE WHEN raw.away_team_away_record = '' OR raw.away_team_away_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.away_team_away_record, '-', 1)::INTEGER
		END AS away_team_away_wins
,		CASE WHEN raw.away_team_away_record = '' OR raw.away_team_away_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.away_team_away_record, '-', 2)::INTEGER
		END AS away_team_away_losses
,		CASE WHEN raw.away_team_away_record = '' OR raw.away_team_away_record = 'NaN' THEN null
			WHEN SPLIT_PART(raw.away_team_away_record, '-', 3) = '' THEN 0
			ELSE SPLIT_PART(raw.away_team_away_record, '-', 3)::INTEGER
		END AS away_team_away_ties
,		CASE WHEN 
			raw.away_team_total_record = '' OR raw.away_team_total_record = 'NaN' THEN null
        	ELSE ROUND(CAST(SPLIT_PART(raw.away_team_total_record, '-', 1) AS NUMERIC) / NULLIF((CAST(SPLIT_PART(raw.away_team_total_record, '-', 1) AS NUMERIC) + CAST(SPLIT_PART(raw.away_team_total_record, '-', 2) AS NUMERIC)), 0), 3)
    	END AS away_team_total_win_percent
,		CASE WHEN 
			raw.away_team_away_record = '' OR raw.away_team_away_record = 'NaN' THEN null
        	ELSE ROUND(CAST(SPLIT_PART(raw.away_team_away_record, '-', 1) AS NUMERIC) / NULLIF((CAST(SPLIT_PART(raw.away_team_away_record, '-', 1) AS NUMERIC) + CAST(SPLIT_PART(raw.away_team_away_record, '-', 2) AS NUMERIC)), 0), 3)
    	END AS away_team_away_win_percent

,		CASE WHEN raw.home_team_total_record = '' OR raw.home_team_total_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.home_team_total_record, '-', 1)::INTEGER
		END AS home_team_total_wins
,		CASE WHEN raw.home_team_total_record = '' OR raw.home_team_total_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.home_team_total_record, '-', 2)::INTEGER
		END AS home_team_total_losses
,		CASE WHEN raw.home_team_total_record = '' OR raw.home_team_total_record = 'NaN' THEN null
			WHEN SPLIT_PART(raw.home_team_total_record, '-', 3) = '' THEN 0
			ELSE SPLIT_PART(raw.home_team_total_record, '-', 3)::INTEGER
		END AS home_team_total_ties
,		CASE WHEN raw.home_team_home_record = '' OR raw.home_team_home_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.home_team_home_record, '-', 1)::INTEGER
		END AS home_team_home_wins
,		CASE WHEN raw.home_team_home_record = '' OR raw.home_team_home_record = 'NaN' THEN null
			ELSE SPLIT_PART(raw.home_team_home_record, '-', 2)::INTEGER
		END AS home_team_home_losses
,		CASE WHEN raw.home_team_home_record = '' OR raw.home_team_home_record = 'NaN' THEN null
			WHEN SPLIT_PART(raw.home_team_home_record, '-', 3) = '' THEN 0
			ELSE SPLIT_PART(raw.home_team_home_record, '-', 3)::INTEGER
		END AS home_team_home_ties
,		CASE WHEN 
			raw.home_team_total_record = '' OR raw.home_team_total_record = 'NaN' THEN null
        	ELSE ROUND(CAST(SPLIT_PART(raw.home_team_total_record, '-', 1) AS NUMERIC) / NULLIF((CAST(SPLIT_PART(raw.home_team_total_record, '-', 1) AS NUMERIC) + CAST(SPLIT_PART(raw.home_team_total_record, '-', 2) AS NUMERIC)), 0), 3)
    	END AS home_team_total_win_percent
,		CASE WHEN 
			raw.home_team_home_record = '' OR raw.home_team_home_record = 'NaN' THEN null
        	ELSE ROUND(CAST(SPLIT_PART(raw.home_team_home_record, '-', 1) AS NUMERIC) / NULLIF((CAST(SPLIT_PART(raw.home_team_home_record, '-', 1) AS NUMERIC) + CAST(SPLIT_PART(raw.home_team_home_record, '-', 2) AS NUMERIC)), 0), 3)
    	END AS home_team_home_win_percent
,		CASE WHEN raw.away_team_quarter_first = '' OR raw.away_team_quarter_first = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_team_quarter_first AS NUMERIC)) 
		END AS away_team_quarter_first
,		CASE WHEN raw.away_team_quarter_second = '' OR raw.away_team_quarter_second = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_team_quarter_second AS NUMERIC)) 
		END AS away_team_quarter_second
,		CASE WHEN raw.away_team_quarter_third = '' OR raw.away_team_quarter_third = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_team_quarter_third AS NUMERIC)) 
		END AS away_team_quarter_third
,		CASE WHEN raw.away_team_quarter_fourth = '' OR raw.away_team_quarter_fourth = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_team_quarter_fourth AS NUMERIC)) 
		END AS away_team_quarter_fourth
,		CASE WHEN raw.away_team_quarter_ot = '' OR raw.away_team_quarter_ot = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_team_quarter_ot AS NUMERIC)) 
		END AS away_team_quarter_ot
,		CASE WHEN raw.away_team_final = '' OR raw.away_team_final = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_team_final AS NUMERIC)) 
		END AS away_team_final	
,		CASE WHEN raw.away_pass_comp_attempts = '' OR raw.away_pass_comp_attempts = 'NaN' THEN null
			ELSE CAST(SPLIT_PART(raw.away_pass_comp_attempts, '/', 1) AS INTEGER)
		END AS away_pass_completions
,		CASE WHEN raw.away_pass_comp_attempts = '' OR raw.away_pass_comp_attempts = 'NaN' THEN null
			ELSE CAST(SPLIT_PART(raw.away_pass_comp_attempts, '/', 2) AS INTEGER)
		END AS away_pass_attempts
,		CASE WHEN raw.away_pass_yards = '' OR raw.away_pass_yards = 'NaN' THEN null
			ELSE CAST(raw.away_pass_yards AS INTEGER) 
		END AS away_pass_yards
,		CASE WHEN raw.away_pass_yards = '' OR raw.away_pass_yards = 'NaN' OR
			raw.away_pass_comp_attempts = '' OR raw.away_pass_comp_attempts = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_pass_yards AS NUMERIC) / CAST(SPLIT_PART(raw.away_pass_comp_attempts, '/', 2) AS NUMERIC),2) 
		END AS away_pass_yards_per_attempt
,		CASE WHEN raw.away_pass_tds = '' OR raw.away_pass_tds = 'NaN' THEN null
			ELSE CAST(raw.away_pass_tds AS INTEGER) 
		END AS away_pass_tds
,		CASE WHEN raw.away_pass_tds = '' OR raw.away_pass_tds = 'NaN' OR
			raw.away_pass_comp_attempts = '' OR raw.away_pass_comp_attempts = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_pass_tds AS NUMERIC) / CAST(SPLIT_PART(raw.away_pass_comp_attempts, '/', 2) AS NUMERIC),3) 
		END AS away_pass_tds_percent
,		CASE WHEN raw.away_pass_ints = '' OR raw.away_pass_ints = 'NaN' THEN null
			ELSE CAST(raw.away_pass_ints AS INTEGER) 
		END AS away_pass_ints
,		CASE WHEN raw.away_pass_ints = '' OR raw.away_pass_ints = 'NaN' OR
			raw.away_pass_comp_attempts = '' OR raw.away_pass_comp_attempts = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_pass_ints AS NUMERIC) / CAST(SPLIT_PART(raw.away_pass_comp_attempts, '/', 2) AS NUMERIC),3) 
		END AS away_pass_ints_percent
,		CASE WHEN
    		SPLIT_PART(raw.away_sacks_allowed, '-', 1) = 'NaN' OR SPLIT_PART(raw.away_sacks_allowed, '-', 1) = '' THEN null
    		ELSE SPLIT_PART(raw.away_sacks_allowed, '-', 1)::INTEGER
  		END AS away_sacks_allowed
,  		CASE WHEN
    		SPLIT_PART(raw.away_sacks_allowed, '-', 2) = 'NaN' OR SPLIT_PART(raw.away_sacks_allowed, '-', 2) = '' THEN null
    		ELSE SPLIT_PART(raw.away_sacks_allowed, '-', 2)::INTEGER
  		END AS away_sack_yardage_allowed		
,		CASE WHEN 
			raw.away_pass_rating = '' OR raw.away_pass_rating = 'NaN' THEN null
			ELSE CAST(raw.away_pass_rating AS NUMERIC)
		END AS away_pass_rating
,		CASE WHEN 
			raw.away_rush_attempts = '' OR raw.away_rush_attempts = 'NaN' THEN null
			ELSE CAST(raw.away_rush_attempts AS INTEGER)
		END AS away_rush_attempts
,		CASE WHEN 
			raw.away_rush_yards = '' OR raw.away_rush_yards = 'NaN' THEN null
			ELSE CAST(raw.away_rush_yards AS INTEGER)
		END AS away_rush_yards
,		CASE WHEN 
			raw.away_rush_yards = '' OR raw.away_rush_yards = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_rush_yards AS NUMERIC) / CAST(raw.away_rush_attempts AS NUMERIC),2)
		END AS away_rush_yards_per_attempt
,		CASE WHEN 
			raw.away_rush_tds = '' OR raw.away_rush_tds = 'NaN' THEN null
			ELSE CAST(raw.away_rush_tds AS INTEGER)
		END AS away_rush_tds
,		CASE WHEN 
			raw.away_rush_long = '' OR raw.away_rush_long = 'NaN' THEN null
			ELSE CAST(raw.away_rush_long AS INTEGER)
		END AS away_rush_long
,		CASE WHEN 
			raw.away_rec_targets = '' OR raw.away_rec_targets = 'NaN' THEN null
			ELSE CAST(raw.away_rec_targets AS INTEGER)
		END AS away_rec_targets		
,		CASE WHEN 
			raw.away_rec_receptions = '' OR raw.away_rec_receptions = 'NaN' THEN null
			ELSE CAST(raw.away_rec_receptions AS INTEGER)
		END AS away_receptions		
,		CASE WHEN 
			raw.away_rec_yards = '' OR raw.away_rec_yards = 'NaN' THEN null
			ELSE CAST(raw.away_rec_yards AS INTEGER)
		END AS away_rec_yards				
,		CASE WHEN 
			raw.away_rec_receptions = '' OR raw.away_rec_receptions = 'NaN' THEN null
			ELSE ROUND(CAST(raw.away_rec_yards AS NUMERIC) / CAST(raw.away_rec_receptions AS NUMERIC),2)
		END AS away_yards_per_reception
,		CASE WHEN 
			raw.away_rec_tds = '' OR raw.away_rec_tds = 'NaN' THEN null
			ELSE CAST(raw.away_rec_tds AS INTEGER)
		END AS away_rec_tds	
,		CASE WHEN 
			raw.away_rec_long = '' OR raw.away_rec_long = 'NaN' THEN null
			ELSE CAST(raw.away_rec_long AS INTEGER)
		END AS away_rec_long
,		CASE WHEN raw.home_team_quarter_first = '' OR raw.home_team_quarter_first = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_team_quarter_first AS NUMERIC)) 
		END AS home_team_quarter_first
,		CASE WHEN raw.home_team_quarter_second = '' OR raw.home_team_quarter_second = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_team_quarter_second AS NUMERIC)) 
		END AS home_team_quarter_second
,		CASE WHEN raw.home_team_quarter_third = '' OR raw.home_team_quarter_third = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_team_quarter_third AS NUMERIC)) 
		END AS home_team_quarter_third
,		CASE WHEN raw.home_team_quarter_fourth = '' OR raw.home_team_quarter_fourth = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_team_quarter_fourth AS NUMERIC)) 
		END AS home_team_quarter_fourth
,		CASE WHEN raw.home_team_quarter_ot = '' OR raw.home_team_quarter_ot = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_team_quarter_ot AS NUMERIC)) 
		END AS home_team_quarter_ot
,		CASE WHEN raw.home_team_final = '' OR raw.home_team_final = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_team_final AS NUMERIC)) 
		END AS home_team_final
,		CASE WHEN raw.home_pass_comp_attempts = '' OR raw.home_pass_comp_attempts = 'NaN' THEN null
			ELSE CAST(SPLIT_PART(raw.home_pass_comp_attempts, '/', 1) AS INTEGER)
		END AS home_pass_completions
,		CASE WHEN raw.home_pass_comp_attempts = '' OR raw.home_pass_comp_attempts = 'NaN' THEN null
			ELSE CAST(SPLIT_PART(raw.home_pass_comp_attempts, '/', 2) AS INTEGER)
		END AS home_pass_attempts
,		CASE WHEN raw.home_pass_yards = '' OR raw.home_pass_yards = 'NaN' THEN null
			ELSE CAST(raw.home_pass_yards AS INTEGER) 
		END AS home_pass_yards
,		CASE WHEN raw.home_pass_yards = '' OR raw.home_pass_yards = 'NaN' OR
			raw.home_pass_comp_attempts = '' OR raw.home_pass_comp_attempts = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_pass_yards AS NUMERIC) / CAST(SPLIT_PART(raw.home_pass_comp_attempts, '/', 2) AS NUMERIC),2) 
		END AS home_pass_yards_per_attempt
,		CASE WHEN raw.home_pass_tds = '' OR raw.home_pass_tds = 'NaN' THEN null
			ELSE CAST(raw.home_pass_tds AS INTEGER) 
		END AS home_pass_tds
,		CASE WHEN raw.home_pass_tds = '' OR raw.home_pass_tds = 'NaN' OR
			raw.home_pass_comp_attempts = '' OR raw.home_pass_comp_attempts = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_pass_tds AS NUMERIC) / CAST(SPLIT_PART(raw.home_pass_comp_attempts, '/', 2) AS NUMERIC),3) 
		END AS home_pass_tds_percent
,		CASE WHEN raw.home_pass_ints = '' OR raw.home_pass_ints = 'NaN' THEN null
			ELSE CAST(raw.home_pass_ints AS INTEGER) 
		END AS home_pass_ints
,		CASE WHEN raw.home_pass_ints = '' OR raw.home_pass_ints = 'NaN' OR
			raw.home_pass_comp_attempts = '' OR raw.home_pass_comp_attempts = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_pass_ints AS NUMERIC) / CAST(SPLIT_PART(raw.home_pass_comp_attempts, '/', 2) AS NUMERIC),3) 
		END AS home_pass_ints_percent
,		CASE WHEN
    		SPLIT_PART(raw.home_sacks_allowed, '-', 1) = 'NaN' OR SPLIT_PART(raw.home_sacks_allowed, '-', 1) = '' THEN null
    		ELSE SPLIT_PART(raw.home_sacks_allowed, '-', 1)::INTEGER
  		END AS home_sacks_allowed
,  		CASE WHEN
    		SPLIT_PART(raw.home_sacks_allowed, '-', 2) = 'NaN' OR SPLIT_PART(raw.home_sacks_allowed, '-', 2) = '' THEN null
    		ELSE SPLIT_PART(raw.home_sacks_allowed, '-', 2)::INTEGER
  		END AS home_sack_yardage_allowed	
,		CASE WHEN 
			raw.home_pass_rating = '' OR raw.home_pass_rating = 'NaN' THEN null
			ELSE CAST(raw.home_pass_rating AS NUMERIC)
		END AS home_pass_rating
,		CASE WHEN 
			raw.home_rush_attempts = '' OR raw.home_rush_attempts = 'NaN' THEN null
			ELSE CAST(raw.home_rush_attempts AS INTEGER)
		END AS home_rush_attempts
,		CASE WHEN 
			raw.home_rush_yards = '' OR raw.home_rush_yards = 'NaN' THEN null
			ELSE CAST(raw.home_rush_yards AS INTEGER)
		END AS home_rush_yards
,		CASE WHEN 
			raw.home_rush_yards = '' OR raw.home_rush_yards = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_rush_yards AS NUMERIC) / CAST(raw.home_rush_attempts AS NUMERIC),2)
		END AS home_rush_yards_per_attempt	
,		CASE WHEN 
			raw.home_rush_tds = '' OR raw.home_rush_tds = 'NaN' THEN null
			ELSE CAST(raw.home_rush_tds AS INTEGER)
		END AS home_rush_tds	
,		CASE WHEN 
			raw.home_rush_long = '' OR raw.home_rush_long = 'NaN' THEN null
			ELSE CAST(raw.home_rush_long AS INTEGER)
		END AS home_rush_long
,		CASE WHEN 
			raw.home_rec_targets = '' OR raw.home_rec_targets = 'NaN' THEN null
			ELSE CAST(raw.home_rec_targets AS INTEGER)
		END AS home_rec_targets		
,		CASE WHEN 
			raw.home_rec_receptions = '' OR raw.home_rec_receptions = 'NaN' THEN null
			ELSE CAST(raw.home_rec_receptions AS INTEGER)
		END AS home_receptions		
,		CASE WHEN 
			raw.home_rec_yards = '' OR raw.home_rec_yards = 'NaN' THEN null
			ELSE CAST(raw.home_rec_yards AS INTEGER)
		END AS home_rec_yards				
,		CASE WHEN 
			raw.home_rec_receptions = '' OR raw.home_rec_receptions = 'NaN' THEN null
			ELSE ROUND(CAST(raw.home_rec_yards AS NUMERIC) / CAST(raw.home_rec_receptions AS NUMERIC),2)
		END AS home_yards_per_reception
,		CASE WHEN 
			raw.home_rec_tds = '' OR raw.home_rec_tds = 'NaN' THEN null
			ELSE CAST(raw.home_rec_tds AS INTEGER)
		END AS home_rec_tds	
,		CASE WHEN 
			raw.home_rec_long = '' OR raw.home_rec_long = 'NaN' THEN null
			ELSE CAST(raw.home_rec_long AS INTEGER)
		END AS home_rec_long		
,		CASE WHEN
			raw.away_team_final = '' OR raw.away_team_final = 'NaN' THEN null
			WHEN raw.home_team_final = '' OR raw.home_team_final = 'NaN' THEN null
			WHEN ROUND(CAST(raw.home_team_final AS NUMERIC)) > ROUND(CAST(raw.away_team_final AS NUMERIC)) THEN 0
			WHEN ROUND(CAST(raw.home_team_final AS NUMERIC)) < ROUND(CAST(raw.away_team_final AS NUMERIC)) THEN 1
			ELSE 2
		END AS game_result
  
FROM
  raw.nfl_game_data raw
LEFT JOIN
  dbo.nfl_game_data d ON raw.espn_game_id = d.espn_game_id
WHERE
  d.espn_game_id IS NULL;