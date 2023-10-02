# DELETANDO "Os Lusíadas"

select * from livros;

# desativando FKs
set foreign_key_checks = 0;

delete from livros where ID_LIVRO = 8;

# 10% de desconto em toda loja
update livros set PRECO = 0.9*PRECO where ID_LIVRO > -1;

#
set foreign_key_checks = 1;