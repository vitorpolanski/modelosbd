/* 12-loteria_logico: */

CREATE TABLE Cartoes (
    id_cartao integer PRIMARY KEY,
    n_apostados varchar(20),
    data_aposta date,
    fk_Loteria_id_loteria integer
);

CREATE TABLE Concursos (
    id_concurso integer PRIMARY KEY,
    n_sorteados varchar(20),
    valor_premio float,
    data_sorteio date,
    fk_Loteria_id_loteria integer
);

CREATE TABLE Relatorio (
    id_relatorio integer PRIMARY KEY,
    data_concurso date,
    n_acertados varchar(20),
    premio float,
    fk_Concursos_id_concurso integer
);

CREATE TABLE Loteria (
    id_loteria integer PRIMARY KEY,
    nome_loteria varchar(30),
    valor_aposta float
);

CREATE TABLE Aposta (
    fk_Concursos_id_concurso integer,
    fk_Cartoes_id_cartao integer
);
 
ALTER TABLE Cartoes ADD CONSTRAINT FK_Cartoes_2
    FOREIGN KEY (fk_Loteria_id_loteria)
    REFERENCES Loteria (id_loteria)
    ON DELETE CASCADE;
 
ALTER TABLE Concursos ADD CONSTRAINT FK_Concursos_2
    FOREIGN KEY (fk_Loteria_id_loteria)
    REFERENCES Loteria (id_loteria)
    ON DELETE RESTRICT;
 
ALTER TABLE Relatorio ADD CONSTRAINT FK_Relatorio_2
    FOREIGN KEY (fk_Concursos_id_concurso)
    REFERENCES Concursos (id_concurso)
    ON DELETE RESTRICT;
 
ALTER TABLE Aposta ADD CONSTRAINT FK_Aposta_1
    FOREIGN KEY (fk_Concursos_id_concurso)
    REFERENCES Concursos (id_concurso)
    ON DELETE RESTRICT;
 
ALTER TABLE Aposta ADD CONSTRAINT FK_Aposta_2
    FOREIGN KEY (fk_Cartoes_id_cartao)
    REFERENCES Cartoes (id_cartao)
    ON DELETE SET NULL;