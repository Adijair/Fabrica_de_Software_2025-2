/* modele escola de liguas */

CREATE DATABASE escola;
USE escola;

CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE
);

CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT,
    disciplinas VARCHAR(255)
);

CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    especialidade VARCHAR(100),
    matricula VARCHAR(20) UNIQUE
);

CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    sala VARCHAR(20),
    horario VARCHAR(50),
    id_curso INT NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_matricula DATE,
    status_matricula VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);