/* 4-FestasInfantis_Logico: */

CREATE TABLE Tema (
    idTema integer PRIMARY KEY,
    Tema varchar(100),
    ValorAluguel float,
    CorToalha varchar(50),
    ListaItens varchar(100)
);

CREATE TABLE Cliente (
    idCliente integer PRIMARY KEY,
    Nome varchar(100),
    Endereco varchar(100),
    Contato varchar(12)
);

CREATE TABLE Festa (
    idFesta integer PRIMARY KEY,
    EnderecoFesta varchar(100),
    HorarioInicio datetime,
    HorarioTermino datetime,
    ValorCobrado float,
    fk_Tema_idTema integer,
    fk_Cliente_idCliente integer
);

CREATE TABLE Itens (
    idItem integer PRIMARY KEY,
    Item varchar(100),
    QuantidadesDisponiveis integer,
    Peso float
);

CREATE TABLE Possui (
    fk_Itens_idItem integer,
    fk_Tema_idTema integer
);
 
ALTER TABLE Festa ADD CONSTRAINT FK_Festa_2
    FOREIGN KEY (fk_Tema_idTema)
    REFERENCES Tema (idTema)
    ON DELETE CASCADE;
 
ALTER TABLE Festa ADD CONSTRAINT FK_Festa_3
    FOREIGN KEY (fk_Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (fk_Itens_idItem)
    REFERENCES Itens (idItem)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_2
    FOREIGN KEY (fk_Tema_idTema)
    REFERENCES Tema (idTema)
    ON DELETE RESTRICT;