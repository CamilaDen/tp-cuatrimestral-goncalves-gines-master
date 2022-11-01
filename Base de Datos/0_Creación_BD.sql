-- USE master
-- GO
-- DROP DATABASE Clinica

CREATE DATABASE Clinica
go
USE Clinica
go

CREATE TABLE PERFIL (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    NOMBRE VARCHAR(50) NOT NULL,
    ACTIVO BIT NOT NULL DEFAULT(1)
)
GO

CREATE TABLE USUARIO (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    PASS VARCHAR(50) NOT NULL,
    ACTIVO BIT NOT NULL DEFAULT(1)
)
GO

CREATE TABLE USUARIO_X_PERFILES (
    IDUSUARIO INT,
	IDPERFIL INT,
	PRIMARY KEY (IDUSUARIO, IDPERFIL),
	FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO (ID),
	FOREIGN KEY (IDPERFIL) REFERENCES PERFIL (ID)
)
GO

CREATE TABLE PERSONA (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),    
    APELLIDO VARCHAR(50) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    FECHA_NACIMIENTO SMALLDATETIME NOT NULL CHECK ( FECHA_NACIMIENTO >= '1900' AND FECHA_NACIMIENTO <= getdate() ),
    DNI VARCHAR(10) NOT NULL UNIQUE,
    MAIL VARCHAR(50) NOT NULL,
    IDUSUARIO INT NULL FOREIGN KEY REFERENCES USUARIO(ID),
    ACTIVO BIT NOT NULL DEFAULT(1)
)
GO

CREATE TABLE ESPECIALIDAD (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1), 
    NOMBRE VARCHAR(50) NOT NULL,
    ACTIVO BIT NOT NULL DEFAULT(1)
)
GO

CREATE TABLE HORARIO (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    HORA_DESDE TINYINT NOT NULL CHECK ( HORA_DESDE >= 0 AND HORA_DESDE <= 23 ),
    HORA_HASTA TINYINT NOT NULL CHECK ( HORA_HASTA >= 0 AND HORA_HASTA <= 23 ),
    DIA INT NOT NULL,
    ACTIVO BIT NOT NULL DEFAULT(1)
)

GO

CREATE TABLE MEDICO (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1), 
    MATRICULA VARCHAR(50) NOT NULL,
    IDPERSONA INT NOT NULL FOREIGN KEY REFERENCES PERSONA(ID),
    ACTIVO BIT NOT NULL DEFAULT(1)
)
GO

CREATE TABLE MEDICO_X_HORARIO (
    IDMEDICO INT,
	IDHORARIO INT,
	PRIMARY KEY (IDMEDICO, IDHORARIO),
	FOREIGN KEY (IDMEDICO) REFERENCES MEDICO (ID),
	FOREIGN KEY (IDHORARIO) REFERENCES HORARIO (ID)
)
GO


CREATE TABLE MEDICO_X_ESPECIALIDAD (
    IDMEDICO INT,
	IDESPECIALIDAD INT,
	PRIMARY KEY (IDMEDICO, IDESPECIALIDAD),
	FOREIGN KEY (IDMEDICO) REFERENCES MEDICO (ID),
	FOREIGN KEY (IDESPECIALIDAD) REFERENCES ESPECIALIDAD (ID)
)
GO

CREATE TABLE TURNO_ESTADO (
    ID INT NOT NULL PRIMARY KEY, 
    NOMBRE VARCHAR(50) NOT NULL, 
    ACTIVO INT NOT NULL DEFAULT(1) 
)
GO

CREATE TABLE OBRASOCIAL (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1), 
    NOMBRE VARCHAR(50) NOT NULL,
    SIGLA VARCHAR(10) NOT NULL,
    CUIT VARCHAR(20) NOT NULL,
    TELEFONO VARCHAR(20) NOT NULL,
    DIRECCION VARCHAR(50) NOT NULL,
    MAIL VARCHAR(50) NOT NULL,
    ACTIVO BIT NOT NULL DEFAULT(1)
)
GO

CREATE TABLE PACIENTE (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1), 
    PESO FLOAT NOT NULL CHECK ( PESO > 0),
    ALTURA FLOAT NOT NULL CHECK ( ALTURA > 0),
    CREDENCIAL VARCHAR(50) NOT NULL,
    IDPERSONA INT NOT NULL FOREIGN KEY REFERENCES PERSONA(ID),
    IDOBRASOCIAL INT NOT NULL FOREIGN KEY REFERENCES OBRASOCIAL(ID),
    ACTIVO BIT NOT NULL DEFAULT(1)
)
GO

CREATE TABLE TURNO (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1), 
    NRO VARCHAR(50) NOT NULL,
    OBSERVACIONES VARCHAR(250) NOT NULL,
    FECHA SMALLDATETIME NOT NULL,
    HORA TINYINT NOT NULL CHECK ( HORA >= 0 AND HORA <= 23 ),
    FECHA_SOLICITADO SMALLDATETIME NOT NULL,
    IDMEDICO INT NOT NULL FOREIGN KEY REFERENCES MEDICO(ID),
    IDPACIENTE INT NOT NULL FOREIGN KEY REFERENCES PACIENTE(ID),
    ESTADO INT NOT NULL DEFAULT(0) FOREIGN KEY REFERENCES TURNO_ESTADO(ID)
)
GO