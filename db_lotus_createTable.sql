CREATE DATABASE IF NOT EXISTS NabyLotus;
USE NabyLotus;

CREATE TABLE Usuarios (
    IdUsuario INT AUTO_INCREMENT NOT NULL,
    Mail VARCHAR(50) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL,
    NombreUsuario VARCHAR(20) NOT NULL,
    FotoUsuario VARCHAR(400) NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (IdUsuario)
);

CREATE TABLE Etapas (
    IdEtapa CHAR(3) NOT NULL,
    NombreEtapa VARCHAR(30) NOT NULL,
    CONSTRAINT pk_etapa PRIMARY KEY (IdEtapa)
);

CREATE TABLE Plantas (
    IdPlanta CHAR(5) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Foto VARCHAR(400) NOT NULL,
    Descripcion VARCHAR(400) NOT NULL,
    Sustrato VARCHAR(400) NOT NULL,
    Riego VARCHAR(400) NOT NULL,
    Luz VARCHAR(400) NOT NULL,
    Temperatura VARCHAR(400) NOT NULL,
    Fertilizacion VARCHAR(400) NOT NULL,
    Mantenimiento VARCHAR(400) NOT NULL,
    Conservacion VARCHAR(400) NOT NULL,
    Semillas VARCHAR(400) NOT NULL,
    CONSTRAINT pk_planta PRIMARY KEY (IdPlanta)
);

CREATE TABLE CiclosPlantas (
    IdPlanta CHAR(5),
    IdEtapa CHAR(3),
    Duracion VARCHAR(40),
    Descripcion VARCHAR(200),
    Estacion VARCHAR(100),
    CONSTRAINT pk_ciclos PRIMARY KEY (IdPlanta, IdEtapa),
    CONSTRAINT fk_ciclos_plantas FOREIGN KEY (IdPlanta) REFERENCES Plantas (IdPlanta),
    CONSTRAINT fk_ciclos_etapa FOREIGN KEY (IdEtapa) REFERENCES Etapas (IdEtapa)
);

CREATE TABLE PlantaUsuarios (
    IdPlanta CHAR(5),
    IdUsuario INT,
    Foto VARCHAR(400) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    FechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_PlantaUsuario PRIMARY KEY (IdPlanta, IdUsuario),
    CONSTRAINT fk_PlantaUsuario_Planta FOREIGN KEY (IdPlanta) REFERENCES Plantas (IdPlanta),
    CONSTRAINT fk_PlantaUsuario_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuarios (IdUsuario)
);

CREATE TABLE ComentarioUsuario (
    IdPlanta CHAR(5),
    IdUsuario INT,
    Fecha DATETIME NOT NULL,
    Foto VARCHAR(400) NULL,
    Texto VARCHAR(603) NOT NULL,
    CONSTRAINT pk_Comentario PRIMARY KEY (IdPlanta, IdUsuario, Fecha),
    CONSTRAINT fk_Comentario_Planta FOREIGN KEY (IdPlanta) REFERENCES Plantas (IdPlanta),
    CONSTRAINT fk_Comentario_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuarios (IdUsuario)
);

CREATE TABLE Administrador (
    IdAdmin int auto_increment not null,
    mail varchar(500) NOT NULL UNIQUE,
    Contrasena varchar(500) NOT NULL,
    CONSTRAINT pk_admin PRIMARY KEY (IdAdmin)
);

CREATE TABLE Administrador (
    IdAdmin INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Contraseña VARCHAR(255) NOT NULL,
    CONSTRAINT pk_admin PRIMARY KEY (IdAdmin)
);

CREATE TABLE Administrador (
    IdAdmin INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Contraseña VARCHAR(255) NOT NULL,
    CONSTRAINT pk_admin PRIMARY KEY (IdAdmin)
);