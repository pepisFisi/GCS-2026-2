-- migrate:up

ALTER TABLE teams
    MODIFY COLUMN name VARCHAR(40) NOT NULL;

-- migrate:down

ALTER TABLE teams
    MODIFY COLUMN name VARCHAR(10) NOT NULL;
