CREATE DATABASE Compras_industriais;

USE Compras_industriais;

CREATE TABLE Solicitante(
id_soli_pk INTEGER PRIMARY KEY,
nome_soli VARCHAR (30),
credibilidade_soli VARCHAR (15)  
);

INSERT INTO Solicitante 
VALUES (1, 'Doja Cat Montadora', 'positiva');
INSERT INTO Solicitante 
VALUES (2, 'luiz pao', 'positiva');
INSERT INTO Solicitante 
VALUES (3, 'lucas luzes', 'negativa');
INSERT INTO Solicitante 
VALUES (4, 'felipop', 'negativa');
INSERT INTO Solicitante
VALUES (5, 'zuckemberg fornece', 'positiva'); 

UPDATE Solicitante
SET nome_soli = 'Zuckemberg Fornecedor' 
WHERE id_soli_pk = 5;

UPDATE Solicitante
SET credibilidade_soli = 'positiva'
WHERE id_soli_pk = 4;


CREATE TABLE Recebimento(
id_reci_pk INTEGER PRIMARY KEY,
quantidade_itens_recebidos_reci INTEGER,
data_entrega_reci DATE, 
id_soli_fk INTEGER,
FOREIGN KEY (id_soli_fk) REFERENCES Solicitante (id_soli_pk) 
);

INSERT INTO Recebimento 
VALUES (1, 30, '2022-03-13', 1);
INSERT INTO Recebimento 
VALUES (2, 25, '2021-04-20', 2);
INSERT INTO Recebimento 
VALUES (3, 21, '2021-04-20', 3);
INSERT INTO Recebimento 
VALUES (4, 19, '2009-01-01', 4);
INSERT INTO Recebimento 
VALUES (5, 29, '2022-04-05', 5); 

UPDATE Recebimento 
SET data_entrega_reci = '2022-05-30'
WHERE id_reci_pk = 4;

UPDATE Recebimento 
SET quantidade_itens_recebidos_reci = 15 
WHERE id_reci_pk = 5;

CREATE TABLE Pedido_compra( 
id_ped_compra_pk INTEGER PRIMARY KEY,
quantidade_itens_ped_compra INTEGER, 
item_solicitado_ped_compra VARCHAR (60),
id_soli_fk INTEGER,
FOREIGN KEY (id_soli_fk) REFERENCES Solicitante (id_soli_pk) 
); 

INSERT INTO Pedido_compra
VALUES (1, 30, 'Amortecedor de carro Toyota 2010', 1);
INSERT INTO Pedido_compra
VALUES (2, 40, 'bancos de carros', 2);
INSERT INTO Pedido_compra
VALUES (3, 20, 'retrovisor de moto', 3);
INSERT INTO Pedido_compra
VALUES (4, 25, 'canetas azuis', 4);
INSERT INTO Pedido_compra
VALUES (5, 15, 'HD interno Acer Aspire', 5);

UPDATE Pedido_compra 
SET item_solicitado_ped_compra = 'Canetas vemelhas' 
WHERE id_ped_compra_pk = 4;

UPDATE Pedido_compra 
SET quantidade_itens_ped_compra = 45 
WHERE id_ped_compra_pk = 2;


CREATE TABLE Analista(
id_anali_pk INTEGER PRIMARY KEY,
nome_anali VARCHAR (30),
telefone_anali VARCHAR (20), 
email_anali VARCHAR (25),
salario_anali FLOAT,
assinatura_eletronica_anali VARCHAR (30)
);

INSERT INTO Analista 
VALUES (1, 'Antônio Inexistente', '(48) 98328-2938', 'antonnsade@gmail.com', 4500.50, '29-30-31-32'); 
INSERT INTO Analista
VALUES (2, 'Alistar firmino', '(19) 99217-2313', 'dhaqabfa@gmail.com', 2931.50, '21-31-43-43');
INSERT INTO Analista
VALUES (3, 'paulo elisio', '(92) 98213-3123', 'juajkdja@gmail.com', 8232.30, '93-12-38-92');
INSERT INTO Analista
VALUES (4, 'lucas lucas', '(08) 99128-9412', 'hfjbfbwf@gmail.com', 9823.90, '31-32-50-23');
INSERT INTO Analista 
VALUES (5, 'Agathar Nunes', '(11) 99182-9283', 'afonsinharr@gmailcom', 40000.50, '28-29-28-29');

UPDATE Analista 
SET nome_anali = 'Lucas Neto'
WHERE id_anali_pk = 4; 

UPDATE Analista 
SET email_anali = 'pauloeli@hotmail.com' 
WHERE id_anali_pk = 3;

UPDATE Analista 
SET salario_anali = salario_anali + 1500.00 
WHERE (salario_anali BETWEEN 4000.00 AND 8000.00);

UPDATE Analista 
SET nome_anali = 'Rico de marré'
WHERE (salario_anali BETWEEN 9000.00 AND 40000.00) AND (nome_anali LIKE '%NUNES%');


CREATE TABLE Ordem_compra( 
id_ordem_compra_pk INTEGER PRIMARY KEY,
cotação_ordem_compra FLOAT,
id_solicitante INTEGER, 
id_fornecedor INTEGER,
id_anali_fk INTEGER,
FOREIGN KEY (id_anali_fk) REFERENCES Analista (id_anali_pk),
id_forn_fk INTEGER,
FOREIGN KEY (id_forn_fk) REFERENCES Fornecedor (id_forn_pk),
id_end_fk INTEGER,
FOREIGN KEY (id_end_fk) REFERENCES Endereco_solicitante (id_end_pk)
);

INSERT INTO Ordem_compra 
VALUES (1, 38000.00, 1, 1, 1, 1, 1);
INSERT INTO Ordem_compra 
VALUES (2, 34243.00, 2, 2, 2, 2, 2);
INSERT INTO Ordem_compra 
VALUES (3, 39324.00, 3, 3, 3, 3, 3);
INSERT INTO Ordem_compra 
VALUES (4, 43294.00, 4, 4, 4, 4, 4);
INSERT INTO Ordem_compra
VALUES (5, 55000.00, 5, 5, 5, 5, 5);

UPDATE Ordem_compra 
SET cotação_ordem_compra = 45000.00 
WHERE id_ordem_compra_pk = 2;

UPDATE Ordem_compra 
SET cotação_ordem_compra = 60000.00 
WHERE id_ordem_compra_pk = 3; 


CREATE TABLE Endereco_solicitante( 
id_end_pk INTEGER PRIMARY KEY, 
cep_end VARCHAR (15), 
bairro_end VARCHAR (30), 
rua_end VARCHAR (30), 
numero_end INTEGER
);

INSERT INTO Endereco_solicitante
VALUES (1, '46000-000', 'Favela da rocinha', 'rua do tráfico', 4); 
INSERT INTO Endereco_solicitante
VALUES (2, '434210-320', 'Favela da rocinha', 'rua fumaça', 3131); 
INSERT INTO Endereco_solicitante
VALUES (3, '42420-210', 'Favela da rocinha', 'rua bateu levo', 32); 
INSERT INTO Endereco_solicitante
VALUES (4, '442340-430', 'Favela da rocinha', 'rua vilano', 918); 
INSERT INTO Endereco_solicitante 
VALUES (5, '56400-000', 'Patagônia', 'Rua do inferno', 726);

UPDATE Endereco_solicitante 
SET bairro_end = 'Centro' 
WHERE id_end_pk = 2;

UPDATE Endereco_solicitante 
SET bairro_end = 'Morro do Alemão' 
WHERE id_end_pk = 4;


CREATE TABLE Supervisor_ordem_de_compra(
id_super_ordem_pk INTEGER PRIMARY KEY, 
id_ordem_compra_fk INTEGER,
FOREIGN KEY (id_ordem_compra_fk) REFERENCES Ordem_compra (id_ordem_compra_pk), 
id_super_fk INTEGER, 
FOREIGN KEY (id_super_fk) REFERENCES Supervisor (id_super_pk)
);

INSERT INTO Supervisor_ordem_de_compra
VALUES (1, 1, 1);
INSERT INTO Supervisor_ordem_de_compr
VALUES (2, 2, 2); 
INSERT INTO Supervisor_ordem_de_compra
VALUES (3, 3, 3);
INSERT INTO Supervisor_ordem_de_compra
VALUES (4, 4, 4);
INSERT INTO Supervisor_ordem_de_compra
VALUES (5, 5, 5);


CREATE TABLE Supervisor( 
id_super_pk INTEGER PRIMARY KEY, 
nome_super VARCHAR (30), 
telefone_super VARCHAR (20), 
email_super VARCHAR (25), 
salario_super FLOAT
); 

INSERT INTO Supervisor (id_super_pk, nome_super, telefone_super, email_super, salario_super)
VALUES (1, 'Claudio Indigente', '(11) 98373-8372', 'claudinaoexiste@gmail.com', 3000.00);
INSERT INTO Supervisor (id_super_pk, nome_super, telefone_super, email_super, salario_super)
VALUES (2, 'Daniela Mercury ', '(11) 98237-9387', 'danimerc@gmail.com', 2500.00);
INSERT INTO Supervisor (id_super_pk, nome_super, telefone_super, email_super, salario_super)
VALUES (3, 'João Gomes', '(11) 98737-2938', 'joao283@gmail.com', 2300.00);
INSERT INTO Supervisor (id_super_pk, nome_super, telefone_super, email_super, salario_super)
VALUES (4, 'Maria José Cururu', '(23) 92837-2838', 'maryjoseph@gmail.com', 10000.00);
INSERT INTO Supervisor (id_super_pk, nome_super, telefone_super, email_super, salario_super)
VALUES (5, 'Ygona Moura', '(48) 98273-9383', 'terrordaoms@gmail.com', 20000.00); 

UPDATE Supervisor 
SET nome_super = 'Daniela Jupitery' 
WHERE id_super_pk = 2;

UPDATE Supervisor 
SET email_super = 'joaoemaria@gmail.com' 
WHERE id_super_pk = 3;


CREATE TABLE Fornecedor( 
id_forn_pk INTEGER PRIMARY KEY,
nome_forn VARCHAR (50),
qualificação_forn VARCHAR (15),
telefone_forn VARCHAR (20),
email_forn VARCHAR (25)
); 

INSERT INTO Fornecedor
VALUES (1, 'Pabllo Vittar Fabricante', 'positiva', '(11) 99182-2838', 'pabllofabrica@gmailcom'); 
INSERT INTO Fornecedor
VALUES (2, 'luciano hulk Fabricante', 'positiva', '(75) 98321-2838', 'fnfnaf@gmailcom');
INSERT INTO Fornecedor
VALUES (3, 'fausto Fabricante', 'positiva', '(71) 98139-2838', 'brayndad@gmailcom'); 
INSERT INTO Fornecedor
VALUES (4, 'batman Vittar Fabricante', 'positiva', '(81) 98120-2838', 'eumdamfab@gmailcom'); 
INSERT INTO Fornecedor 
VALUES (5, 'Lacração distribuidora', 'positiva', '(75) 98273-9388', 'lacradistri@gmai.com');

UPDATE Fornecedor 
SET qualificação_forn = 'negativa'
WHERE id_forn_pk = 2;

UPDATE Fornecedor 
SET nome_forn = 'Faustão Fabricante'
WHERE id_forn_pk = 3;


CREATE TABLE Envio(
id_envio_pk INTEGER PRIMARY KEY, 
quantidade_envio INTEGER, 
previsão_entrega_envio DATE, 
peso_envio FLOAT, 
data_emissao_envio DATE, 
id_forn_fk INTEGER,
FOREIGN KEY (id_forn_fk) REFERENCES Fornecedor (id_forn_pk)
);

INSERT INTO Envio
VALUES (1, 30, '2022-03-15', 45.7, '2022-01-20', 1);
INSERT INTO Envio
VALUES (2, 65, '2022-05-25', 300.8, '2022-01-25', 2);
INSERT INTO Envio
VALUES (3, 150, '2022-03-10', 160.50, '2022-01-10', 3);
INSERT INTO Envio
VALUES (4, 200, '2022-02-20', 80.5, '2022-01-20', 4);
INSERT INTO Envio 
VALUES (5, 50, '2022-02-20', 62.1, '2022-01-5', 5);

UPDATE Envio
SET quantidade_envio = 190 
WHERE id_envio_pk = 4;

UPDATE Envio 
SET previsão_entrega_envio = '2022-02-25' 
WHERE id_envio_pk = 5; 


CREATE TABLE Item( 
id_item_pk INTEGER PRIMARY KEY,
tipo_item VARCHAR (50),
disponibilidade_item VARCHAR (15),
marca_item VARCHAR (20), 
preço_item FLOAT, 
fator_conversão FLOAT,
id_forn_fk INTEGER,
FOREIGN KEY (id_forn_fk) REFERENCES Fornecedor (id_forn_pk)
);

INSERT INTO Item
VALUES (1, 'Amoertecedor de carro', 'disponível', 'Toyota 2005 a 2015', 900.00, 20, 1);
iNSERT INTO Item 
VALUES (2, 'Banco traseiro', 'disponível', 'Fiat Toro', 540.00, 15, 2);
INSERT INTO Item
VALUES (3, 'Retrovisores de Moto',' disponível', 'Honda Civic', 280.00, 10, 3);
INSERT INTO Item
VALUES (4, 'Canetas Azuis', 'disponível', 'Bic', 2.00, 5, 4); 
INSERT INTO Item 
VALUES (5, 'HD Interno', 'disponível', 'Acer Aspire', 450.00, 5, 5);

UPDATE Item 
SET disponibilidade_item = 'indisponível'
WHERE id_item_pk = 4; 

UPDATE Item 
SET preço_item = 1.50 
WHERE id_item_pk = 4