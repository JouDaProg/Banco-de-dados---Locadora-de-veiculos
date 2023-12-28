CREATE DATABASE locadora_veiculos;
USE locadora_veiculos;
-- Tabela Clientes
CREATE TABLE Cliente(
	Cpf VARCHAR(11),
	nome VARCHAR(100)NOT NULL,
    Data_nasc DATE NOT NULL,
    Rua  VARCHAR(45)NOT NULL,
    Numero INT NOT NULL,
    Bairro VARCHAR(30)NOT NULL,
    Cidade VARCHAR(30)NOT NULL,
    Cnh_A VARCHAR(3)NULL,
	Cnh_B VARCHAR(3)NULL,
	Cnh_C VARCHAR(3)NULL,
    Cnh_D VARCHAR(3)NULL,
    CONSTRAINT pk_Cliente PRIMARY KEY (Cpf)
    
    
);

-- Tabela Veiculos
CREATE TABLE Veiculo (
    Num_da_placa VARCHAR(15),
    nome VARCHAR(50) NULL,
    modelo VARCHAR(20) NULL,
    ano INT NOT NULL,
    fabricante VARCHAR(45),
    cap_porta_malas  VARCHAR(10),
    cap_passageiros  INT NULL,
    Tipo_veiculo VARCHAR(45) NULL,
    CONSTRAINT pk_Veiculo PRIMARY KEY(Num_da_placa)
);

-- Tabela Aluga
CREATE TABLE Aluga (
	Id_Locacao INT NOT NULL,
	Cpf VARCHAR(11), 
    Num_da_placa VARCHAR(15) NULL,
    Valor_dia FLOAT NULL,
    Valor_semana FLOAT NULL,
    Valor_mes FLOAT NULL,
    Valor_pago FLOAT NULL,
    Data_inicio DATE NULL,
    Data_final DATE NULL,
    CONSTRAINT pk_Aluga PRIMARY KEY (Id_Locacao),
    CONSTRAINT fk_Aluga_Num_da_placa
		FOREIGN KEY (Num_da_placa)
		REFERENCES Veiculo (Num_da_placa)
        ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT fk_Aluga_Cpf
		FOREIGN KEY (Cpf)
		REFERENCES Cliente (Cpf)
        ON DELETE NO ACTION
		ON UPDATE CASCADE
		);
        
CREATE TABLE Manutencao (
    Id_manutencao INT NOT NULL,
    Valor_manutencao FLOAT NULL,
    matencoes_realizadas INT NULL,
    CONSTRAINT pk_Manutencao PRIMARY KEY(Id_manutencao)
);
        
CREATE TABLE Agenda (
    data_inicio DATE NULL,
    data_final DATE NULL,
    Num_da_placa VARCHAR(15) NULL,
    Id_manutencao INT NOT NULL,
    CONSTRAINT fk_Agenda_Num_da_placa
		FOREIGN KEY (Num_da_placa)
		REFERENCES Veiculo (Num_da_placa)
        ON DELETE NO ACTION
		ON UPDATE CASCADE,
        CONSTRAINT fk_Agenda_Id_manutencao
		FOREIGN KEY (Id_manutencao)
		REFERENCES Manutencao (Id_manutencao)
        ON DELETE NO ACTION
		ON UPDATE CASCADE
		);
        
CREATE TABLE Atividades (
    Id_atividade INT NOT NULL,
    historico_atividade VARCHAR(50)NULL,
    CONSTRAINT pk_Atividades PRIMARY KEY(Id_atividade)
);

CREATE TABLE Historico (
    Id_manutencao  INT NULL,
    Id_atividade  INT NULL,
    CONSTRAINT fk_Historioco_Id_manutencao
		FOREIGN KEY (Id_manutencao)
		REFERENCES Manutencao (Id_manutencao)
        ON DELETE NO ACTION
		ON UPDATE CASCADE,
        CONSTRAINT fk_Historioco_Id_atividade
		FOREIGN KEY (Id_atividade)
		REFERENCES Atividades (Id_atividade)
        ON DELETE NO ACTION
		ON UPDATE CASCADE
		);
        
INSERT INTO Cliente(Cpf,nome,Data_nasc,Rua,Numero,Bairro,Cidade,Cnh_A,Cnh_B,Cnh_C,Cnh_D)
        VALUES('85293036087','Jarbas dos Santos','2000-06-25','Vicente da fontoura',200,'santana','Poa','SIM','SIM','NÃO','NÃO');

INSERT INTO Cliente(Cpf,nome,Data_nasc,Rua,Numero,Bairro,Cidade,Cnh_A,Cnh_B,Cnh_C,Cnh_D)
        VALUES('85293036027','Jakson do Lago','1980-10-21','Oscar pereira',1220,'  Azenha','Poa','SIM','NÃO','NÃO','NÃO');

INSERT INTO Cliente(Cpf,nome,Data_nasc,Rua,Numero,Bairro,Cidade,Cnh_A,Cnh_B,Cnh_C,Cnh_D)
        VALUES('93040030090','Bruna Bittencourt','1995-06-30','Gomes jardim',201,'santana','Poa','SIM','SIM','SIM','NÃO');

INSERT INTO Cliente(Cpf,nome,Data_nasc,Rua,Numero,Bairro,Cidade,Cnh_A,Cnh_B,Cnh_C,Cnh_D)
        VALUES('44020023228','Scheila Pinto','1970-01-23','Padre Antônio vieira',465,'Santo Antônio','Poa','NÃO','NÃO','NÃO','SIM');
        
INSERT INTO veiculo(Num_da_placa,nome,modelo,ano,fabricante,cap_passageiros,cap_porta_malas,Tipo_veiculo)
        VALUES('2NB2200','ARGO','Drive 1.0 flex',2022,'FIAT',5,'100L','carro');
        
INSERT INTO veiculo(Num_da_placa,nome,modelo,ano,fabricante,cap_passageiros,cap_porta_malas,Tipo_veiculo)
        VALUES('2N3B4520','HORNET','CB 600F',2023,'HONDA',2,'10L','moto');
        
INSERT INTO veiculo(Num_da_placa,nome,modelo,ano,fabricante,cap_passageiros,cap_porta_malas,Tipo_veiculo)
        VALUES('2M8Y4122','DODGE','CLASSIC',2019,'RAM',7,'500L','caminhonete');
        
INSERT INTO veiculo(Num_da_placa,nome,modelo,ano,fabricante,cap_passageiros,cap_porta_malas,Tipo_veiculo)
        VALUES('4M0U1225','Caio Apache Vip','VW17.260 ',2024,'Volkswagen',39,'4000L','onibus');
        
INSERT INTO aluga(Id_Locacao,Cpf,Num_da_placa,Valor_dia,Valor_semana,Valor_mes,Valor_pago,Data_inicio,Data_final)
		VALUES(1,'85293036087','2NB2200',200.00,500.00,1000.00,500.00,'2023-05-02','2023-05-08');
        
INSERT INTO aluga(Id_Locacao,Cpf,Num_da_placa,Valor_dia,Valor_semana,Valor_mes,Valor_pago,Data_inicio,Data_final)
		VALUES(2,'85293036027','2N3B4520',150.00,350.00,700.00,150.00,'2023-06-15','2023-06-15');

INSERT INTO aluga(Id_Locacao,Cpf,Num_da_placa,Valor_dia,Valor_semana,Valor_mes,Valor_pago,Data_inicio,Data_final)
		VALUES(3,'93040030090','2M8Y4122',400.00,1000.00,3000.00,3000.00,'2023-09-05','2023-10-05');
        
INSERT INTO aluga(Id_Locacao,Cpf,Num_da_placa,Valor_dia,Valor_semana,Valor_mes,Valor_pago,Data_inicio,Data_final)
		VALUES(4,'44020023228','4M0U1225',1000.00,5000.00,8000.00,8000.00,'2023-08-10','2023-09-08');
        
INSERT INTO manutencao(Id_manutencao,Valor_manutencao,matencoes_realizadas)
		VALUES(1,300.00,12);
        
INSERT INTO manutencao(Id_manutencao,Valor_manutencao,matencoes_realizadas)
		VALUES(2,100.00,2);
        
INSERT INTO manutencao(Id_manutencao,Valor_manutencao,matencoes_realizadas)
		VALUES(3,600.00,4);
        
INSERT INTO manutencao(Id_manutencao,Valor_manutencao,matencoes_realizadas)
		VALUES(4,1000.00,6);
        
INSERT INTO agenda(data_inicio,data_final,Id_manutencao,Num_da_placa)
		VALUES('2023-06-24','2023-06-30',1,'2NB2200');
        
INSERT INTO agenda(data_inicio,data_final,Id_manutencao,Num_da_placa)
		VALUES('2023-04-29','2023-05-10',2,'2N3B4520');
        
INSERT INTO agenda(data_inicio,data_final,Id_manutencao,Num_da_placa)
		VALUES('2023-06-05','2023-06-15',3,'2M8Y4122');
        
INSERT INTO agenda(data_inicio,data_final,Id_manutencao,Num_da_placa)
		VALUES('2023-12-12','2023-12-25',4,'2M8Y4122');
        
INSERT INTO historico(Id_manutencao,Id_atividade)
		VALUES(1,1);
        
INSERT INTO historico(Id_manutencao,Id_atividade)
		VALUES(2,2);
        
INSERT INTO historico(Id_manutencao,Id_atividade)
		VALUES(3,3);
        
INSERT INTO historico(Id_manutencao,Id_atividade)
		VALUES(4,4);
        
INSERT INTO atividades(Id_atividade,historico_atividade)
		VALUES(1,'peças e óleo');
        
INSERT INTO atividades(Id_atividade,historico_atividade)
		VALUES(2,'troca de pneu');
        
INSERT INTO atividades(Id_atividade,historico_atividade)
		VALUES(3,'embreagem');
        
INSERT INTO atividades(Id_atividade,historico_atividade)
		VALUES(4,'suspensão');
        
        
        
select * FROM agenda;
select * FROM aluga;
select * FROM atividades;
select * FROM cliente;
select * FROM historico;
select * FROM manutencao;
select * FROM veiculo;



-- obter todos os veículos que nunca foram locados para nenhum cliente;
SELECT * FROM Aluga
WHERE Num_da_placa NOT IN (
    SELECT Num_da_placa FROM Aluga
);

-- encontrar os clientes que alugaram um veículo específico, identificado pela placa;
SELECT Cliente.* FROM Cliente
JOIN Aluga ON Cliente.Cpf = Aluga.Cpf
WHERE Aluga.Num_da_placa = '2N3B4520';    

-- obter os clientes que alugaram veículos, juntamente com as informações sobre o veículo alugado, como a placa, modelo e fabricante.
 SELECT Cliente.nome, Veiculo.Num_da_placa, Veiculo.modelo, Veiculo.fabricante FROM Cliente
JOIN Aluga ON Cliente.Cpf = Aluga.Cpf
JOIN Veiculo ON Aluga.Num_da_placa = Veiculo.Num_da_placa;  


-- Cliente: armazena os dados dos clientes que alugam veículos, como cpf, nome, data de nascimento, endereço e tipo de cnh.
-- Veiculo: armazena os dados dos veículos disponíveis para aluguel, como número da placa, nome, modelo, ano, fabricante, capacidade do porta-malas, capacidade de passageiros e tipo de veículo.
-- Aluga: armazena os dados dos aluguéis realizados pelos clientes, como cpf do cliente, número da placa do veículo, valor do aluguel por dia, semana ou mês, valor pago, data de início e data final do aluguel.
-- Manutencao: armazena os dados das manutenções realizadas nos veículos, como id da manutenção, valor da manutenção e número de manutenções realizadas.
-- Agenda: armazena os dados das datas agendadas para as manutenções dos veículos, como data de início, data final, número da placa do veículo e id da manutenção.
-- Atividades: armazena os dados das atividades realizadas nas manutenções dos veículos, como id da atividade e histórico da atividade.
-- Historico: armazena os dados do histórico das manutenções dos veículos, como id da manutenção e id da atividade.
