# nfl-data-scraper
Scrape and transform historical NFL game data.

There are currently 3 components to the data aspect of this project (they are described below in their run sequence):

1. Scraping historical NFL game data from ESPN and batch inserting it into a Postgres database.
     (nfl_data_scraper.ipynb)
2. Transforming the data from the raw schema to the working schema with some cleaning and feature engineering.
     (cast_raw_to_dbo_nfl_game_data.sql)
3. Interacting with a weather API to populate the weather column in the historical game data.
     (nfl_game_weather_data.ipynb)
