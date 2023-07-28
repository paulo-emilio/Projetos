# parPRIMARYa inserir informações precisamos desativar a relação das entre tabelas (FK)
# desativando todas FKs:
set foreign_key_checks = 0;

insert into livros values(
1,
"Trilogia O Senhor dos Anéis",
"J.R.R. Tolkien",
"HarperCollins",
"Alta fantasia",
120.00);

# Várias linhas em uma execução
insert into livros values
(2, "As Crônicas de Artur", "Bernard Cornwell", "Record", "Ficção Histórica", 70.00),
(3, "O Nome do Vento", "Patrick Rothfuss", "Arqueiro", "Fantasia", 60.00),
(4, "Game of Thrones", "George R.R. Martin", "Bantam", "Fantasia", 400.00);

insert into vendedores values
(1, 'Loki'),
(2, 'Darth'),
(3, 'Sauron'),
(4, 'Joker');

# ALURA

INSERT INTO LIVROS VALUES
(5,    'Memórias Póstumas de Brás Cubas',    'Machado de Assis',    'Antofágica',    'Romance',    45),
(6,    'Quincas Borba',                 'Machado de Assis',    'L&PM Editores', 'Romance',    48.5),
(7,    'Ícaro',                             'Gabriel Pedrosa',     'Ateliê',          'Poesia',    36),
(8,    'Os Lusíadas',                     'Luís Vaz de Camões',  'Montecristo',   'Poesia',    18.79),
(9,    'Outros Jeitos de Usar a Boca',    'Rupi Kaur',          'Planeta',          'Poesia',    34.8);

INSERT INTO ESTOQUE VALUES
(1,  7), (2,  10), (3,  2), (8,  4), (10, 5), (11, 3), (12, 3);

INSERT INTO VENDAS 
VALUES 
(1, 3, 7, 1, '2020-11-02'),
(2, 4, 8, 2, '2020-11-02'),
(3, 4, 4, 3, '2020-11-02'),
(4, 1, 7, 1, '2020-11-03'),
(5, 1, 6, 3, '2020-11-03'),
(6, 1, 9, 2, '2020-11-04'),
(7, 4, 1, 3, '2020-11-04'),
(8, 1, 5, 2, '2020-11-05'),
(9, 1, 2, 1, '2020-11-05'),
(10, 3, 8, 2, '2020-11-11'),
(11, 1, 1, 4, '2020-11-11'),
(12, 2, 10, 10, '2020-11-11'),
(13, 1, 12, 5, '2020-11-18'),
(14, 2, 4, 1, '2020-11-25'),
(15, 3, 13, 2,'2021-01-05'),
(16, 4, 13, 1, '2021-01-05'),
(17, 4, 4, 3, '2021-01-06'),
(18, 2, 12, 2, '2021-01-06');

# inserindo valores em outra ordem
insert into livros 
(categoria, autoria, nome_livro, editora, id_livro, preco)
values
('Biografia', 'Anne Frank', 'O Diário de Anne Frank', 'Pe Da Letra', 10, 34.90);

# Alura

INSERT INTO LIVROS 
(CATEGORIA, AUTORIA, NOME_LIVRO, EDITORA, ID_LIVRO, PRECO)
VALUES
('Biografia' ,    'Malala Yousafzai', 'Eu sou Malala'       , 'Companhia das Letras', 11, 22.32),
('Biografia' ,    'Michelle Obama'  , 'Minha história'      , 'Objetiva'            ,    12,    57.90),
('Biografia' ,    ' David Bodanis'  , 'Einstein: Biografia de um gênio imperfeito'  ,     '‎ Zahar'    , 13, 58.90);

# reativando todas FKs:
set foreign_key_checks = 1;

# extra: Excluindo Tabela
# drop table vendedores;