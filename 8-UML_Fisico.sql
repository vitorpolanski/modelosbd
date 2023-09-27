/* 8-UML_Logico: */

CREATE TABLE CasosUso (
    idCasoUso integer PRIMARY KEY,
    NomeCaso varchar(100),
    Status varchar(20),
    Template varchar(100),
    Extensao boolean,
    fk_Pacote_idPacote integer
);

CREATE TABLE Pacote (
    idPacote integer PRIMARY KEY,
    NomePacote varchar(100)
);
 
ALTER TABLE CasosUso ADD CONSTRAINT FK_CasosUso_2
    FOREIGN KEY (fk_Pacote_idPacote)
    REFERENCES Pacote (idPacote)
    ON DELETE RESTRICT;