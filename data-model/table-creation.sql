    CREATE DATABASE IF NOT exists delilah;
    USE delilah;
    CREATE TABLE IF NOT exists users (
        ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
        USER_NAME varchar(30) NOT NULL,
        FULL_NAME varchar(60) NOT NULL,
        EMAIL varchar(100) NOT NULL,
        PHONE_COUNTRY_CODE varchar(5) NOT NULL,
        PHONE_NUMBER varchar(25) NOT NULL,
        ADDRESS varchar(250) NOT NULL,
        PASSWORD varchar(100) NOT NULL,
        ROLE varchar(50) NOT NULL
    );    
    
    CREATE TABLE IF NOT exists products (
        ID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
        PRODUCT_NAME varchar(100) NOT NULL,
        PRODUCT_PRICE float NOT NULL,
        PRODUCT_IMAGE varchar(150)
    );

    CREATE TABLE IF NOT EXISTS pedidos (
        ID INT AUTO_INCREMENT PRIMARY KEY,
        ESTADO ENUM('NUEVO', 'CONFIRMADO', 'PREPARANDO', 'ENVIANDO', 'CANCELADO', 'ENTREGADO'),
        HORA VARCHAR(30),
        DESCRIPCION TEXT,
        PAGO FLOAT,
        USUARIO INT,
        DIRECCION VARCHAR(100)
    );
