/* 6-ClassificadosWeb_Logico: */

CREATE TABLE Anuncio (
    idAnuncio integer PRIMARY KEY,
    Destaque boolean,
    NomeAnuncio varchar(100),
    TextoAnuncio varchar(200),
    Preco float,
    NomeContato varchar(100),
    Telefone1 varchar(12),
    Telefone2 varchar(12),
    ObsTelefone varchar(50),
    DataAnuncio datetime,
    fk_Anunciante_idAnunciante integer
);

CREATE TABLE Anunciante (
    idAnunciante integer PRIMARY KEY,
    NomeAnunciante varchar(100),
    CPF_CNPJ varchar(14),
    Contato varchar(12)
);
 
ALTER TABLE Anuncio ADD CONSTRAINT FK_Anuncio_2
    FOREIGN KEY (fk_Anunciante_idAnunciante)
    REFERENCES Anunciante (idAnunciante)
    ON DELETE RESTRICT;