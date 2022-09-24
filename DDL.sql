create database if not exists Vitrine_Virtual;

use Vitrine_Virtual;

CREATE TABLE IF NOT EXISTS Fornecedor (
    id_fornecedor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cnpj BIGINT,
    nome VARCHAR(64),
    endereco VARCHAR(64)
);

CREATE TABLE IF NOT EXISTS Produto (
    id_produto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(64) NOT NULL,
    tamanho VARCHAR(2) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    estoque INT NOT NULL,
    preco DECIMAL(10 , 2 ) NOT NULL,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedor (id_fornecedor)
);

CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(64) NOT NULL,
    cpf BIGINT(11) NOT NULL,
    email VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS Avaliacao (
    id_avaliacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(64) NOT NULL,
    data_avaliacao DATE NOT NULL,
    comentario VARCHAR(64),
    nota INT NOT NULL,
    id_produto INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_produto)
        REFERENCES Produto (id_produto),
    FOREIGN KEY (id_cliente)
        REFERENCES Cliente (id_cliente)
);