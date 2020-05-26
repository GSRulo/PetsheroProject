CREATE DATABASE ProjetoAdocao
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
SET @@global.time_zone = '+3:00';

USE ProjetoAdocao;

CREATE TABLE IF NOT EXISTS Usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo_usuario VARCHAR(30) NOT NULL,
    documento VARCHAR(18),
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR (16) NOT NULL,
    senha VARCHAR(30) NOT NULL
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Reports(
	id_reports INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	status_report ENUM('Aberto', 'Encerrado'),
	titulo_reports VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_criacao TIMESTAMP, 
    FK_id_usuario INT NOT NULL,
		FOREIGN KEY(FK_id_usuario) REFERENCES Usuario(id_usuario)
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Adocao(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_adotante INT,
    idade VARCHAR(30),
	tipo_animal VARCHAR(30) NOT NULL,
	descricao TEXT NOT NULL,
	status_adocao ENUM('Aberto', 'Encerrado'),
    sexo_animal ENUM('Macho','Femea','Desconhecido'),
    tamanho VARCHAR(30),
    cor VARCHAR(30),
    img LONGBLOB,
    dataCriacao TIMESTAMP NOT NULL,
    dataAdocao TIMESTAMP,
    
    FK_id_usuario INT NOT NULL,
		FOREIGN KEY(FK_id_usuario) REFERENCES Usuario(id_usuario)
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Necessidades(
	id_necessidades INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	descricao TEXT NOT NULL,
    status_necessidade ENUM('Aberto', 'Encerrado'),
	valor_arrecadar FLOAT(10,2) NOT NULL,
    agencia VARCHAR(30),
    conta VARCHAR(30),
    banco VARCHAR(110),
    data_criacao TIMESTAMP NOT NULL
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS usuarioNecessidade(
	 FK_id_usuario INT NOT NULL,
		FOREIGN KEY(FK_id_usuario) REFERENCES Usuario(id_usuario),
        
	 FK_id_necessidade INT NOT NULL,
		FOREIGN KEY(FK_id_necessidade) REFERENCES Necessidades(id_necessidades)
) DEFAULT CHARSET = utf8;

INSERT Usuario VALUES(default, "João Ricardo", "1", "47887456197", "joao.ricardo@gmail.com", "11938879475", "123456");
INSERT Usuario VALUES(default, "ONG Cão", "2", "11222333000144", "contato@ongcao.com.br", "1140028922","ongcao123");
INSERT Usuario VALUES(default, "Diogo Nogueira", "1", "80600704874", "diogo.nogueira@gmail.com", "11934569873", "senha123");
INSERT Usuario VALUES(default, "ONG HelpAnimals", "2", "46021385000174", "contato@helpanimals.com.br", "1120862002","helpdog456");
INSERT Usuario VALUES(default, "Araucy Nunes", "1", "74524338071", "Araucy.Nunes@gmail.com", "11953556163", "orangecake321");
INSERT Usuario VALUES(default, "ONG VetAnimais ZO", "2", "54406436000104", "contato@vetanimaiszo.com.br", "1124517249","123pirituba");
INSERT Usuario VALUES(default, "Carlos Ruiz", "1", "23127464843", "Carlos.Ruiz@gmail.com", "11955261636", "metallica15");
INSERT Usuario VALUES(default, "Ong Miau", "2", "08980231000110", "contato@ongmiau.com.br", "1125646342","miau456miau");

INSERT Reports VALUES(default, 'Aberto', "Agressão a cachorro", "Meu vizinho bate no cachorro dele", '2020-05-19 00:00:00', 1);
INSERT Reports VALUES(default, 'Aberto', "abandono a gato", "Meu tio abandonou o gato dele", '2020-05-19 15:36:22', 1);
INSERT Reports VALUES(default, 'Aberto', "envenenamento de papagaio", "meu vizinho envenenou o meu papagaio", '2020-05-19 06:12:21', 1);
INSERT Reports VALUES(default, 'Aberto', "Agressão a coelho", "o policial chutou o meu coelho", '2020-05-19 11:43:58', 1);
INSERT Reports VALUES(default, 'Aberto', "roubo de cachoro", "roubaram o meu cachorro aqui na vila galvão", '2020-05-19 19:21:12', 1);
INSERT Reports VALUES(default, 'Aberto', "envenamento de gato", "minha vizinha envenenou o meu gato pq ele é preto", '2020-05-19 13:10:48', 1);

INSERT Necessidades VALUES(default, "Cachorro Atropelado", "Cachorro foi atropelado por uma bike e precisa de ajuda", 'Aberto', 5000.50, "3635", "16850543", "Banco Bradesco S.A.", '2020-05-19 00:00:00');
INSERT usuarioNecessidade VALUES(2,1);
INSERT Necessidades VALUES(default, "Maus Tratos a gato", "Encontramos um gato que esta em risco de perder a vida e necessita de ajuda", 'Aberto', 2000, "2401", "12417718", "Banco do Brasil S.A.", '2020-05-19 13:55:36');
INSERT usuarioNecessidade VALUES(4,2);
INSERT Necessidades VALUES(default, "Cachorro Perdido", "Encontramos um Cachorro com coleira e estamos procurando seu dono", 'Aberto', 0, "3048", "352136", "Banco Itaú BBA S.A", '2020-05-19 15:21:03');
INSERT usuarioNecessidade VALUES(6,3);
INSERT Necessidades VALUES(default, "Resgate de cachorros", "A ong resgatou dezenas de cachorros e precisa de ajuda com gastos ", 'Aberto', 10000, "0086", "30201541734", "Banco Citibank S.A.", '2020-05-19 08:11:46');
INSERT usuarioNecessidade VALUES(8,4);