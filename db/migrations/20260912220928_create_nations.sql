-- migrate:up

CREATE TABLE nations (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
);

-- migrate:down

DROP TABLE nations;
