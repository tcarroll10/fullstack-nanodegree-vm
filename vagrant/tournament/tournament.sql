-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


CREATE DATABASE tournament;
\c tournament

CREATE TABLE player(id serial,
              name text,
              PRIMARY KEY(id)
            );

CREATE TABLE match(winner_id integer,
                    loser_id integer,
                    FOREIGN KEY (winner_id) REFERENCES player(id),
                    FOREIGN KEY (loser_id) REFERENCES player(id),
                    PRIMARY KEY (winner_id,loser_id)
                  );
Create View Standings as SELECT id, name, (select count(*) from match where winner_id = id) as wins,(select count(*) from match where winner_id =id or loser_id = id) as matches from player order by wins desc;
