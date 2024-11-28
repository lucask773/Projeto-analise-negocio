/* Criando banco telemarketing */

create database Telemarketing

use Telemarketing

/* Criando tabelas */

create table Vendedores (
	vendedores_id INT PRIMARY KEY IDENTITY,
	NOME VARCHAR (20),
	ESTADO CHAR(2),
	SEXO CHAR(1),
)   

create table Vendas(
	vendas_id INT PRIMARY KEY IDENTITY,
	VALOR DECIMAL(10, 4),
	vendedores_id INT,
	FOREIGN KEY(vendedores_id) REFERENCES vendedores(vendedores_id)
)

/* Inserindo os dados */ 

INSERT INTO Vendedores (NOME, ESTADO, SEXO)
VALUES
    ('Joao', 'SP', 'M'),
    ('Mateus', 'SP', 'M'),
    ('Paula', 'MG', 'F'),
    ('Rodrigo', 'MG', 'M'),
    ('Fernando', 'MG', 'M'),
    ('Patricia', 'SP', 'F'),
    ('Roberto', 'SP', 'M'),
    ('Rosangela', 'SP', 'F'),
    ('Cristina', 'MG', 'F')


INSERT INTO Vendas (VALOR, vendedores_id)
VALUES
    (7500.00, 1), (14000.00, 1), (8900.00, 1), (13000.00, 1), (11000.00, 1),
    (8500.00, 2), (12000.00, 2), (7000.00, 2), (15000.00, 2), (9500.00, 2),
    (7800.00, 3), (14500.00, 3), (9700.00, 3), (10800.00, 3), (12500.00, 3),
    (8700.00, 4), (11000.00, 4), (7600.00, 4), (13300.00, 4), (14900.00, 4),
    (9400.00, 5), (12600.00, 5), (8200.00, 5), (11500.00, 5), (13500.00, 5),
    (7300.00, 6), (14800.00, 6), (9100.00, 6), (10400.00, 6), (12200.00, 6),
    (8700.00, 7), (11400.00, 7), (7600.00, 7), (13700.00, 7), (9800.00, 7),
    (9500.00, 8), (14300.00, 8), (7800.00, 8), (10800.00, 8), (12500.00, 8),
    (7900.00, 9), (12000.00, 9), (8300.00, 9), (14000.00, 9), (9300.00, 9);

/* Conectando tabelas */

ALTER TABLE Vendas
ADD CONSTRAINT FK_Vendas_Vendedores
FOREIGN KEY (vendedores_id) REFERENCES Vendedores(vendedores_id);

/* Alterando sequência de identidade */

DBCC CHECKIDENT ('Vendas', RESEED, 1000);

/* Adicionando data na tabela vendas */

ALTER TABLE Vendas
ADD data_venda DATE;

/* Fazendo datas das vendas ficarem aleatoria durante o ano */

UPDATE Vendas
SET data_venda = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), '2024-01-01');
