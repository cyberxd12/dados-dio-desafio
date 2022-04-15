CREATE DATABASE transporte_rod_modelo;

USE transporte_rod_modelo;

CREATE TABLE Cidade(
id_cid_pk INTEGER PRIMARY KEY,
origem_ou_destino_cid VARCHAR (2), 
regiao_cid VARCHAR (50),
clima_cid VARCHAR (50)
);

INSERT INTO Cidade 
VALUES (1, 'o', 'Sudeste', 'Temperado');
INSERT INTO Cidade 
VALUES (2, 'd', 'Norte', 'Quente');
INSERT INTO Cidade
VALUES (3, 'd', 'Centro-oeste', 'Semi-árido');
INSERT INTO Cidade 
VALUES (4, 'o', 'Extremo-sul', 'Semi-árido');
INSERT INTO Cidade 
VALUES (5, 'o', 'Extremo-sul', 'Semi-árido');

UPDATE Cidade 
SET clima_cid = 'Quente'
WHERE id_cid_pk = 4;

UPDATE Cidade
SET regiao_cid = 'Norte'
WHERE id_cid_pk = 5;

update  trecho
set tempo_estimado = '00:01:00'
WHERE ( distancia_trec BETWEEN 10000 and 20000);


CREATE TABLE Trecho(
id_trec_pk INTEGER PRIMARY KEY,
distancia_trec FLOAT,
tempo_estimado TIME 
);

INSERT INTO Trecho 
VALUES (1, 15000.0, '03:30:00');
INSERT INTO Trecho 
VALUES (2, 130000.0, '03:10:00');
INSERT INTO Trecho
VALUES (3, 135000.0, '03:15:00');
INSERT INTO Trecho 
VALUES (4, 120000.0, '02:50:00');
INSERT INTO Trecho 
VALUES (5, 16000.0, '03:45:00'); 

UPDATE Trecho 
SET Distancia_trec = 125000.00 
WHERE id_trec_pk = 4;

UPDATE Trecho
SET tempo_estimado = '03:20:0'
WHERE id_trec_pk = 3;

CREATE TABLE Trecho_cidade(
id_trec_cid_pk INTEGER PRIMARY KEY,
id_cid_fk INTEGER,
FOREIGN KEY (id_cid_fk) REFERENCES Cidade (id_cid_pk),
id_trec_fk INTEGER,
FOREIGN KEY (id_trec_fk) REFERENCES Trecho (id_trec_pk)
);

INSERT INTO Trecho_cidade 
VALUES (1, 1, 1);
INSERT INTO Trecho_cidade 
VALUES (2, 2, 2);
INSERT INTO Trecho_cidade
VALUES (3, 3, 3);
INSERT INTO Trecho_cidade
VALUES (4, 4, 4);
INSERT INTO Trecho_cidade
VALUES (5, 5, 5); 


CREATE TABLE Onibus(
id_oni_pk INTEGER PRIMARY KEY,
assentos_disponiveis_oni INTEGER,
rota_oni VARCHAR (150)
);

INSERT INTO Onibus 
VALUES (1, 50, 'Vila velha/Santa Rita/Parque Outono');
INSERT INTO Onibus 
VALUES (2, 50, 'Sobrado/Maria da Paz/Jardim Belvedere');
INSERT INTO Onibus
VALUES (3, 50, 'Jaqueira/Belo Campo/Montanha');
INSERT INTO Onibus 
VALUES (4, 50, 'Carlos Lima/Praça Amarela/Ólga Benário');
INSERT INTO Onibus 
VALUES (5, 50, 'Portela/Tigre Branco/Nifgaard'); 

UPDATE Onibus
SET rota_oni = 'Vila Velha/Parque Outono'
WHERE id_oni_pk = 1;

UPDATE Onibus 
SET assentos_disponiveis_oni = 45
WHERE id_oni_pk = 4;


CREATE TABLE Assento(
id_numero_poltrona_pk INTEGER PRIMARY KEY,
fila_assen VARCHAR (10),
disponibilidade VARCHAR (10),
id_oni_fk INTEGER,
FOREIGN KEY (id_oni_fk) REFERENCES Onibus (id_oni_pk)
);

INSERT INTO Assento 
VALUES (1, 'Esquerda 2', 'ocupado', 1);
INSERT INTO Assento 
VALUES (2, 'Direita 6', 'ocupado', 2);
INSERT INTO Assento 
VALUES (3, 'Esquerda 3', 'ocupado', 3);
INSERT INTO Assento 
VALUES (4, 'Direita 3', 'ocupado', 4);
INSERT INTO Assento
VALUES (5, 'Direita 7', 'ocupado', 5); 

UPDATE Assento 
SET disponibilidade = 'disponível' 
WHERE id_numero_poltrona_pk = 5;

UPDATE Assento 
SET fila_assen = 'Esquerda 1'
WHERE id_numero_poltrona_pk = 5;


CREATE TABLE Endereco(
id_end_pk INTEGER PRIMARY KEY,
cep_end VARCHAR (25),
bairro_end VARCHAR (50),
rua_end VARCHAR (50),
numero_end INTEGER
); 

INSERT INTO Endereco 
VALUES (1, '45300-300', 'Parque Afonso', 'Rua 3', 450);
INSERT INTO Endereco 
VALUES (2, '3500-400', 'Não sei', 'Rua 35', 40);
INSERT INTO Endereco 
VALUES (3, '5000-000', 'Bla Bla', 'Rua 10', 10);
INSERT INTO Endereco 
VALUES (4, '2400-000', 'Sei la', 'Rua 08', 15); 
INSERT INTO Endereco 
VALUES (5, '3500-000', 'Deus me ajuda', 'Rua 93', 29);

UPDATE Endereco 
SET bairro_end = 'Socorro'
WHERE id_end_pk = 4;

UPDATE Endereco 
SET rua_end = 'Rua 20'
WHERE id_end_pk = 5;


CREATE TABLE Passageiro(
id_cpf_pk VARCHAR (15) PRIMARY KEY,
nome_pass VARCHAR (50),
telefone_pass VARCHAR (15),
id_end_fk INTEGER,
FOREIGN KEY (id_end_fk) REFERENCES Endereco (id_end_pk)
);

INSERT INTO Passageiro 
VALUES (1, 'Nivaldo Santana', '(75) 99182-0293', 1);
INSERT INTO Passageiro 
VALUES (2, 'Osvaldo Muniz', '(71) 98273-2938', 2);
INSERT INTO Passageiro 
VALUES (3, 'Teresa Santana', '(75) 98273-9388', 3);
INSERT INTO Passageiro 
VALUES (4, 'Pamela Santos', '(75) 98273-9283', 4);
INSERT INTO Passageiro 
VALUES (5, 'Caio Barreto', '(71) 98283-9283', 5);

UPDATE Passageiro 
SET nome_pass = 'Pâmela dos Magos'
WHERE id_cpf_pk = 4;

UPDATE Passageiro 
SET telefone_pass = '(75) 98273-2938'
WHERE id_cpf_pk = 5; 


CREATE TABLE Passagem(
id_passa_pk INTEGER PRIMARY KEY,
destino_passa VARCHAR (60),
horario_saida_passa TIME,
id_cpf_fk VARCHAR (15),
FOREIGN KEY (id_cpf_fk) REFERENCES Passageiro (id_cpf_pk)
);

INSERT INTO Passagem 
VALUES (1, 'Narnia', '07:30:00', 1);
INSERT INTO Passagem 
VALUES (2, 'Terra do nunca', '08:00:00', 2);
INSERT INTO Passagem 
VALUES (3, 'Inferno', '08:00:00', 3);
INSERT INTO Passagem 
VALUES (4, 'Ai sla', '11:00:00', 4);
INSERT INTO Passagem 
VALUES (5, 'Coreia do Norte', '14:00:00', 5);

UPDATE Passagem 
SET destino_passa = 'Rússia'
WHERE id_passa_pk = 4;

UPDATE Passagem 
SET horario_saida_passa = '08:30:00'
WHERE id_passa_pk = 2;

update passagem
set destino_pass = 'Egito'
WHERE ( horario_saida_pass BETWEEN  '08:00:00' and '10:00:00');

CREATE TABLE Receber_passagem(
id_rec_pass_pk INTEGER PRIMARY KEY,
forma_pagamento_rec_pass VARCHAR (30),
horario_recebimento TIME,
id_cpf_fk VARCHAR (15),
FOREIGN KEY (id_cpf_fk) REFERENCES Passageiro (id_cpf_pk)
); 

INSERT INTO Receber_passagem 
VALUES (1, 'Cartão de Crédito', '10:35:00', 1);
INSERT INTO Receber_passagem 
VALUES (2, 'Pix', '09:00:00', 2);
INSERT INTO Receber_passagem 
VALUES (3, 'A vista', '15:15:22', 3);
INSERT INTO Receber_passagem 
VALUES (4, 'Cartão de Débito', '08:45:15', 4);
INSERT INTO Receber_passagem 
VALUES (5, 'Pix', '11:25:45', 5);

UPDATE Receber_passagem 
SET horario_recebimento = '09:30:00'
WHERE id_rec_pass_pk = 2;

UPDATE Receber_passagem 
SET forma_pagamento_rec_pass = 'Pix'
WHERE id_rec_pass_pk = 4;


CREATE TABLE Funcionario( 
id_cpf_pk VARCHAR (15) PRIMARY KEY, 
nome_fun VARCHAR (50),
cargo_fun VARCHAR (30),
turno_fun VARCHAR (15),
telefone_fun VARCHAR (15),
salario_fun FLOAT
);

INSERT INTO Funcionario 
VALUES (1, 'Eduardo Melo', 'Segurança', 'Noturno', '(75) 99182-9283', 1800.00);
INSERT INTO Funcionario 
VALUES (2, 'Otavio Cardoso', 'Atendente', 'Tarde', '(71) 98273-1922', 2100.00);
INSERT INTO Funcionario 
VALUES (3, 'Manoela Medeiros', 'Atendente', 'Manhã', '(75) 98237-2837', 2200.00);
INSERT INTO Funcionario 
VALUES (4, 'Antonio Lopes', 'Motorista', 'Integral', '(75) 92837-9283', 2100.00);
INSERT INTO Funcionario 
VALUES (5, 'Gabriel Rosa', 'Segurança', 'Noturno', '(75) 98273-2938', 2500.00);

UPDATE Funcionario 
SET turno_fun = 'Tarde' 
WHERE id_cpf_pk = 3;

UPDATE Funcionario 
SET telefone_fun = '(75) 92837-3938'
WHERE id_cpf_pk = 5;


CREATE TABLE Vender_passagem( 
id_vend_pass_pk INTEGER PRIMARY KEY,
valor_vend_pass FLOAT, 
horario_venda TIME,
id_cpf_pk VARCHAR (15),
FOREIGN KEY (id_cpf_pk) REFERENCES Funcionario (id_cpf_pk)
);

INSERT INTO Vender_passagem 
VALUES (1, 35.00, '08:45:25', 1);
INSERT INTO Vender_passagem 
VALUES (2, 40.00, '16:55:10', 2);
INSERT INTO Vender_passagem 
VALUES (3, 45.00, '15:00:50', 3);
INSERT INTO Vender_passagem 
VALUES (4, 30.00, '11:10:10', 4);
INSERT INTO Vender_passagem 
VALUES (5, 40.00, '13:50:40', 5);

UPDATE Vender_passagem 
SET horario_venda = '14:50:40'
WHERE id_vend_pass_pk = 5;

UPDATE Vender_passagem 
SET valor_vend_pass = 25.00
WHERE id_vend_pass_pk = 4;

DELETE FROM assento
WHERE (fila_ass BETWEEN 1 and 5);

select * from funcionario;

DELETE FROM cidade
WHERE (clima_cid like 'árido%');

DELETE FROM  endereco
WHERE (numero_end BETWEEN 10 and 50);

DELETE FROM  funcionario
WHERE (nome_fun like '%melo' or '%cardoso');

DELETE FROM passageiro
WHERE ( nome_pass like '%Santana' or '%Santos');
select * from endereco;
DELETE FROM  passagem
WHERE (horario_saida_passa BETWEEN '07:00:00' and '10:00:00');

DELETE FROM  trecho
WHERE (distancia_trec BETWEEN 10000 and 100000);
select * from receber_passagem;
DELETE FROM  vender_passagem
WHERE (valor_vend_pass BETWEEN 20 and 40);

DELETE FROM  endereco
WHERE (numero BETWEEN 10 and  50);

DELETE FROM  onibus
WHERE (assentos_disponiveis_oni BETWEEN 20 and 51);

DELETE FROM  receber_passagem
WHERE (forma_pagamento_rec_pass like '%Débito' or '%pix%') AND (horario_recebimento BETWEEN '10:00:00' and '12:00:00');
