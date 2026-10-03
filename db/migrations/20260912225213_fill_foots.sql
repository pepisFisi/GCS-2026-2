-- migrate:up

INSERT INTO foots (id,name) VALUES (1,'Right');
INSERT INTO foots (id,name) VALUES (2, 'Left');

-- migrate:down

DELETE FROM foots;
