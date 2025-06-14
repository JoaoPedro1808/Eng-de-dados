USE escola;

-- EX 17
INSERT INTO aluno(matricula,nomealuno,sexo,dtnascimento)
VALUES (1, 'Ana','F','1979-01-01');

SELECT * FROM aluno;

-- EX 18

INSERT INTO aluno(matricula,nomealuno,sexo,dtnascimento) 
VALUES 
(2, 'André','M','1980-11-20'),
(3,'Andreia','F','1985-05-09'),
(4,'Bruna','F','1980-11-20'),
(5,'Bruno','M','1982-01-12');

SELECT * FROM aluno;

-- EX 19
INSERT INTO departamento(coddepto,nomedepto)
VALUES
(1,'TI'),
(2, 'ADM');

SELECT * FROM departamento;

-- EX 20
INSERT INTO curso(codcurso,nomecurso,ch,preco,coddepto)
VALUES
(1,'Python',40,1200,1),
(2,'Power BI',20,900,1),
(3,'Pentaho',40,1200,1),
(4,'Recursos Humanos',60,2000,2),
(5,'Marketing',80,2500,1);

SELECT * FROM curso;

ALTER TABLE matricula RENAME COLUMN matricula TO matri;

-- EX 21
INSERT INTO matricula(matri,codcurso,dtmatricula)
VALUES
(1,1,'2019-04-01'),
(2,1,'2019-04-01'),
(4,1,'2019-04-01'),
(4,2,'2019-04-02'),
(5,2,'2019-04-02'),
(1,2,'2019-04-02'),
(1,3,'2019-04-03'),
(5,3,'2019-04-03'),
(3,3,'2019-04-03'),
(2,3,'2019-04-03'),
(4,3,'2019-04-03'),
(5,4,'2019-04-04'),
(3,4,'2019-04-04'),
(5,5,'2019-04-06'),
(3,5,'2019-04-06'),
(2,5,'2019-04-06');

SELECT * FROM matricula;

SELECT aluno.nomealuno, curso.nomecurso, matricula.dtmatricula
	FROM aluno, matricula, curso
WHERE aluno.matricula = matricula.matri
	AND matricula.codcurso = curso.codcurso;
    
-- EX 22
INSERT INTO funcionario(codfunc,nomefunc,cidade,uf,coddepto,sexo)
VALUES
(1,'Paulo','Duque de Caxias','RJ',1,'M'),
(2,'Paula','Rio de Janeiro','RJ',2,'F'),
(3,'José','Rio de Janeiro','RJ',1,'M');

SELECT * FROM funcionario;

-- ---------------------------------------------------------------------

UPDATE curso SET preco = 1200
WHERE codcurso = 1;

UPDATE curso SET preco = 900
WHERE codcurso = 2;

UPDATE curso SET preco = 1200
WHERE codcurso = 3;

UPDATE curso SET preco = 2000
WHERE codcurso = 4;

UPDATE curso SET preco = 2500
WHERE codcurso = 5;

SELECT * FROM curso;

-- ---------------------------------------------------------------------
SELECT * FROM curso;

-- EX 23
UPDATE curso SET preco = "1000"
WHERE codcurso = "2";

-- EX 24
UPDATE curso SET coddepto = "2"
WHERE codcurso = "5";

-- EX 25
UPDATE curso SET ch = "80"
WHERE codcurso = "4";

-- EX 26
UPDATE curso SET preco = preco * 1.2
WHERE coddepto = "1";

-- EX 27
UPDATE curso SET preco = preco - 50
WHERE coddepto = "2";

-- EX 28
UPDATE curso SET preco = preco - preco * 0.1
WHERE ch < 80 AND preco > 1000;