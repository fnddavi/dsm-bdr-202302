--1 Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1.
SELECT
    f.nome,
    f.cidade
FROM
    tbl_fornecedor f
    JOIN tbl_estoque e1 ON f.cod_fornecedor = e1.cod_fornecedor
    JOIN tbl_peca p1 ON e1.cod_peca = p1.cod_peca
    AND p1.cod_peca = 1
WHERE
    (
        SELECT
            SUM(e2.quantidade)
        FROM
            tbl_estoque e2
        WHERE
            e2.cod_fornecedor = f.cod_fornecedor
    ) > 10;

--2  Encontre o nome das peças com preço superior a 10 que estão disponíveis em estoque:
SELECT
    p.nome
FROM
    tbl_peca p
    JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
WHERE
    p.preco > 10;

--3 Selecione o nome das peças que não estão em estoque:
SELECT
    p.nome
FROM
    tbl_peca p
    LEFT JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
WHERE
    e.cod_peca IS NULL;

--4 Encontre o nome das peças que estão em estoque com uma quantidade maior que 20:
SELECT
    p.nome
FROM
    tbl_peca p
    JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
WHERE
    e.quantidade > 20;

--5 Listar todas as pecas exceto a PLACA, ordenado por nome
SELECT
    nome
FROM
    tbl_peca
WHERE
    nome <> 'PLACA'
ORDER BY
    nome;

--6 Listar o nome e a cor das peças do fornecedor C, ordenado pelo nome da peça
SELECT
    p.nome AS nome_peca,
    p.cor,
    f.nome AS nome_fornecedor
FROM
    tbl_peca p
    JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
    JOIN tbl_fornecedor f ON e.cod_fornecedor = f.cod_fornecedor
WHERE
    f.nome = 'C'
ORDER BY
    p.nome;

--7 Listar o nome e a cor de todas as pecas de Londres
SELECT
    p.nome,
    p.cor
FROM
    tbl_peca p
    JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
    JOIN tbl_fornecedor f ON e.cod_fornecedor = f.cod_fornecedor
WHERE
    f.cidade = 'LONDRES';

--8 Encontre o nome das peças que estão disponíveis em estoque em Londres e não estão disponíveis em estoque em Paris:
SELECT
    p.nome
FROM
    tbl_peca p
    JOIN tbl_estoque el ON p.cod_peca = el.cod_peca
    JOIN tbl_fornecedor fl ON el.cod_fornecedor = fl.cod_fornecedor
    LEFT JOIN tbl_estoque ep ON p.cod_peca = ep.cod_peca
    LEFT JOIN tbl_fornecedor fp ON ep.cod_fornecedor = fp.cod_fornecedor
    AND fp.cidade = 'PARIS'
WHERE
    fl.cidade = 'LONDRES'
    AND fp.cidade IS NULL;

--9 Quais os codigos das peças que possuem maior estoque do que a peça de codigo 2?
SELECT
    e1.cod_peca
FROM
    tbl_estoque e1
WHERE
    e1.quantidade > (
        SELECT
            e2.quantidade
        FROM
            tbl_estoque e2
        WHERE
            e2.cod_peca = 2
    );