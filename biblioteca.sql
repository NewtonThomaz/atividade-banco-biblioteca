CREATE TABLE editora(
 id serial PRIMARY KEY,
 nome VARCHAR(100) NOT NULL
);
CREATE TABLE autor(
 id serial PRIMARY KEY,
 nome VARCHAR(100) NOT NULL
);
CREATE TABLE livros(
id serial PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
isbn VARCHAR(20) NOT NULL,
local_edicao VARCHAR(20) NOT NULL,
id_editora INTEGER
);
CREATE TABLE livros_autor(
 cod serial PRIMARY KEY,
 id_livro INTEGER,
 id_autor INTEGER
);
CREATE TABLE palavras_chave(
 id SERIAL PRIMARY KEY,
 palavra VARCHAR(30) NOT NULL,
 id_livro INTEGER
);
CREATE TABLE exemplar(
 numero SERIAL PRIMARY KEY,
 id_livro INTEGER
);
CREATE TABLE funcionario(
 matricula SERIAL PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 endereco VARCHAR(100) NOT NULL,
 cpf VARCHAR(14) NOT NULL,
 telefone VARCHAR(15) NOT NULL
);
CREATE TABLE associado(
 codigo SERIAL PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 endereco VARCHAR(100) NOT NULL,
 telefone VARCHAR(15) NOT NULL,
 email VARCHAR(100) NOT NULL
);
CREATE TABLE emprestimo(
 id SERIAL PRIMARY KEY,
 data date NOT NULL,
 id_associado INTEGER NOT NULL,
 id_funcionario INTEGER NOT NULL
);
CREATE TABLE exemplares_emprestimo(
 id SERIAL PRIMARY KEY,
 num_exemplar INTEGER,
 num_emprest INTEGER
);
ALTER TABLE livros ADD CONSTRAINT livros_editora_fk FOREIGN KEY (id_editora)
REFERENCES editora(id);
ALTER TABLE livros_autor ADD CONSTRAINT autor_fk FOREIGN KEY (id_autor)
REFERENCES autor(id);
ALTER TABLE livros_autor ADD CONSTRAINT livro_fk FOREIGN KEY (id_livro)
REFERENCES livros(id);
ALTER TABLE palavras_chave ADD CONSTRAINT palavras_chave_livro_fk FOREIGN KEY
(id_livro) REFERENCES livros (id);
ALTER TABLE exemplar ADD CONSTRAINT exemplar_livro_livro_fk FOREIGN KEY (id_livro)
REFERENCES livros (id);
ALTER TABLE emprestimo ADD CONSTRAINT emprestimo_func_fk FOREIGN KEY
(id_funcionario) REFERENCES funcionario (matricula);
ALTER TABLE emprestimo ADD CONSTRAINT emprestimo_assoc_fk FOREIGN KEY
(id_associado) REFERENCES associado (codigo);
ALTER TABLE exemplares_emprestimo ADD CONSTRAINT exemplares_emprest_exem_fk
FOREIGN KEY (num_exemplar) REFERENCES exemplar (numero);
ALTER TABLE exemplares_emprestimo ADD CONSTRAINT exemplares_emprest_empr_fk
FOREIGN KEY (num_emprest) REFERENCES emprestimo (id);
INSERT INTO editora (nome) VALUES ('Érica');
INSERT INTO editora (nome) VALUES ('Pearson');
INSERT INTO editora (nome) VALUES ('Atlas');
INSERT INTO editora (nome) VALUES ('Cruzeiro do Sul');
INSERT INTO editora (nome) VALUES ('Cultura');
INSERT INTO editora (nome) VALUES ('Globo');
INSERT INTO editora (nome) VALUES ('Rocco');
INSERT INTO editora (nome) VALUES ('Saraiva');
INSERT INTO editora (nome) VALUES ('Moderna');
INSERT INTO editora (nome) VALUES ('Leya');
INSERT INTO editora (nome) VALUES ('Companhia das Letras');
INSERT INTO editora (nome) VALUES ('Record');
INSERT INTO editora (nome) VALUES ('FTD');
INSERT INTO editora (nome) VALUES ('Scipione');
INSERT INTO autor(nome) VALUES ('João da Silva Nunes');
INSERT INTO autor(nome) VALUES ('José Silberchatz');
INSERT INTO autor(nome) VALUES ('Maria Fernanda Dias');
INSERT INTO autor(nome) VALUES ('Elias Nielsen');
INSERT INTO autor(nome) VALUES ('Simone Barbosa');
INSERT INTO autor(nome) VALUES ('José Antonio Soares');
INSERT INTO autor(nome) VALUES ('Eliana Martins');
INSERT INTO autor(nome) VALUES ('Maria Fernanda Ascencio');
INSERT INTO autor(nome) VALUES ('Matheus Solano Cruz');
INSERT INTO autor(nome) VALUES ('André Santana');
INSERT INTO autor(nome) VALUES ('Aline Rodrigues');
INSERT INTO autor (nome) VALUES ('Carlos Drummond de Andrade');
INSERT INTO autor (nome) VALUES ('Clarice Lispector');
INSERT INTO autor (nome) VALUES ('Paulo Coelho');
INSERT INTO autor (nome) VALUES ('Cecília Meireles');
INSERT INTO autor (nome) VALUES ('Machado de Assis');
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Introdução a Linguagem de
Programação','ASC009444','São Paulo',2);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Introdução a Programação
Java','’KDFG009444','São Paulo',3);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Introdução a
Lógica','MADF878441','Rio de Janeiro',2);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Introdução a Banco de
Dados','PUQASC00326','São Paulo',2);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Banco de Dados
NoSQL','ASC007442','São Paulo',4);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Banco de Dados
PostgreSQL','LASC007442','Rio de Janeiro',1);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Front End -
CSS','XVDC007442','São Paulo',4);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('Front End – CSSavançado','FFSS009981','Rio de Janeiro',5);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('NoSQL –
Introdução','FSBSS009981','São Paulo',6);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('NoSQL –
MongoDB','MGBSS009952','São Paulo',7);
INSERT INTO livros (titulo, isbn,local_edicao, id_editora) VALUES ('NoSQL –
Cassandra','CABD0019952','Curitiba',8);
INSERT INTO livros (titulo, isbn, local_edicao, id_editora) VALUES ('Dom Casmurro',
'DC000199', 'Rio de Janeiro', 13);
INSERT INTO livros (titulo, isbn, local_edicao, id_editora) VALUES ('Veronika Decide Morrer',
'VDM200299', 'São Paulo', 14);
INSERT INTO livros (titulo, isbn, local_edicao, id_editora) VALUES ('A Hora da Estrela',
'AHE300399', 'Recife', 12);
INSERT INTO livros (titulo, isbn, local_edicao, id_editora) VALUES ('O Pequeno Príncipe',
'OPP400499', 'Curitiba', 2);
INSERT INTO livros (titulo, isbn, local_edicao, id_editora) VALUES ('Capitães da Areia',
'CDA500599', 'Salvador', 11);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (1,2);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (1,3);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (1,4);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (2,5);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (2,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (3,2);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (3,4);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (4,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (5,3);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (5,4);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,5);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,7);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (7,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (7,2);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (8,6);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,8);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (6,9);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (7,5);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (7,8);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (8,2);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (8,5);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (8,7);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (9,1);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (9,5);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (10,6);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (10,7);
INSERT INTO livros_autor (id_livro,id_autor) VALUES (10,9);
INSERT INTO livros_autor (id_livro, id_autor) VALUES (12, 15);
INSERT INTO livros_autor (id_livro, id_autor) VALUES (13, 12);
INSERT INTO livros_autor (id_livro, id_autor) VALUES (14, 12);
INSERT INTO livros_autor (id_livro, id_autor) VALUES (15, 13);
INSERT INTO livros_autor (id_livro, id_autor) VALUES (16, 14);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Lógica',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('programação',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Lógica',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Lógica',1);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('SQL',4);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('SQL',5);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('SQL',6);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Literatura', 12);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Romance', 13);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Drama', 14);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Infantil', 15);
INSERT INTO palavras_chave (palavra, id_livro) VALUES ('Juvenil', 16);
INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (1);
INSERT INTO exemplar (id_livro) VALUES (2);
INSERT INTO exemplar (id_livro) VALUES (2);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (3);
INSERT INTO exemplar (id_livro) VALUES (4);
INSERT INTO exemplar (id_livro) VALUES (4);
INSERT INTO exemplar (id_livro) VALUES (4);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (5);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (6);
INSERT INTO exemplar (id_livro) VALUES (7);
INSERT INTO exemplar (id_livro) VALUES (7);
INSERT INTO exemplar (id_livro) VALUES (8);
INSERT INTO exemplar (id_livro) VALUES (9);
INSERT INTO exemplar (id_livro) VALUES (9);
INSERT INTO exemplar (id_livro) VALUES (10);
INSERT INTO exemplar (id_livro) VALUES (11);
INSERT INTO exemplar (id_livro) VALUES (11);
INSERT INTO exemplar (id_livro) VALUES (11);
INSERT INTO exemplar (id_livro) VALUES (12);
INSERT INTO exemplar (id_livro) VALUES (13);
INSERT INTO exemplar (id_livro) VALUES (14);
INSERT INTO exemplar (id_livro) VALUES (15);
INSERT INTO exemplar (id_livro) VALUES (16);
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Andreia','Rua 14 novembro
– 300','14689836801','(15)99720-3434');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Kelly Maria','Avenida
Soares Hungria','13889836801','(15)99820-3413');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Aline Cristina','Avenida
Brasil – 330','13689836801','(15)99833-3413');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Mateus Andrada','Rua 7 de
setembro – 20','13689836801','(19)99833-3555');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Bruno Castro', 'Rua das
Flores, 111', '15588812234', '(11)91234-5678');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Fernanda Lima', 'Av.
Paulista, 2020', '15588812235', '(11)92345-6789');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Luciano Gomes', 'Rua
Central, 45', '15588812236', '(11)93456-7890');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Amanda Rocha', 'Rua das
Laranjeiras, 77', '15588812237', '(11)94567-8901');
INSERT INTO funcionario (nome, endereco, cpf, telefone) VALUES ('Ricardo Ramos', 'Av. Brasil,
80', '15588812238', '(11)95678-9012');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('José da Silva','Rua XV de
novembro – 1234','(15)3453-4545','silva01@gmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('Maria Cristina da Silva','Rua
XV de novembro – 154','(15)3453-4045','mariasilva01@gmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('André da Silva Cruz','Rua V
de novembro – 1234','(15)3466-4545','andresilva01@hotmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('Kely Maria Braga','Rua
primo moras – 34','(15)3453-4545','kelym01@gmail.com');
INSERT INTO associado (nome,endereco, telefone, email) VALUES ('José da Silva Moraes','Rua
XV de novembro – 700','(19)3453-4545','josesilva01@gmail.com');
INSERT INTO associado (nome, endereco, telefone, email) VALUES ('Bruna Mendes', 'Rua Azul,
111', '(11)91111-1111', 'bruna@gmail.com');
INSERT INTO associado (nome, endereco, telefone, email) VALUES ('Thiago Silva', 'Rua
Amarela, 222', '(11)92222-2222', 'thiago@gmail.com');
INSERT INTO associado (nome, endereco, telefone, email) VALUES ('Isabela Martins', 'Rua
Verde, 333', '(11)93333-3333', 'isabela@gmail.com');
INSERT INTO associado (nome, endereco, telefone, email) VALUES ('Lucas Pereira', 'Rua Cinza,
444', '(11)94444-4444', 'lucas@gmail.com');
INSERT INTO associado (nome, endereco, telefone, email) VALUES ('Renata Souza', 'Rua
Vermelha, 555', '(11)95555-5555', 'renata@gmail.com');
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-10',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-11',1,1);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-12',2,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-13',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-20',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-22',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-22',3,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-24',3,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-30',4,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-08-25',2,1);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-01',1,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-01',3,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-05',4,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-06',5,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2021-09-05',2,2);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2022-09-05',2,3);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2023-07-05',1,4);
INSERT INTO emprestimo (data,id_associado,id_funcionario) VALUES ('2023-06-10',3,4);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-01', 6, 5);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-03', 7, 6);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-05', 8, 7);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-10', 9, 8);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-15', 10, 9);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-20', 6, 6);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-25', 7, 7);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-08-28', 8, 8);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-09-01', 9, 9);
INSERT INTO emprestimo (data, id_associado, id_funcionario) VALUES ('2023-09-03', 10, 5);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (1,2);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (2,2);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (1,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (1,3);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (4,3);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (4,5);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (5,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (5,5);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (6,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (2,1);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (7,2);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (8,4);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (9,4);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (10,5);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (10,5);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (11,4);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (11,3);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (12,5);
INSERT INTO exemplares_emprestimo (num_exemplar,num_emprest) VALUES (12,2);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (34, 18);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (35, 19);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (36, 20);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (37, 21);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (38, 22);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (5, 23);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (6, 20);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (8, 15);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (12, 16);
INSERT INTO exemplares_emprestimo (num_exemplar, num_emprest) VALUES (14, 20);
