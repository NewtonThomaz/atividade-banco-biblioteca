## Exercícios - DLL
```PostgreSQL
-- EXERCÍCIO 01
ALTER TABLE livros 
ADD COLUMN ano_publicacao INTEGER, 
ADD COLUMN numero_paginas INTEGER;

-- EXERCÍCIO 02
ALTER TABLE editora 
ADD COLUMN email VARCHAR(100), 
ADD COLUMN telefone VARCHAR(20);

-- EXERCÍCIO 03
ALTER TABLE exemplar 
ADD COLUMN data_aquisicao DATE, 
ADD COLUMN status VARCHAR(20) DEFAULT 'disponível' 
CHECK (status IN ('disponível', 'emprestado', 'danificado'));

-- EXERCÍCIO 04
ALTER TABLE emprestimo 
RENAME COLUMN data TO data_emprestimo;

ALTER TABLE emprestimo 
ADD COLUMN data_devolucao DATE;

-- EXERCÍCIO 05
CREATE TABLE categoria (
id SERIAL PRIMARY KEY, 
descricao VARCHAR(150) NOT NULL
);

-- EXERCÍCIO 06
ALTER TABLE livros 
ADD COLUMN id_categoria INTEGER, 
ADD CONSTRAINT livros_categoria_fk FOREIGN KEY (id_categoria) REFERENCES categoria(id);
```
****
## Exercícios - insert e update
```PostgreSQL
-- EXERCÍCIO 01
INSERT INTO categoria (descricao) 
VALUES ('Tecnologia'),
       ('Literatura'),
       ('Administração'), 
       ('Ciências Exatas'), 
       ('História');

-- EXERCÍCIO 02
UPDATE editora 
SET email = 'contato@editora' || id || '.com.br', 
    telefone = '(11) 3000-10' || LPAD(id::text, 2, '0');

-- EXERCÍCIO 03
UPDATE exemplar 
SET data_aquisicao = '2021-01-15', 
	status = 'disponível';
	
UPDATE exemplar 
SET status = 'emprestado' 
WHERE numero IN (1, 2, 4, 5, 6);

UPDATE exemplar 
SET status = 'danificado' 
WHERE numero IN (10, 15);

-- EXERCÍCIO 04
UPDATE emprestimo 
SET data_devolucao = data_emprestimo + INTERVAL '7 days';

-- EXERCÍCIO 05
UPDATE livros 
SET ano_publicacao = 2020, 
	numero_paginas = 320, 
	id_categoria = 1 
WHERE id BETWEEN 1 AND 11;

UPDATE livros 
SET ano_publicacao = 1899, 
	numero_paginas = 256, 
	id_categoria = 2 
WHERE id = 12;

UPDATE livros 
SET ano_publicacao = 1998, 
	numero_paginas = 210, 
	id_categoria = 2 
WHERE id = 13;

UPDATE livros 
SET ano_publicacao = 1977, 
	numero_paginas = 88,  
	id_categoria = 2 
WHERE id = 14;

UPDATE livros 
SET ano_publicacao = 1943, 
	numero_paginas = 96,  
	id_categoria = 2 
WHERE id = 15;

UPDATE livros 
SET ano_publicacao = 1937, 
	numero_paginas = 280, 
	id_categoria = 2 
WHERE id = 16;
```
****
## Exercícios - consulta
```PostgreSQL
-- EXERCÍCIO 01
SELECT * 
FROM livros 
WHERE titulo ILIKE '%Banco%';

-- EXERCÍCIO 02
SELECT titulo, 
	   isbn 
FROM livros 
WHERE local_edicao = 'Rio de Janeiro' 
ORDER BY titulo ASC;

-- EXERCÍCIO 03
SELECT l.*, 
	   e.nome AS nome_editora 
FROM livros l 
INNER JOIN editora e 
	ON l.id_editora = e.id 
WHERE e.nome = 'Atlas' 
ORDER BY l.titulo ASC;

-- EXERCÍCIO 04
SELECT l.id AS codigo_livro, 
	   l.titulo, 
	   e.nome AS nome_editora 
FROM livros l 
INNER JOIN editora e 
	ON l.id_editora = e.id 
INNER JOIN livros_autor la 
	ON l.id = la.id_livro 
INNER JOIN autor a 
	ON la.id_autor = a.id 
WHERE a.nome = 'Elias Nielsen';

-- EXERCÍCIO 05
SELECT ex.numero AS numero_exemplar, 
	   l.titulo AS titulo_livro 
FROM exemplares_emprestimo ee 
INNER JOIN exemplar ex 
	ON ee.num_exemplar = ex.numero 
INNER JOIN livros l 
	ON ex.id_livro = l.id 
WHERE ee.num_emprest = 3;

-- EXERCÍCIO 06
SELECT emp.id AS numero_emprestimo, 
	   emp.data_emprestimo 
FROM emprestimo emp 
INNER JOIN exemplares_emprestimo ee 
	ON emp.id = ee.num_emprest 
WHERE ee.num_exemplar = 4 
ORDER BY emp.id ASC;

-- EXERCÍCIO 07
SELECT e.nome AS nome_editora, 
	   COUNT(l.id) AS quantidade_livros 
FROM editora e 
LEFT JOIN livros l 
	ON e.id = l.id_editora 
GROUP BY e.id, e.nome 
ORDER BY e.nome ASC;

-- EXERCÍCIO 08
SELECT a.nome AS nome_associado, 
	   COUNT(emp.id) AS total_emprestimos 
FROM associado a 
LEFT JOIN emprestimo emp 
	ON a.codigo = emp.id_associado 
GROUP BY a.codigo, a.nome 
ORDER BY a.nome ASC;

-- EXERCÍCIO 09
SELECT l.id AS codigo_livro, l.titulo, 
	   COUNT(ex.numero) AS quantidade_exemplares 
FROM livros l 
LEFT JOIN exemplar ex 
	ON l.id = ex.id_livro 
GROUP BY l.id, l.titulo 
ORDER BY l.id ASC;

-- EXERCÍCIO 10
SELECT * 
FROM emprestimo 
ORDER BY data_emprestimo ASC LIMIT 10 OFFSET 2;

-- EXERCÍCIO 11
SELECT DISTINCT nome 
FROM associado 
WHERE codigo 
IN (SELECT id_associado 
	FROM emprestimo 
	WHERE id_funcionario 
	IN (SELECT matricula 
		FROM funcionario 
		WHERE nome = 'Andreia')) 
ORDER BY nome ASC;

-- EXERCÍCIO 12
SELECT a.* 
FROM associado a 
WHERE EXISTS (SELECT 1 
			  FROM emprestimo emp 
			  WHERE emp.id_associado = a.codigo);
```
****
## Exercícios - view
```PostgreSQL
-- EXERCÍCIO 01
CREATE VIEW vw_emprestimos_detalhes AS
SELECT emp.*, 
	   a.nome AS nome_associado, 
	   f.nome AS nome_funcionario
FROM emprestimo emp
INNER JOIN associado a 
	ON emp.id_associado = a.codigo
INNER JOIN funcionario f 
	ON emp.id_funcionario = f.matricula;

SELECT * 
FROM vw_emprestimos_detalhes 
WHERE data_emprestimo 
BETWEEN '2021-08-01' AND '2021-08-31' 
ORDER BY data_emprestimo ASC;

-- EXERCÍCIO 02
CREATE VIEW vw_editoras_livros AS
SELECT e.id AS id_editora, 
	   e.nome AS nome_editora, 
	   l.id AS id_livro, l.titulo AS titulo_livro, 
	   l.isbn, 
	   l.local_edicao
FROM editora e 
LEFT JOIN livros l 
	ON e.id = l.id_editora;

SELECT * FROM vw_editoras_livros;

-- EXERCÍCIO 03
CREATE VIEW vw_associados_emprestimos AS
SELECT a.codigo AS codigo_associado, 
	   a.nome AS nome_associado, 
	   a.email, 
	   emp.id AS id_emprestimo, 
	   emp.data_emprestimo, 
	   emp.data_devolucao, 
	   emp.id_funcionario
FROM associado a 
LEFT JOIN emprestimo emp 
	ON a.codigo = emp.id_associado;

SELECT * FROM vw_associados_emprestimos;

-- EXERCÍCIO 04
CREATE VIEW vw_relatorio_emprestimos AS
SELECT emp.id AS numero_emprestimo, 
	   emp.data_emprestimo, 
	   a.nome AS nome_associado, 
	   f.nome AS nome_funcionario, 
	   ex.numero AS numero_exemplar, 
	   l.titulo AS titulo_livro
FROM emprestimo emp
INNER JOIN associado a 
	ON emp.id_associado = a.codigo
INNER JOIN funcionario f 
	ON emp.id_funcionario = f.matricula
INNER JOIN exemplares_emprestimo ee 
	ON emp.id = ee.num_emprest
INNER JOIN exemplar ex 
	ON ee.num_exemplar = ex.numero
INNER JOIN livros l 
	ON ex.id_livro = l.id;

SELECT * 
FROM vw_relatorio_emprestimos 
ORDER BY data_emprestimo DESC;
```
