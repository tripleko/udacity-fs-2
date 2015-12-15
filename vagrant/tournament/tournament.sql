-- Table definitions for the tournament project.
--
-- Attempt to drop database, will fail if connected to.
-- Then attempt to create and connect to database.
--
-- In case there was already a connection, will attempt to drop views and tables.
--
-- In either case, create new tables and views.
--
-- View was made with help of info from: http://stackoverflow.com/a/29936626

DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;
DROP VIEW standings CASCADE;
DROP TABLE matches CASCADE;
DROP TABLE players CASCADE;

CREATE TABLE players (name VARCHAR(100),
                      id SERIAL PRIMARY KEY UNIQUE);

CREATE TABLE matches (winner INTEGER REFERENCES players(id),
                      loser INTEGER REFERENCES players(id),
                      id SERIAL PRIMARY KEY UNIQUE);

CREATE VIEW standings AS
    (SELECT   players.id, name,
              COUNT(CASE players.id WHEN winner THEN 1 ELSE NULL END) AS wins,
              COUNT(matches.id) AS matches
    FROM      players
    LEFT JOIN matches ON players.id IN (winner, loser)
    GROUP BY players.id);