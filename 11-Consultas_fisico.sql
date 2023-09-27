/* 11-Consultas_logico: */

CREATE TABLE Paciente (
    idPaciente integer PRIMARY KEY,
    NomePaciente varchar(100),
    Endereco varchar(100),
    Telefone varchar(12),
    Nascimento date,
    PrimeiraConsulta date,
    Email varchar(100),
    Convenio varchar(100)
);

CREATE TABLE Consultorio (
    idConsultorio integer PRIMARY KEY,
    Consultorio varchar(100)
);

CREATE TABLE Medico (
    idMedico integer PRIMARY KEY,
    CRM varchar(9),
    NomeMedico varchar(100)
);

CREATE TABLE Consulta (
    idConsulta integer PRIMARY KEY,
    idPaciente integer,
    idMedico integer,
    DataConsulta datetime,
    DataLimite datetime,
    Encaixe boolean,
    fk_Medico_idMedico integer,
    fk_Consultorio_idConsultorio integer,
    fk_Paciente_idPaciente integer
);
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_2
    FOREIGN KEY (fk_Medico_idMedico)
    REFERENCES Medico (idMedico)
    ON DELETE CASCADE;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_3
    FOREIGN KEY (fk_Consultorio_idConsultorio)
    REFERENCES Consultorio (idConsultorio)
    ON DELETE CASCADE;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_4
    FOREIGN KEY (fk_Paciente_idPaciente)
    REFERENCES Paciente (idPaciente)
    ON DELETE RESTRICT;