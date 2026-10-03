-- migrate:up

CREATE TABLE teams (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    league_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_teams_league
        FOREIGN KEY (league_id) REFERENCES leagues(id)
);

-- migrate:down

DROP TABLE teams;
