drop DATABASE DB_ESCOLA_JOIN; 
CREATE DATABASE DB_ESCOLA_JOIN; 
USE DB_ESCOLA_JOIN; 

CREATE TABLE Alunos ( 
    cod INT PRIMARY KEY, 
    nome VARCHAR(100), 
    cidade VARCHAR(100) 
); 

-- Inserindo dados iniciais na tabela Alunos 
					INSERT INTO Alunos (cod, nome, cidade) VALUES 
					(1, 'Carlos', 'Sorocaba'), 
					(2, 'Beatriz', 'Itu'), 
					(3, 'sarah', 'Votorantim'); 

					-- Criando a tabela Matriculas 
					CREATE TABLE Matriculas ( 
						cod INT PRIMARY KEY, 
						valor DECIMAL(10, 2), 
						data DATE, 
						cod_aluno INT, 
						FOREIGN KEY (cod_aluno) REFERENCES Alunos(cod) 
					); 

					-- Inserindo dados iniciais na tabela Matriculas 
					INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES 
					(1, 180.00, '2023-10-10', 1), 
					(2, 250.00, '2023-10-11', 2), 
					(3, 400.00, '2023-10-12', 1);


					-- Exercício 1
					insert into Alunos (cod, nome, cidade) values 
					(4, 'Lívia', 'Londrina'),
					(5, 'Camila', 'Boituva'),
					(6, 'Isabela', 'Paineras'),
					(7, 'Julia', 'Florianópolis'),
					(8, 'Arthur', 'Campinas'),
					(9, 'Adriana', 'Sorocaba'),
					(10, 'Jorge', 'Bahia');

					insert into Matriculas (cod, valor, data, cod_aluno) values 
					(4, 150.00, '2023-10-15', 4),
					(5, 300.00, '2023-09-20', 5),
					(6, 450.00, '2023-10-22', 6),
					(7, 190.00, '2023-10-05', 1),
					(8, 210.00, '2023-11-02', 2),
					(9, 120.00, '2023-10-28', 4),
					(10, 380.00, '2023-10-30', 8);

-- Exercício 2
select 
     Alu.nome as Alu_nome,
     Alu.cidade Alu_cidade,
     Matri.valor as Matri_valor
from Alunos as Alu
inner join Matriculas Matri
on Alu.cod = Matri.cod_aluno;

-- Exercício 3
select 
     Alu.nome as Alu_nome,
     Alu.cidade Alu_cidade,
     Matri.valor as Matri_valor
from Alunos as Alu
left join Matriculas Matri
on Alu.cod = Matri.cod_aluno
where matri.cod_aluno is null;

-- Exercício 4 
select
    Matri.cod as Matri_cod, 
    Matri.valor as Matri_valor,
    Matri.data as Matri_data, 
    Alu.nome as Alu_nome, 
    Alu.cidade as Alu_cidade
from Alunos as Alu 
right join Matriculas Matri on Alu.cod = Matri.cod_aluno; 

-- Exercício 5 
select 
   Alu.nome as Alu_nome
from Alunos as Alu 
left join Matriculas Matri on Alu.cod = Matri.cod_aluno 
where Matri.cod_aluno is null; 

-- Exercício 6 
select 
   Alu.nome as Alu_nome, 
   Matri.valor as Matri_valor 
from Alunos as Alu 
inner join Matriculas Matri on Alu.cod = Matri.cod_aluno 
where Matri.valor > 200.00; 

-- Exercício 7
select 
   Alu.nome as Alu_nome, 
   Matri.data as Matri_data, 
   Matri.valor as Matri_valor 
from Alunos as Alu 
inner join Matriculas Matri on Alu.cod = Matri.cod_aluno 
where Matri.data between '2023-10-01' and '2023-10-31';