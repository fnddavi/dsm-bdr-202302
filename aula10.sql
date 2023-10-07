-- exercicios
--1 crie uma view chamada v_depcidade que liste o nome de cada departamento com o nome da cidade onde este departamento está localizado.
--Após a criacao executar Select * from v_depcidade; retorna 36 linhas

CREATE VIEW v_depcidade AS
SELECT
    d.nome AS nome_departamento,
    c.nome AS nome_cidade
FROM
    tbl_departamentos d,
    tbl_cidades c
WHERE
    d.cod_cidade = c.cod_cidade;

SELECT
    *
FROM
    v_depcidade;

--2 crie uma view denominada v_depcidadehouston, a partir de v_depcidade que mostre somente os departamentos localizados em Houston
-- execute select * from v_depcidadehouston

CREATE VIEW v_depcidadehouston AS
SELECT
    *
FROM
    v_depcidade
WHERE
    nome_cidade = 'Houston';

SELECT
    *
FROM
    v_depcidadehouston;

--3 Crie uma visão denominada de v_opsalario, a qual lista a soma e média de todos os salários dos empregados.
-- execute select * from v_opsalario

CREATE VIEW v_opsalario AS
SELECT
    SUM(salario) AS soma,
    AVG (salario) AS media
FROM
    tbl_empregados;

SELECT
    *
FROM
    v_opsalario;

--4 Criar a view vw_empregados_salarial que exibe o nome e o salário de todos os empregados com salário acima de 5500.
-- execute select * from v_empregados_salarial

CREATE VIEW vw_empregados_salarial AS
SELECT
    nome AS nome,
    salario AS salario
FROM
    tbl_empregados
WHERE
    salario > 5500;

SELECT
    *
FROM
    vw_empregados_salarial;

--5 criar uma view v_departemp para listar os departamentos e a quantidade de empregados em cada um
-- listar os departamentos e as quantidades por orderm decrescente de quantidade.

CREATE VIEW v_departemp AS
SELECT
    d.nome AS departamento,
    COUNT(e.cod_empregado) AS quantidade
FROM
    tbl_departamentos d
    INNER JOIN tbl_empregados e ON d.cod_departamento = e.cod_departamento
GROUP BY
    d.nome
HAVING
    COUNT(e.cod_empregado) > 0
ORDER BY
    quantidade DESC;

SELECT
    *
FROM
    v_departemp;

--6 criar uma view v_departrouble para listar os nomes dos departamentos que possuem mais projetos do que empregados.

CREATE VIEW v_departrouble AS
SELECT
    d.nome AS nome
FROM
    tbl_departamentos d
    LEFT JOIN tbl_projetos p ON d.cod_departamento = p.cod_departamento
    LEFT JOIN (
        SELECT
            cod_departamento,
            COUNT(cod_empregado) AS quantidade_empregados
        FROM
            tbl_empregados
        GROUP BY
            cod_departamento
    ) e ON d.cod_departamento = e.cod_departamento
GROUP BY
    d.nome,
    e.quantidade_empregados
HAVING
    COUNT(DISTINCT p.cod_projeto) > COALESCE(e.quantidade_empregados, 0);

SELECT
    *
FROM
    v_departrouble;