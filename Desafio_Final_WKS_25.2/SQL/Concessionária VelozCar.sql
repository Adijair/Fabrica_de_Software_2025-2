-- Definição e Criação do Banco de Dados (DDL)
CREATE SCHEMA ConcessionariaVelozCar;

-- Seleciona o banco de dados para uso;
USE ConcessionariaVelozCar;

-- Criando a tabela Clientes;
CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY,
    Nome VARCHAR(150),
    CPF VARCHAR(11),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    DataCadastro DATE
);

-- Criando a tabela Funcionarios;
CREATE TABLE Funcionarios (
    idFuncionario INT PRIMARY KEY,
    Nome VARCHAR(150),
    CPF VARCHAR(11),
    Cargo VARCHAR(50),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    DataAdmissao DATE
);

-- Criando a tabela Veiculos;
CREATE TABLE Veiculos (
    idVeiculo INT PRIMARY KEY,
    Placa VARCHAR(10),
    Modelo VARCHAR(50),
    Cor VARCHAR(30),
    AnoFabricacao INT,
    ValorDiaria DECIMAL(10, 2),
    Status VARCHAR(20)
);

-- Criando a tabela Manutencoes;
CREATE TABLE Manutencoes (
    idManutencao INT PRIMARY KEY,
    DescricaoServico TEXT,
    Custo DECIMAL(10, 2),
    DataInicioManutencao DATE,
    DataFimManutencao DATE,
    ResponsavelServico VARCHAR(150),
    fk_Veiculos_idVeiculo INT,
    FOREIGN KEY (fk_Veiculos_idVeiculo) REFERENCES Veiculos(idVeiculo)
);

-- Criando a tabela Alugueis;
CREATE TABLE Alugueis (
    idAluguel INT PRIMARY KEY,
    DataInicio DATETIME,
    DataFimPrevista DATETIME,
    DataFimReal DATETIME,
    ValorTotal DECIMAL(10, 2),
    Status VARCHAR(20),
    fk_Clientes_idCliente INT,
    fk_Funcionarios_idFuncionario INT,
    fk_Veiculos_idVeiculo INT,
    FOREIGN KEY (fk_Clientes_idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (fk_Funcionarios_idFuncionario) REFERENCES Funcionarios(idFuncionario),
    FOREIGN KEY (fk_Veiculos_idVeiculo) REFERENCES Veiculos(idVeiculo)
);

-- Criando a tabela Pagamentos;
CREATE TABLE Pagamentos (
    idPagamento INT PRIMARY KEY,
    Valor DECIMAL(10, 2),
    DataPagamento DATE,
    MetodoPagamento VARCHAR(30),
    StatusPagamento VARCHAR(20),
    Observacoes TEXT,
    fk_Alugueis_idAluguel INT,
    FOREIGN KEY (fk_Alugueis_idAluguel) REFERENCES Alugueis(idAluguel)
);

-- Inserção e Manipulação de Dados (DML)

-- Inserindo 10 registros na tabela Clientes
INSERT INTO Clientes (idCliente, Nome, CPF, Endereco, Telefone, Email, DataCadastro) VALUES
(1, 'Ana Silva', '11122233344', 'Rua das Flores, 123, São Paulo', '11987654321', 'ana.silva@email.com', '2024-01-15'),
(2, 'Bruno Costa', '22233344455', 'Avenida Principal, 456, Rio de Janeiro', '21912345678', 'bruno.costa@email.com', '2024-02-20'),
(3, 'Carla Dias', '33344455566', 'Praça da Sé, 789, Salvador', '71988887777', 'carla.dias@email.com', '2024-03-10'),
(4, 'Daniel Farias', '44455566677', 'Rua dos Girassóis, 101, Belo Horizonte', '31977778888', 'daniel.farias@email.com', '2024-04-05'),
(5, 'Eduarda Lima', '55566677788', 'Avenida Atlântica, 202, Recife', '81966665555', 'eduarda.lima@email.com', '2024-05-12'),
(6, 'Fábio Souza', '66677788899', 'Rua da Aurora, 303, Manaus', '92955554444', 'fabio.souza@email.com', '2024-06-18'),
(7, 'Gabriela Pereira', '77788899900', 'Travessa dos Artistas, 404, Curitiba', '41944443333', 'gabriela.p@email.com', '2024-07-22'),
(8, 'Hugo Martins', '88899900011', 'Largo do Machado, 505, Porto Alegre', '51933332222', 'hugo.martins@email.com', '2024-08-01'),
(9, 'Isabela Rocha', '99900011122', 'Rua XV de Novembro, 606, Florianópolis', '48922221111', 'isabela.rocha@email.com', '2024-09-09'),
(10, 'João Mendes', '00011122233', 'Avenida Beira Mar, 707, Fortaleza', '85911110000', 'joao.mendes@email.com', '2025-01-03');

-- Inserindo 10 registros na tabela Funcionarios
INSERT INTO Funcionarios (idFuncionario, Nome, CPF, Cargo, Telefone, Email, DataAdmissao) VALUES
(1, 'Ricardo Alves', '12312312312', 'Gerente de Vendas', '11999998888', 'ricardo.alves@velozcar.com', '2022-03-01'),
(2, 'Sandra Neves', '23423423423', 'Atendente de Locação', '21988889999', 'sandra.neves@velozcar.com', '2022-05-10'),
(3, 'Thiago Santos', '34534534534', 'Atendente de Locação', '71977776666', 'thiago.santos@velozcar.com', '2023-01-20'),
(4, 'Vanessa Oliveira', '45645645645', 'Supervisora de Frota', '31966667777', 'vanessa.o@velozcar.com', '2023-02-15'),
(5, 'William Peixoto', '56756756756', 'Mecânico Chefe', '81955556666', 'william.p@velozcar.com', '2023-06-01'),
(6, 'Amanda Correia', '67867867867', 'Atendente de Locação', '92944445555', 'amanda.c@velozcar.com', '2024-02-11'),
(7, 'Lucas Barbosa', '78978978978', 'Assistente Administrativo', '41933334444', 'lucas.b@velozcar.com', '2024-03-14'),
(8, 'Beatriz Azevedo', '89089089089', 'Gerente Geral', '51922223333', 'beatriz.a@velozcar.com', '2021-11-05'),
(9, 'Felipe Monteiro', '90190190190', 'Atendente de Locação', '48911112222', 'felipe.m@velozcar.com', '2024-08-20'),
(10, 'Julia Nogueira', '01201201201', 'Recepcionista', '85900001111', 'julia.n@velozcar.com', '2024-10-01');


-- Inserindo 10 registros na tabela Veiculos
INSERT INTO Veiculos (idVeiculo, Placa, Modelo, Cor, AnoFabricacao, ValorDiaria, Status) VALUES
(1, 'FGH8B33', 'Fiat Mobi', 'Branco', 2023, 90.50, 'Disponível'),
(2, 'BRA2E19', 'Hyundai HB20', 'Prata', 2024, 110.00, 'Disponível'),
(3, 'GHI9012', 'Chevrolet Onix', 'Preto', 2023, 105.75, 'Alugado'),
(4, 'JKS4567', 'Renault Kwid', 'Vermelho', 2023, 85.00, 'Disponível'),
(5, 'MNO7890', 'Jeep Renegade', 'Cinza', 2024, 180.00, 'Em Manutenção'),
(6, 'PQR1D34', 'Volkswagen Gol', 'Branco', 2022, 95.00, 'Disponível'),
(7, 'XYZ1A23', 'Toyota Corolla', 'Preto', 2024, 250.00, 'Alugado'),
(8, 'FBE6789', 'Fiat Cronos', 'Prata', 2023, 130.00, 'Disponível'),
(9, 'CUR9G77', 'Honda HR-V', 'Azul', 2024, 220.00, 'Disponível'),
(10, 'SPW1H00', 'Jeep Compass', 'Branco', 2023, 280.00, 'Disponível');

-- Inserindo 10 registros na tabela `Manutencoes`
INSERT INTO Manutencoes (idManutencao, DescricaoServico, Custo, DataInicioManutencao, DataFimManutencao, ResponsavelServico, fk_Veiculos_idVeiculo) VALUES
(1, 'Troca de óleo e filtros.', 350.00, '2025-02-10', '2025-02-11', 'Oficina Parceira', 1),
(2, 'Revisão de 20.000 km.', 800.00, '2025-03-15', '2025-03-16', 'William Peixoto', 2),
(3, 'Alinhamento e balanceamento.', 250.00, '2025-04-20', '2025-04-20', 'Centro Automotivo Speed', 4),
(4, 'Troca de pastilhas de freio.', 550.00, '2025-05-01', '2025-05-02', 'William Peixoto', 6),
(5, 'Reparo no sistema de ar condicionado.', 950.00, '2025-06-10', '2025-06-12', 'Refrigeração Auto', 8),
(6, 'Revisão de 40.000 km.', 1200.00, '2025-07-05', '2025-07-06', 'William Peixoto', 7),
(7, 'Troca de pneus.', 1800.00, '2025-08-01', '2025-08-01', 'Loja de Pneus Top', 10),
(8, 'Manutenção corretiva no motor.', 2500.00, '2025-09-01', NULL, 'William Peixoto', 5),
(9, 'Revisão de 10.000km', 600.00, '2025-09-05', '2025-09-05', 'Concessionária Autorizada', 9),
(10, 'Pintura e reparo de arranhão na porta.', 450.00, '2025-09-10', '2025-09-12', 'Funilaria Express', 3);

-- Inserindo 10 registros na tabela Alugueis
INSERT INTO Alugueis (idAluguel, DataInicio, DataFimPrevista, DataFimReal, ValorTotal, Status, fk_Clientes_idCliente, fk_Funcionarios_idFuncionario, fk_Veiculos_idVeiculo) VALUES
(1, '2025-08-01 10:00:00', '2025-08-05 10:00:00', NULL, 440.00, 'Ativo', 2, 2, 2),
(2, '2025-08-10 14:30:00', '2025-08-12 14:30:00', '2025-08-12 14:00:00', 190.00, 'Finalizado', 6, 3, 6),
(3, '2025-08-20 09:00:00', '2025-08-27 09:00:00', NULL, 738.50, 'Ativo', 3, 6, 1),
(4, '2025-08-25 11:00:00', '2025-08-28 11:00:00', NULL, 840.00, 'Ativo', 10, 9, 10),
(5, '2025-09-01 18:00:00', '2025-09-10 18:00:00', NULL, 2250.00, 'Ativo', 7, 2, 7),
(6, '2025-09-03 12:00:00', '2025-09-05 12:00:00', '2025-09-05 11:30:00', 211.50, 'Finalizado', 1, 3, 3),
(7, '2025-09-05 08:00:00', '2025-09-08 08:00:00', NULL, 390.00, 'Ativo', 8, 6, 8),
(8, '2025-09-08 15:00:00', '2025-09-12 15:00:00', NULL, 880.00, 'Ativo', 9, 9, 9),
(9, '2025-09-10 16:00:00', '2025-09-11 16:00:00', '2025-09-11 15:50:00', 85.00, 'Finalizado', 4, 3, 4),
(10, '2025-09-12 13:00:00', '2025-09-13 13:00:00', NULL, 105.75, 'Ativo', 5, 2, 3);

-- Inserindo 10 registros na tabela Pagamentos
INSERT INTO Pagamentos (idPagamento, Valor, DataPagamento, MetodoPagamento, StatusPagamento, Observacoes, fk_Alugueis_idAluguel) VALUES
(1, 440.00, '2025-08-01', 'Cartão de Crédito', 'Concluído', 'Pagamento na retirada.', 1),
(2, 190.00, '2025-08-12', 'PIX', 'Concluído', 'Pagamento na devolução.', 2),
(3, 350.00, '2025-08-20', 'Cartão de Débito', 'Concluído', 'Pagamento parcial (sinal).', 3),
(4, 840.00, '2025-08-25', 'Cartão de Crédito', 'Concluído', NULL, 4),
(5, 2250.00, '2025-09-01', 'PIX', 'Concluído', 'Pagamento integral antecipado.', 5),
(6, 211.50, '2025-09-05', 'Dinheiro', 'Concluído', NULL, 6),
(7, 390.00, '2025-09-05', 'Cartão de Crédito', 'Concluído', NULL, 7),
(8, 400.00, '2025-09-08', 'PIX', 'Concluído', 'Pagamento de sinal.', 8),
(9, 85.00, '2025-09-11', 'Cartão de Débito', 'Concluído', NULL, 9),
(10, 105.75, '2025-09-12', 'Dinheiro', 'Concluído', NULL, 10);


-- Atualizando a tabela de Alugueis
UPDATE Alugueis
SET 
    Status = 'Finalizado',
    DataFimReal = '2025-09-14 10:00:00'
WHERE
    idAluguel = 3;

-- Atualizando a tabela de Veiculos
UPDATE Veiculos
SET 
    Status = 'Disponível'
WHERE
    idVeiculo = 1;


-- Atualizando a tabela Cliente
UPDATE Clientes
SET
    Telefone = '81999998888',
    Endereco = 'Avenida Boa Viagem, 5500, Recife'
WHERE
    idCliente = 5;
    
    
    
-- Consultas e Análises (DQL)

-- Tabela Clientes
SELECT 
    YEAR(DataCadastro) AS Ano,
    MONTH(DataCadastro) AS Mes,
    COUNT(idCliente) AS Novos_Clientes
FROM 
    Clientes
GROUP BY 
    Ano, Mes
ORDER BY 
    Ano, Mes;
-- Insight: Contar quantos clientes novos se cadastraram por mês.

-- Tabela Funcionarios
SELECT 
    Cargo,
    COUNT(idFuncionario) AS Quantidade_Funcionarios
FROM 
    Funcionarios
GROUP BY 
    Cargo
ORDER BY 
    Quantidade_Funcionarios DESC;
-- Insight: Contar o número de funcionários por cargo.

-- Tabela Veiculos
SELECT 
    AnoFabricacao,
    COUNT(idVeiculo) AS Quantidade_Veiculos,
    AVG(ValorDiaria) AS Media_Valor_Diaria
FROM 
    Veiculos
GROUP BY 
    AnoFabricacao
ORDER BY 
    AnoFabricacao DESC;
-- Insight: Calcular o valor médio da diária dos veículos por ano de fabricação.

-- Tabela Manutencoes 
SELECT 
    fk_Veiculos_idVeiculo,
    SUM(Custo) AS Custo_Total_Manutencao
FROM 
    Manutencoes
GROUP BY 
    fk_Veiculos_idVeiculo
ORDER BY 
    Custo_Total_Manutencao DESC;
-- Insight: Somar o custo total de manutenção para cada veículo que já teve manutenção.

-- Tabela Alugueis
SELECT 
    fk_Funcionarios_idFuncionario,
    SUM(ValorTotal) AS Faturamento_Total
FROM 
    Alugueis
GROUP BY 
    fk_Funcionarios_idFuncionario
ORDER BY 
    Faturamento_Total DESC;
-- Insight: Encontrar o valor total faturado por cada funcionário em aluguéis.
    
-- Tabela Pagamentos 
SELECT 
    MetodoPagamento,
    SUM(Valor) AS Total_Recebido
FROM 
    Pagamentos
GROUP BY 
    MetodoPagamento
ORDER BY 
    Total_Recebido DESC;
-- Insight: Somar o valor recebido por cada método de pagamento.

-- 3.2: OPERAÇÕES DE JOIN ENTRE TABELAS

SELECT
    A.idAluguel,
    A.DataInicio,
    A.DataFimPrevista,
    C.Nome AS Nome_Cliente,
    V.Modelo AS Modelo_Veiculo,
    V.Placa,
    F.Nome AS Nome_Funcionario
FROM
    Alugueis AS A
INNER JOIN 
    Clientes AS C ON A.fk_Clientes_idCliente = C.idCliente
INNER JOIN 
    Veiculos AS V ON A.fk_Veiculos_idVeiculo = V.idVeiculo
INNER JOIN 
    Funcionarios AS F ON A.fk_Funcionarios_idFuncionario = F.idFuncionario
WHERE
    A.Status = 'Ativo';
    
-- Insight: Listar os detalhes de todos os aluguéis que estão atualmente 'Ativos', a consulta junta 4 tabelas para criar um relatório operacional completo.
    
SELECT
    C.Nome AS Nome_Cliente,
    C.Email,
    COUNT(A.idAluguel) AS Quantidade_Alugueis,
    SUM(A.ValorTotal) AS Total_Gasto
FROM
    Clientes AS C
LEFT JOIN 
    Alugueis AS A ON C.idCliente = A.fk_Clientes_idCliente
WHERE
    A.idAluguel IS NOT NULL
GROUP BY
    C.idCliente, C.Nome, C.Email
ORDER BY
    Total_Gasto DESC
LIMIT 5;

-- Insight: Listar os 5 clientes que mais gastaram com aluguéis, identifica os clientes mais valiosos.