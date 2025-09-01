CREATE DATABASE BIBLIOTECA_HELOISA;
USE BIBLIOTECA_HELOISA;
-- DROP DATABASE BIBLIOTECA_HELOISA

CREATE TABLE niveis (
	id_niveis INT AUTO_INCREMENT PRIMARY KEY,
	niveis VARCHAR(255) NOT NULL
);

INSERT INTO niveis (niveis)
VALUES 
	("Básico"),
    ("Intermediário"),
    ("Premium");


CREATE TABLE usuários (
	id_usuário INT AUTO_INCREMENT PRIMARY KEY,
	id_niveis INT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	data_de_cadastro DATE,
	FOREIGN KEY (id_niveis) REFERENCES niveis(id_niveis)
);

INSERT INTO usuários (nome, email, data_de_cadastro, id_niveis)
VALUES
	("Isadora Abreu", "isaabreucorrea@gmail.com", "2025-01-12", 1),
	("Heloisa Militão", "heloisamilitao@gmail.com", "2025-02-12", 3),
	("Rayssa Mello", "rayssacmelloo@gmail.com", "2025-03-12", 2),
	("Beatriz Damacena", "beatrizdamacena@gmail.com", "2025-04-12", 1),
	("Julia Roberts", "juliaroberts@gmail.com", "2025-05-12", 2),
	("Ana Claudia Lopes", "anaclopes@gmail.com", "2025-06-12", 3),
	("Joaquim Tuchiama", "jhtuchiama@gmail.com", "2025-07-12", 3),
	("João Belai", "jpbelai@gmail.com", "2025-08-12", 2),
	("Samuel Miller", "samuelmiller@gmail.com", "2025-09-12", 1),
	("Alex Lunna", "alexlunna@gmail.com", "2025-01-14", 3);


CREATE TABLE livros (
	id_livros INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(255) NOT NULL,
	ISBN VARCHAR(20) NOT NULL,
	descricao TEXT NOT NULL
);

INSERT INTO livros (titulo, ISBN, descricao) 
VALUES 
	("De sangue e Cinzas", "655981002", "Prestes a completar 19 anos, Poppy se prepara para sua Ascensão..."),
    ("Quarta Asa", "52225856", "Violet Sorrengail, uma jovem de vinte anos..."),
    ("A hipótese do amor", "6555653302", "Olive Smith, aluna do doutorado..."),
    ("Amor, teoricamente", "6555655259", "Elsie Hannaway é uma física teórica..."),
    ("Melhor do que nos filmes", "6555607289", "Elizabeth Buxbaum sempre soube..."),
    ("A paciente silenciosa", "8501116432", "Alicia Berenson tinha uma vida perfeita..."),
    ("Verity", "8501117846", "Verity Crawford é a autora best-seller..."),
    ("Jantar secreto", "8535928359", "Um grupo de jovens deixa uma cidade no Paraná..."),
    ("Os sete maridos de Evelyn Hugo", "8584391509", "Lendária estrela de Hollywood..."),
    ("Vergonha", "6555875240", "Grace Harris está perdida e sozinha...");


CREATE TABLE autores (
	id_autor INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	biografia TEXT NOT NULL
);

INSERT INTO autores (nome, data_de_nascimento, biografia)
VALUES 
	("Ali Hazelwood", "1989-12-11", "Ali Hazelwood é uma escritora..."),
    ("Colleen Hoover", "1979-12-11", "Colleen Hoover, nascida Margaret Colleen..."),
    ("Rebecca Yarros", "1981-04-13", "Rebecca Yarros é uma escritora..."),
    ("Brittainy C. Cherry", "1973-09-22", "Brittainy C. Cherry é formada em artes cênicas..."),
    ("Taylor Jenkins Reid", "1983-12-20", "Taylor Jenkins Reid é uma escritora..."),
    ("Emily Henry", "1991-05-17", "Emily Henry é uma autora..."),
    ("Lynn Painter", "1972-11-14", "Lynn Painter é autora best-seller..."),
    ("Alex Michaelides", "1977-02-05", "Alex Michaelides nasceu e cresceu no Chipre..."),
    ("Raphael Montes", "1990-09-08", "Raphael Montes é um escritor e roteirista..."),
    ("Jennifer L. Armentrout", "1980-12-12", "Jennifer Lynn Armentrout assina como...");


CREATE TABLE emprestimos (
	id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
	data_de_empréstimo DATE NOT NULL,
	data_de_devolução_limite DATE,
	data_de_devolução DATE NOT NULL,
	id_usuário INT NOT NULL,
	id_livros INT NOT NULL,
	FOREIGN KEY (id_usuário) REFERENCES usuários(id_usuário),
	FOREIGN KEY (id_livros) REFERENCES livros(id_livros)
);

INSERT INTO emprestimos (data_de_empréstimo, data_de_devolução, data_de_devolução_limite, id_usuário, id_livros)
VALUES 
	("2025-01-12", "2025-02-12", "2025-02-18", 1, 1),
	("2025-02-12", "2025-03-12", "2025-03-18", 2, 2),
	("2025-03-12", "2025-04-12", "2025-04-18", 3, 3),
	("2025-04-12", "2025-05-12", "2025-05-18", 4, 4),
	("2025-05-12", "2025-06-12", "2025-06-18", 5, 5),
	("2025-06-12", "2025-07-12", "2025-07-18", 6, 6),
	("2025-01-12", "2025-08-12", NULL, 7, 7),
	("2025-01-12", "2025-10-12", NULL, 8, 8),
	("2025-01-12", "2025-11-12", NULL, 9, 9),
	("2025-01-12", "2025-12-12", NULL, 10, 10);


CREATE TABLE livros_autor (
	id_lu INT AUTO_INCREMENT PRIMARY KEY,
	id_livros INT NOT NULL,
	id_autor INT NOT NULL,
	FOREIGN KEY (id_livros) REFERENCES livros(id_livros),
	FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

INSERT INTO livros_autor (id_livros, id_autor)
VALUES
	(3, 1),
	(4, 1),
	(1, 10),
	(2, 3),
	(5, 7),
	(7, 2),
	(9, 5),
	(10, 4),
	(6, 8),
	(8, 9);

CREATE TABLE categoria (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	categoria VARCHAR(255) NOT NULL
);

INSERT INTO categoria (categoria)
VALUES
	("Romance"),
	("Fantasia"),
	("Suspense"),
	("Drama"),
	("Terror"), 
	("Biografia"),
	("Não-ficção"),
	("Infanto-Juvenil"),
	("Ação"),
	("Mistério/Policial");


CREATE TABLE livro_categoria (
	id_lc INT AUTO_INCREMENT PRIMARY KEY,
	id_livros INT NOT NULL,
	id_categoria INT NOT NULL,
	FOREIGN KEY (id_livros) REFERENCES livros(id_livros),
	FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

INSERT INTO livro_categoria (id_livros, id_categoria)
VALUES
	(1,2),
	(2,2),
	(3,1),
	(4,1),
	(5,1),
	(6,10),
	(7,3),
	(8,5),
	(9,8),
	(10,4);
