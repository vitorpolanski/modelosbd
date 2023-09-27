/* 3_teste_logico: */

CREATE TABLE Questoes (
    idQuestoes integer PRIMARY KEY,
    Questao varchar(200),
    Bimestre integer,
    Materia integer
);

CREATE TABLE Teste (
    idTeste integer PRIMARY KEY,
    Data date,
    Gabarito varchar(100),
    ListaDeQuestoes varchar(200)
);

CREATE TABLE Disciplina (
    idDisciplina integer PRIMARY KEY,
    Disciplina varchar(100)
);

CREATE TABLE Materia (
    idMateria integer PRIMARY KEY,
    Materia varchar(100),
    Disciplina integer,
    fk_Disciplina_idDisciplina integer
);

CREATE TABLE R3 (
    FK_Questoes_idQuestoes integer,
    FK_Teste_idTeste integer
);

CREATE TABLE R2 (
    FK_Materia_idMateria integer,
    FK_Questoes_idQuestoes integer
);
 
ALTER TABLE Materia ADD CONSTRAINT FK_Materia_2
    FOREIGN KEY (fk_Disciplina_idDisciplina)
    REFERENCES Disciplina (idDisciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE R3 ADD CONSTRAINT FK_R3_1
    FOREIGN KEY (FK_Questoes_idQuestoes)
    REFERENCES Questoes (idQuestoes)
    ON DELETE RESTRICT;
 
ALTER TABLE R3 ADD CONSTRAINT FK_R3_2
    FOREIGN KEY (FK_Teste_idTeste)
    REFERENCES Teste (idTeste)
    ON DELETE RESTRICT;
 
ALTER TABLE R2 ADD CONSTRAINT FK_R2_1
    FOREIGN KEY (FK_Materia_idMateria)
    REFERENCES Materia (idMateria)
    ON DELETE RESTRICT;
 
ALTER TABLE R2 ADD CONSTRAINT FK_R2_2
    FOREIGN KEY (FK_Questoes_idQuestoes)
    REFERENCES Questoes (idQuestoes)
    ON DELETE RESTRICT;