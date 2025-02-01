CREATE DATABASE IF NOT EXISTS cepBrasil;

USE cepBrasil;

CREATE TABLE `ESTADO` (
    `idEstado` int(10) UNSIGNED NOT NULL,
    `nome` varchar(95) NOT NULL,
    `iniciais` varchar(2) NOT NULL,
    
    CONSTRAINT ESTADO_PK PRIMARY KEY (idEstado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CIDADE` (
    `idCidade` int(10) UNSIGNED NOT NULL,
    `idEstado` int(10) UNSIGNED NOT NULL,
    `nome` varchar(95) NOT NULL,
    `identificadorUrl` varchar(95) NOT NULL,

    CONSTRAINT CIDADE_PK PRIMARY KEY (idCidade),
    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (idEstado) REFERENCES ESTADO(idEstado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BAIRRO` (
    `idBairro` int(10) UNSIGNED NOT NULL,
    `idCidade` int(10) UNSIGNED NOT NULL,
    `nome` varchar(95) NOT NULL,
    `identificadorUrl` varchar(95) NOT NULL,
    
    CONSTRAINT BAIRRO_PK PRIMARY KEY (idBairro),
    CONSTRAINT BAIRRO_CIDADE_FK FOREIGN KEY (idCidade) REFERENCES CIDADE(idCidade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `LOGRADOURO` (
    `idLogradouro` int(10) UNSIGNED NOT NULL,
    `idCidade` int(10) UNSIGNED NOT NULL,
    `idBairro` int(11) DEFAULT NULL,
    `endereco` varchar(255) DEFAULT NULL,
    `codigoPostal` varchar(15) DEFAULT NULL,
    `latitude` varchar(20) DEFAULT NULL,
    `longitude` varchar(20) DEFAULT NULL,
    `ddd` int(2) DEFAULT NULL,

    CONSTRAINT LOGRADOURO_PK PRIMARY KEY (idLogradouro),
    CONSTRAINT LOGRADOURO_CIDADE_FK FOREIGN KEY (idCidade) REFERENCES CIDADE(idCidade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;