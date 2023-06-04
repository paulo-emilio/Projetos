import mysql.connector
from mysql.connector import errorcode
from flask_bcrypt import generate_password_hash

print("Conectando...")
try:
      conn = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password='admin'
      )
except mysql.connector.Error as err:
      if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print('Existe algo errado no nome de usuário ou senha')
      else:
            print(err)

cursor = conn.cursor()

cursor.execute("DROP DATABASE IF EXISTS `jogoteca`;")

cursor.execute("CREATE DATABASE `jogoteca`;")

cursor.execute("USE `jogoteca`;")

# criando tabelas
TABLES = {}
TABLES['Jogos'] = ('''
      CREATE TABLE `jogos` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `nome` varchar(50) NOT NULL,
      `categoria` varchar(40) NOT NULL,
      `console` varchar(20) NOT NULL,
      PRIMARY KEY (`id`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;''')

TABLES['Usuarios'] = ('''
      CREATE TABLE `usuarios` (
      `nome` varchar(20) NOT NULL,
      `nickname` varchar(8) NOT NULL,
      `senha` varchar(100) NOT NULL,
      PRIMARY KEY (`nickname`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;''')

for tabela_nome in TABLES:
      tabela_sql = TABLES[tabela_nome]
      try:
            print('Criando tabela {}:'.format(tabela_nome), end=' ')
            cursor.execute(tabela_sql)
      except mysql.connector.Error as err:
            if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
                  print('Já existe')
            else:
                  print(err.msg)
      else:
            print('OK')


# inserindo usuarios
usuario_sql = 'INSERT INTO usuarios (nome, nickname, senha) VALUES (%s, %s, %s)'
usuarios = [
      ("Loki", "loki", generate_password_hash("loki1").decode('utf-8')),
      ("Darth", "darth", generate_password_hash("darth1").decode('utf-8')),
      ("Gandalf", "gandalf", generate_password_hash("gandalf1").decode('utf-8'))
]
cursor.executemany(usuario_sql, usuarios)

cursor.execute('select * from jogoteca.usuarios')
print(' -------------  Usuários:  -------------')
for user in cursor.fetchall():
    print(user[1])

# inserindo jogos
jogos_sql = 'INSERT INTO jogos (nome, categoria, console) VALUES (%s, %s, %s)'
jogos = [
      ('Super Mario World', 'Plataforma', 'Super Nintendo'),
      ('Donkey Kong Country', 'Plataforma', 'Super Nintendo'),
      ('Shadow of the Colossus', 'Aventura', 'Play Station 2'),
      ('Guitar Hero', 'Musical', 'Play Station 2'),
      ('Red Dead Redemption', 'Aventura', 'Xbox 360'),
      ('Dark Souls', 'RPG', 'Xbox 360'),
      ('The Last of Us', 'Survival horror', 'Play Station 4'),
      ('Bloodborne', 'RPG', 'Play Station 4'),
      ('The Witcher', 'RPG', 'Windows'),
      ('Elden Ring', 'RPG', 'Windows'),
]
cursor.executemany(jogos_sql, jogos)

cursor.execute('select * from jogoteca.jogos')
print(' -------------  Jogos:  -------------')
for jogo in cursor.fetchall():
    print(jogo[1])

# commitando se não nada tem efeito
conn.commit()

cursor.close()
conn.close()
