-- migrate:up

CREATE TABLE players_play_styles (
    id INT NOT NULL AUTO_INCREMENT,
    player_id INT NOT NULL,
    play_style_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_players_play_styles_player
        FOREIGN KEY (player_id) REFERENCES players(id),
    CONSTRAINT fk_players_play_styles_play_style
        FOREIGN KEY (play_style_id) REFERENCES play_styles(id)
);

-- migrate:down

DROP TABLE players_play_styles;
