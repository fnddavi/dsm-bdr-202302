--Liste os títulos e seus status, incluindo os que não têm status definido
SELECT t.titulo, l.status
FROM tbl_titulo t
LEFT JOIN tbl_livros l ON t.codigo_titulo = l.codigo_titulo

--Liste os títulos e suas descrições dos livros alugados
SELECT t.titulo, t.descricao
FROM tbl_livros l
LEFT JOIN tbl_titulo t ON t.codigo_titulo = l.cod_livro
WHERE l.status = 'ALUGADO'

--Liste os nomes dos clientes que não têm livros alugados
select c.nome
from tbl_cliente as c
left join tbl_emprestimo as e on c.codigo_cliente = e.codigo_cliente
where e.numero_emprestimo is null; 

--Liste os títulos e suas categorias dos livros disponiveis
SELECT tbl_titulo.titulo, tbl_titulo.categoria
FROM tbl_livros.status
INNER JOIN tbl_titulo ON tbl_livros.titulo = tbl_titulo.categoria 
WHERE 

--Liste os nomes dos clientes e os títulos dos livros que eles têm alugados

--Retorne o nome, titulo do livro e o status do esmprestimo do livro alugado pela Ana Oliveira