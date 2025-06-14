CREATE SCHEMA escola;

USE escola;

CREATE TABLE aluno ( -- Tabela aluno
	matricula INT PRIMARY KEY,
	nomealuno VARCHAR(30) NOT NULL,
	sexo CHAR(1),
	dtnascimento DATE 
	);
    
CREATE TABLE departamento ( -- Tabela departamento
	coddepto INT PRIMARY KEY,
    nomedepto VARCHAR(30) NOT NULL
    );

CREATE TABLE curso ( -- Tabela curso
	codcurso INT PRIMARY KEY,
    nomecurso VARCHAR(30) NOT NULL,
    ch INT CHECK (ch > 0),
    preco REAL,
    coddepto INT,
    FOREIGN KEY (coddepto) REFERENCES departamento (coddepto) -- Definindo chave estrangeira.
    );
    
CREATE TABLE matricula ( -- Solução 1 (Usar desta forma)
	matricula INT,
	codcurso INT,
	dtmatricula DATE,
	PRIMARY KEY (matricula, codcurso),
	FOREIGN KEY (matricula) REFERENCES aluno (matricula),
	FOREIGN KEY (codcurso) REFERENCES curso (codcurso)
);

/* 
CREATE TABLE matricula ( -- Solução 2 
COD matricula INT AUTO_INCREMENT PRIMARY KEY,
matricula INT,
codcurso INT,
dtmatricula DATE,
FOREIGN KEY (matricula) REFERENCES aluno (matricula),
FOREIGN KEY (codcurso) REFERENCES curso (codcurso)
);
*/

CREATE TABLE func ( -- Tabela funcionario
	codfunc INT PRIMARY KEY,
	nomefunc VARCHAR(20),
	city VARCHAR(20),
    cbo INT, 
    uf CHAR(20),
    coddepto INT,
    FOREIGN KEY (coddepto) REFERENCES departamento (coddepto)
    );

-- EX-06
ALTER TABLE func RENAME COLUMN city TO cidade;

-- EX-07
ALTER TABLE func ADD COLUMN sexo CHAR(1);

-- EX-08
ALTER TABLE func MODIFY COLUMN nomefunc VARCHAR(30); 

-- EX-09
ALTER TABLE func DROP COLUMN cbo;

-- EX-10
ALTER TABLE funcionario ALTER COLUMN uf SET DEFAULT 'RJ';

-- EX-11
ALTER TABLE func RENAME TO funcionario;

-- EX-12
ALTER TABLE funcionario MODIFY COLUMN nomefunc VARCHAR(30) NOT NULL;

-- EX-13
ALTER TABLE funcionario MODIFY COLUMN codfunc INT Auto_Increment;

ALTER TABLE funcionario MODIFY COLUMN uf CHAR(2); 

CREATE TABLE telefone ( -- Tabela telefone
	codtel SERIAL PRIMARY KEY,
	ddd INT,
	numero VARCHAR(13),
	codfunc INT,
	FOREIGN KEY (codfunc) REFERENCES funcionario (codfunc)
    );

DROP TABLE funcionario;

DROP TABLE telefone;


