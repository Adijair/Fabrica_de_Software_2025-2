CREATE SCHEMA desafio;
USE desafio;

CREATE TABLE livros (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano_publicacao INT,
    genero VARCHAR(50)
);

CREATE TABLE usuarios(
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    idade INT,
    cidade VARCHAR(50),
    livro_id INT,
    CONSTRAINT fk_usuario_livro FOREIGN KEY (livro_id) REFERENCES livros(id)
);


INSERT INTO livros (id, titulo, autor, ano_publicacao, genero)
VALUES 
(1, 'Dom Casmurro', 'Machado de Assis', 1899, 'Romance'),
(2, 'O Cortiço', 'Aluísio Azevedo', 1890, 'Realismo'),
(3, 'Grande Sertão: Veredas', 'João Guimarães Rosa', 1956, 'Regionalismo'),
(4, 'Vidas Secas', 'Graciliano Ramos', 1938, 'Ficção Social'),
(5, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 'Romance Filosófico'),
(6, 'Capitães da Areia', 'Jorge Amado', 1937, 'Romance Social'),
(7, 'Iracema', 'José de Alencar', 1865, 'Romantismo Indianista'),
(8, 'Senhora', 'José de Alencar', 1875, 'Romance Urbano'),
(9, 'O Primo Basílio', 'José Maria de Eça de Queirós', 1878, 'Realismo Português'),
(10, 'A Hora da Estrela', 'Clarice Lispector', 1977, 'Modernismo');


INSERT INTO usuarios (id, nome, email, idade, cidade, livro_id) VALUES
(1, 'Ana', 'ana@email.com', 25, 'João Pessoa', 1),
(2, 'Adijair', 'adijair@email.com', 30, 'Campina Grande', 3),
(3, 'Mariana', 'mariana@email.com', 28, 'Salvador', 5),
(4, 'Pedro', 'pedro@email.com', 35, 'Fortaleza', 7),
(5, 'Julia', 'julia@email.com', 22, 'Natal', 2),
(6, 'Lucas', 'lucas@email.com', 29, 'Maceió', 4),
(7, 'Isabela', 'isabela@email.com', 31, 'Aracaju', 6),
(8, 'Rafael', 'rafael@email.com', 27, 'Teresina', 8),
(9, 'Larissa', 'larissa@email.com', 26, 'Santa Luzia', 10),
(10, 'Diego', 'diego@email.com', 33, 'Patos', 9);

SELECT * FROM usuarios;

UPDATE usuarios
SET cidade = 'Recife'
WHERE id = 5;

SELECT * FROM livros
WHERE genero = 'Romance';

SELECT COUNT(*) FROM usuarios;

SELECT AVG(idade) FROM usuarios;

SELECT MAX(ano_publicacao) FROM livros;

SELECT u.nome, l.titulo
FROM usuarios u
JOIN livros l ON u.livro_id = l.id;


