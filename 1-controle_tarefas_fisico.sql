/* 1-controle_tarefas_logico: */

CREATE TABLE Tarefa (
    id_Tarefa integer PRIMARY KEY,
    Prioridade float,
    NomeTarefa varchar(200),
    DataLimite date,
    PercentualTarefa float,
    Detalhamento varchar(200),
    StatusConclusao boolean,
    DataConclusao date
);

CREATE TABLE Item (
    idItem integer PRIMARY KEY,
    PercentualItem float,
    Descricao varchar(200),
    DataExecucao date,
    fk_Tarefa_id_Tarefa integer
);
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Tarefa_id_Tarefa)
    REFERENCES Tarefa (id_Tarefa)
    ON DELETE RESTRICT;