/* 9-ClubeLeitura_Logico: */

CREATE TABLE Revista (
    idRevista integer PRIMARY KEY,
    TipoColecao varchar(100),
    NEdicao integer,
    Ano integer,
    CaixaGuardada varchar(100)
);

CREATE TABLE Crianca (
    idCrianca integer PRIMARY KEY,
    NomeCrianca varchar(100),
    Revista varchar(100),
    DataEmprestimo date,
    DataDevolucao date
);

CREATE TABLE Empresta (
    fk_Crianca_idCrianca integer,
    fk_Revista_idRevista integer
);
 
ALTER TABLE Empresta ADD CONSTRAINT FK_Empresta_1
    FOREIGN KEY (fk_Crianca_idCrianca)
    REFERENCES Crianca (idCrianca)
    ON DELETE RESTRICT;
 
ALTER TABLE Empresta ADD CONSTRAINT FK_Empresta_2
    FOREIGN KEY (fk_Revista_idRevista)
    REFERENCES Revista (idRevista)
    ON DELETE SET NULL;