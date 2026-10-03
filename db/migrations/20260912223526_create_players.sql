-- migrate:up

CREATE TABLE players (
    id INT NOT NULL AUTO_INCREMENT,
    ranking INT NOT NULL,
    name VARCHAR(40) NOT NULL,
    ovr INT NOT NULL,
    pac INT NOT NULL,
    sho INT NOT NULL,
    pas INT NOT NULL,
    dri INT NOT NULL,
    def INT NOT NULL,
    phy INT NOT NULL,
    weak_foot INT NOT NULL,
    skill_moves INT NOT NULL,
    height INT NOT NULL,
    weight INT NOT NULL,
    age INT NOT NULL,
    url VARCHAR(200) NOT NULL,
    position_id INT NOT NULL,
    nation_id INT NOT NULL,
    team_id INT NOT NULL,
    foot_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_players_position
        FOREIGN KEY (position_id) REFERENCES positions(id),
    CONSTRAINT fk_players_nation
        FOREIGN KEY (nation_id) REFERENCES nations(id),
    CONSTRAINT fk_players_team
        FOREIGN KEY (team_id) REFERENCES teams(id),
    CONSTRAINT fk_players_foot
        FOREIGN KEY (foot_id) REFERENCES foots(id)
);

-- migrate:down

DROP TABLE players;
