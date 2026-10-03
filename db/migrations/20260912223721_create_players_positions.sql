-- migrate:up

CREATE TABLE players_positions (
    id INT NOT NULL AUTO_INCREMENT,
    player_id INT NOT NULL,
    position_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_players_positions_player
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fk_players_positions_position
        FOREIGN KEY (position_id) REFERENCES positions(id)
);

-- migrate:down

DROP TABLE players_positions;
