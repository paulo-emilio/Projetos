select * from livros;

# só uma coluna
select nome_livro from livros;

# personalizando
select id_livro as "Código do Livro" from livros;


# FILTRANDO

select * from livros
where categoria = 'Biografia';

# tabela com todos romances mais baratos que 48,00
select * from livros
where categoria = 'Romance' and preco < 48;

# tabela com poesias que não são de Camões nem de Pedroza
select * from livros
where categoria = 'Poesia' 
and not 
(autoria = 'Luís Vaz de Camões' or autoria = 'Gabriel Pedrosa');

# somente nome e autor de livros onde o nome do livro termina com a
select nome_livro, autoria
from livros
where nome_livro like '%a';


# SELEÇÃO DISTINTA

# esse código mostra todas ids de livros que foram vendidos em cada venda 
select id_livro from vendas;

# esse código mostra todas ids de livros que foram vendidos sem se repetir
select distinct id_livro from vendas;

# apenas livros vendidos pelo vendedor 1 ordenados por id
select distinct id_livro from vendas 
where id_vendedor = 1
order by id_livro;
