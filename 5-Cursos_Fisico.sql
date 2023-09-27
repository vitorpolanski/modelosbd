/* 5-Cursos_Logico: */

CREATE TABLE Cursos (
    idCurso integer PRIMARY KEY,
    NomeCurso varchar(50),
    CargaHoraria integer,
    Valor float
);

CREATE TABLE Aluno (
    idAluno integer PRIMARY KEY,
    NomeAluno varchar(100),
    CPF varchar(11),
    Nascimento date,
    Endereco varchar(100),
    Cidade varchar(50)
);

CREATE TABLE Turma (
    idTurma integer PRIMARY KEY,
    DataInicio date,
    DataTermino date,
    fk_Cursos_idCurso integer
);

CREATE TABLE Professor (
    idProfessor integer PRIMARY KEY,
    Contato varchar(12),
    ValorHoraAula float,
    NomeProfessor varchar(100)
);

CREATE TABLE Matricula (
    idMatricula integer PRIMARY KEY,
    DataMatricula date,
    ValorPago float,
    fk_Turma_idTurma integer
);

CREATE TABLE Realiza (
    fk_Matricula_idMatricula integer,
    fk_Aluno_idAluno integer
);

CREATE TABLE Ministra (
    fk_Turma_idTurma integer,
    fk_Professor_idProfessor integer
);
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_2
    FOREIGN KEY (fk_Cursos_idCurso)
    REFERENCES Cursos (idCurso)
    ON DELETE RESTRICT;
 
ALTER TABLE Matricula ADD CONSTRAINT FK_Matricula_2
    FOREIGN KEY (fk_Turma_idTurma)
    REFERENCES Turma (idTurma)
    ON DELETE CASCADE;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_1
    FOREIGN KEY (fk_Matricula_idMatricula)
    REFERENCES Matricula (idMatricula)
    ON DELETE RESTRICT;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_2
    FOREIGN KEY (fk_Aluno_idAluno)
    REFERENCES Aluno (idAluno)
    ON DELETE SET NULL;
 
ALTER TABLE Ministra ADD CONSTRAINT FK_Ministra_1
    FOREIGN KEY (fk_Turma_idTurma)
    REFERENCES Turma (idTurma)
    ON DELETE RESTRICT;
 
ALTER TABLE Ministra ADD CONSTRAINT FK_Ministra_2
    FOREIGN KEY (fk_Professor_idProfessor)
    REFERENCES Professor (idProfessor)
    ON DELETE RESTRICT;