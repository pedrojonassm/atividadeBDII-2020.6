CREATE TABLE if not exists cliente
(
    codigo integer NOT NULL,
    nome character varying(255)[],
    num_voos integer,
    PRIMARY KEY (codigo)
);

CREATE TABLE if not exists piloto
(
    codigo integer NOT NULL,
    nome character varying(255)[],
    num_voos integer,
    PRIMARY KEY (codigo)
);

CREATE TABLE if not exists voo
(
    codigo integer NOT NULL,
    piloto integer NOT NULL,
    distancia integer NOT NULL,
    num_passageiros integer,
    tipo character varying(255)[],
    PRIMARY KEY (codigo),
    CONSTRAINT cod_piloto FOREIGN KEY (piloto)
        REFERENCES piloto MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
