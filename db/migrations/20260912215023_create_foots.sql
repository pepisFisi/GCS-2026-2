-- migrate:up

CREATE TABLE foots (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(5) NOT NULL,
    PRIMARY KEY (id)
);

-- migrate:down

DROP TABLE foots;
