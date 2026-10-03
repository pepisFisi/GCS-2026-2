-- migrate:up

CREATE TABLE goalkeepers (
    id INT NOT NULL AUTO_INCREMENT,
    player_id INT NOT NULL,
    gk_diving INT NOT NULL,
    gk_handling INT NOT NULL,
    gk_kicking INT NOT NULL,
    gk_positioning INT NOT NULL,
    gk_reflexes INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_goalkeepers_player
        FOREIGN KEY (player_id) REFERENCES players(id)
);

-- migrate:down

DROP TABLE goalkeepers;
