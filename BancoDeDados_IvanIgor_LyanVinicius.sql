-- 1. Criação do Banco de Dados
CREATE DATABASE EscolaFicticia;
USE EscolaFicticia;
-- 2. Criação das Tabelas

-- Tabela Professor
CREATE TABLE Professor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Endereco VARCHAR(150),
    CarteiraTrabalho VARCHAR(20),
    Salario DECIMAL(10, 2),
    Tipo ENUM('Efetivo', 'Treinamento') NOT NULL,
    Seguro VARCHAR(50),
    DataInicialTreinamento DATE,
    DataFinalTreinamento DATE
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CargaHoraria INT NOT NULL,
    Creditos INT NOT NULL
);

-- Tabela Turma
CREATE TABLE Turma (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Turno ENUM('Matutino', 'Vespertino', 'Noturno') NOT NULL,
    Sala VARCHAR(10)
);

-- Tabela Aluno
CREATE TABLE Aluno (
    Matricula INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE NOT NULL,
    TurmaID INT,
    FOREIGN KEY (TurmaID) REFERENCES Turma(ID)
);

-- Tabela Período Letivo
CREATE TABLE PeriodoLetivo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DataInicio DATE NOT NULL,
    DataFim DATE NOT NULL
);

-- Tabela de Relacionamento entre Professor e Disciplina
CREATE TABLE ProfessorDisciplina (
    ProfessorID INT,
    DisciplinaID INT,
    PeriodoLetivoID INT,
    PRIMARY KEY (ProfessorID, DisciplinaID, PeriodoLetivoID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ID),
    FOREIGN KEY (DisciplinaID) REFERENCES Disciplina(ID),
    FOREIGN KEY (PeriodoLetivoID) REFERENCES PeriodoLetivo(ID)
);

-- Tabela de Relacionamento entre Disciplina e Turma
CREATE TABLE DisciplinaTurma (
    DisciplinaID INT,
    TurmaID INT,
    PRIMARY KEY (DisciplinaID, TurmaID),
    FOREIGN KEY (DisciplinaID) REFERENCES Disciplina(ID),
    FOREIGN KEY (TurmaID) REFERENCES Turma(ID)
);
-- 3. Inserção de Registros de Exemplo

-- Inserção em Professor
INSERT INTO Professor (Nome, CPF, Endereco, CarteiraTrabalho, Salario, Tipo, Seguro, DataInicialTreinamento, DataFinalTreinamento)
VALUES 
('João Silva', '12345678901', 'Rua A, 123', '123456', 3000.00, 'Efetivo', 'Seguro A', NULL, NULL),
('Maria Oliveira', '23456789012', 'Rua B, 456', '234567', 2500.00, 'Treinamento', 'Seguro B', '2024-01-01', '2024-06-01'),
('Carlos Souza', '34567890123', 'Rua C, 789', '345678', 3200.00, 'Efetivo', 'Seguro C', NULL, NULL),
('Ana Lima', '45678901234', 'Rua D, 101', '456789', 2800.00, 'Efetivo', 'Seguro D', NULL, NULL),
('Pedro Martins', '56789012345', 'Rua E, 111', '567890', 2600.00, 'Treinamento', 'Seguro E', '2024-02-01', '2024-08-01'),
('Juliana Mendes', '67890123456', 'Rua F, 112', '678901', 3100.00, 'Efetivo', 'Seguro F', NULL, NULL),
('Lucas Andrade', '78901234567', 'Rua G, 113', '789012', 2950.00, 'Treinamento', 'Seguro G', '2024-03-01', '2024-09-01'),
('Sofia Nunes', '89012345678', 'Rua H, 114', '890123', 2700.00, 'Efetivo', 'Seguro H', NULL, NULL),
('Gabriel Costa', '90123456789', 'Rua I, 115', '901234', 3000.00, 'Treinamento', 'Seguro I', '2024-04-01', '2024-10-01'),
('Beatriz Rocha', '01234567890', 'Rua J, 116', '012345', 2800.00, 'Efetivo', 'Seguro J', NULL, NULL),
('Rodrigo Ferreira', '11111111111', 'Rua K, 117', '111111', 2900.00, 'Treinamento', 'Seguro K', '2024-05-01', '2024-11-01'),
('Camila Alves', '22222222222', 'Rua L, 118', '222222', 3200.00, 'Efetivo', 'Seguro L', NULL, NULL),
('Diego Santos', '33333333333', 'Rua M, 119', '333333', 3100.00, 'Efetivo', 'Seguro M', NULL, NULL),
('Fernanda Lima', '44444444444', 'Rua N, 120', '444444', 2700.00, 'Treinamento', 'Seguro N', '2024-06-01', '2024-12-01'),
('Thiago Ribeiro', '55555555555', 'Rua O, 121', '555555', 3000.00, 'Efetivo', 'Seguro O', NULL, NULL);

-- Inserção em Disciplina
INSERT INTO Disciplina (Nome, CargaHoraria, Creditos)
VALUES 
('Matemática', 60, 4),
('História', 40, 3),
('Português', 50, 3),
('Geografia', 45, 2),
('Física', 60, 4),
('Química', 50, 3),
('Biologia', 45, 2),
('Inglês', 40, 2),
('Espanhol', 40, 2),
('Educação Física', 30, 1),
('Artes', 30, 1),
('Filosofia', 35, 2),
('Sociologia', 35, 2),
('Ciências', 50, 3),
('Tecnologia', 40, 2);

-- Inserção em Turma
INSERT INTO Turma (Nome, Turno, Sala)
VALUES 
('Turma A', 'Matutino', 'Sala 101'),
('Turma B', 'Vespertino', 'Sala 202'),
('Turma C', 'Noturno', 'Sala 303'),
('Turma D', 'Matutino', 'Sala 104'),
('Turma E', 'Vespertino', 'Sala 205'),
('Turma F', 'Noturno', 'Sala 306'),
('Turma G', 'Matutino', 'Sala 107'),
('Turma H', 'Vespertino', 'Sala 208'),
('Turma I', 'Noturno', 'Sala 309'),
('Turma J', 'Matutino', 'Sala 110'),
('Turma K', 'Vespertino', 'Sala 211'),
('Turma L', 'Noturno', 'Sala 312'),
('Turma M', 'Matutino', 'Sala 113'),
('Turma N', 'Vespertino', 'Sala 214'),
('Turma O', 'Noturno', 'Sala 315');

-- Inserção em Aluno
INSERT INTO Aluno (Nome, DataNascimento, TurmaID)
VALUES 
('Pedro Santos', '2005-08-15', 1),
('Ana Costa', '2006-03-22', 2),
('Carlos Silva', '2005-09-10', 3),
('Fernanda Oliveira', '2006-01-05', 4),
('Ricardo Lima', '2005-07-18', 5),
('Larissa Souza', '2006-12-02', 6),
('Mariana Mendes', '2005-05-25', 7),
('Bruno Rocha', '2006-04-30', 8),
('Rafael Costa', '2005-10-10', 9),
('Julia Nunes', '2006-02-15', 10),
('Leonardo Martins', '2005-06-20', 11),
('Camila Alves', '2006-11-22', 12),
('Thiago Ribeiro', '2005-03-03', 13),
('Sofia Ferreira', '2006-08-18', 14),
('Lucas Andrade', '2005-12-12', 15);

-- Inserção em Período Letivo
INSERT INTO PeriodoLetivo (DataInicio, DataFim)
VALUES 
('2024-02-01', '2024-06-30'),
('2024-07-01', '2024-12-31'),
('2025-02-01', '2025-06-30'),
('2025-07-01', '2025-12-31'),
('2026-02-01', '2026-06-30'),
('2026-07-01', '2026-12-31'),
('2027-02-01', '2027-06-30'),
('2027-07-01', '2027-12-31'),
('2028-02-01', '2028-06-30'),
('2028-07-01', '2028-12-31'),
('2029-02-01', '2029-06-30'),
('2029-07-01', '2029-12-31'),
('2030-02-01', '2030-06-30'),
('2030-07-01', '2030-12-31'),
('2031-02-01', '2031-06-30');

-- Inserção em ProfessorDisciplina (Relacionamento)
INSERT INTO ProfessorDisciplina (ProfessorID, DisciplinaID, PeriodoLetivoID)
VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 4),
(9, 9, 5),
(10, 10, 5),
(11, 11, 6),
(12, 12, 6),
(13, 13, 7),
(14, 14, 7),
(15, 15, 8);

-- Inserção em DisciplinaTurma (Relacionamento)
INSERT INTO DisciplinaTurma (DisciplinaID, TurmaID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- 4. Consultas SQL

-- Consulta que retorna dados dos professores efetivos, as disciplinas que ministram e as turmas associadas
SELECT 
    p.Nome AS Professor,
    d.Nome AS Disciplina,
    t.Nome AS Turma
FROM 
    Professor p
JOIN 
    ProfessorDisciplina pd ON p.ID = pd.ProfessorID
JOIN 
    Disciplina d ON pd.DisciplinaID = d.ID
JOIN 
    DisciplinaTurma dt ON d.ID = dt.DisciplinaID
JOIN 
    Turma t ON dt.TurmaID = t.ID
WHERE 
    p.Tipo = 'Efetivo';

-- Consulta que retorna a soma dos salários dos professores efetivos e o total dos salários de todos os professores
SELECT 
    SUM(CASE WHEN Tipo = 'Efetivo' THEN Salario ELSE 0 END) AS TotalSalariosEfetivos,
    SUM(Salario) AS TotalSalariosTodos
FROM 
    Professor;



