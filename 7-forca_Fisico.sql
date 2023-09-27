/* 7-forca_Logico: */

CREATE TABLE Temas (
    idTema integer PRIMARY KEY,
    Tema varchar(100)
);

CREATE TABLE Dica (
    idDica integer PRIMARY KEY,
    Dica varchar(200),
    Frase boolean,
    fk_Temas_idTema integer
);

CREATE TABLE Tentativa (
    idTentativa integer PRIMARY KEY,
    PalavrasOuFrase varchar(200),
    Jogador varchar(100),
    QntAcertos integer,
    QntErros integer,
    Pontos integer
);

CREATE TABLE Rodada (
    fk_Dica_idDica integer,
    fk_Tentativa_idTentativa integer
);
 
ALTER TABLE Dica ADD CONSTRAINT FK_Dica_2
    FOREIGN KEY (fk_Temas_idTema)
    REFERENCES Temas (idTema)
    ON DELETE RESTRICT;
 
ALTER TABLE Rodada ADD CONSTRAINT FK_Rodada_1
    FOREIGN KEY (fk_Dica_idDica)
    REFERENCES Dica (idDica)
    ON DELETE RESTRICT;
 
ALTER TABLE Rodada ADD CONSTRAINT FK_Rodada_2
    FOREIGN KEY (fk_Tentativa_idTentativa)
    REFERENCES Tentativa (idTentativa)
    ON DELETE SET NULL;