/* 10-Condominio_Logico: */

CREATE TABLE Apartamento (
    idApartamento integer PRIMARY KEY,
    NumeroPorta varchar(4),
    QntQuartos integer,
    Ocupacao varchar(20),
    NomeProp varchar(100),
    Contato varchar(12),
    fk_Condominio_idCondominio integer,
    fk_Proprietario_idProprietario integer
);

CREATE TABLE Proprietario (
    idProprietario integer PRIMARY KEY,
    NomeProp varchar(100),
    CPF varchar(11)
);

CREATE TABLE Despesas (
    idDespesas integer PRIMARY KEY,
    DespesaDespesa varchar(100),
    Ordinaria boolean,
    Valor float,
    ReferenciaDespesa date,
    Vencimento date
);

CREATE TABLE Condominio (
    idCondominio integer PRIMARY KEY,
    ValorCondominio float,
    ReferenciaCondominio date,
    DataVencimento date,
    DataPagamento date,
    TaxaExtra boolean
);

CREATE TABLE Gera (
    fk_Despesas_idDespesas integer,
    fk_Apartamento_idApartamento integer
);
 
ALTER TABLE Apartamento ADD CONSTRAINT FK_Apartamento_2
    FOREIGN KEY (fk_Condominio_idCondominio)
    REFERENCES Condominio (idCondominio)
    ON DELETE RESTRICT;
 
ALTER TABLE Apartamento ADD CONSTRAINT FK_Apartamento_3
    FOREIGN KEY (fk_Proprietario_idProprietario)
    REFERENCES Proprietario (idProprietario)
    ON DELETE RESTRICT;
 
ALTER TABLE Gera ADD CONSTRAINT FK_Gera_1
    FOREIGN KEY (fk_Despesas_idDespesas)
    REFERENCES Despesas (idDespesas)
    ON DELETE RESTRICT;
 
ALTER TABLE Gera ADD CONSTRAINT FK_Gera_2
    FOREIGN KEY (fk_Apartamento_idApartamento)
    REFERENCES Apartamento (idApartamento)
    ON DELETE SET NULL;