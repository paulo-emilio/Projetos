# FILTRANDO USANDO DUAS TABELAS

# ID do Vendedor, seu Nome, e sua Quantidade de Vendasc(somadas), agrupadas pelo código de vendedor
select vendas.ID_VENDEDOR, vendedores.NOME_VENDEDOR, sum(vendas.QTD_VENDIDA)
from vendas, vendedores
where vendas.ID_VENDEDOR = vendedores.ID_VENDEDOR
group by vendas.ID_VENDEDOR;


# INNER JOIN
select vendas.ID_VENDEDOR, vendedores.NOME_VENDEDOR, sum(vendas.QTD_VENDIDA)
from vendas inner join vendedores
on vendas.ID_VENDEDOR = vendedores.ID_VENDEDOR
group by vendas.ID_VENDEDOR;


# EXTRA
# maior venda feita no clube do livro
select max(QTD_VENDIDA) from vendas;


# LEFT AND RIGHT JOIN

# Todos os livros da base de dados foram vendidos?
# left join pega todos valores da tabela da esquerda, e os valores que não existem na da direita fica como NULL
select livros.NOME_LIVRO, vendas.QTD_VENDIDA
from livros left join vendas
on livros.ID_LIVRO = vendas.ID_LIVRO
where vendas.QTD_VENDIDA is null;
# concluímos que "O nome do vento" e "Eu sou Malala" não foram vendidos

# right join
select vendas.id_livro,
livros.NOME_LIVRO, vendas.QTD_VENDIDA
from livros right join vendas
on livros.ID_LIVRO = vendas.ID_LIVRO;
# percebemos que o livro de id 8 não está na base de dados, mas tem vendas dele