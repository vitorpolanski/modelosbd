/* 2-ligacoes_telefonicas_logico: */

CREATE TABLE Ligacao (
    id_ligacao integer PRIMARY KEY,
    horario datetime,
    tempo_gasto time,
    n_pulsos integer,
    destinatario varchar(12),
    fk_Contatos_id_contato integer
);

CREATE TABLE Contatos (
    id_contato integer PRIMARY KEY,
    numero varchar(12),
    nome varchar(100)
);
 
ALTER TABLE Ligacao ADD CONSTRAINT FK_Ligacao_2
    FOREIGN KEY (fk_Contatos_id_contato)
    REFERENCES Contatos (id_contato)
    ON DELETE CASCADE;