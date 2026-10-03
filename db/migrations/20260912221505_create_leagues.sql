-- migrate:up

CREATE TABLE leagues (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    nation_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_leagues_nation
        FOREIGN KEY (nation_id) REFERENCES nations(id)
);

-- migrate:down

DROP TABLE leagues;
