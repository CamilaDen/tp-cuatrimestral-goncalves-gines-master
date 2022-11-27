SET DATEFORMAT dmy;
GO
USE Clinica
GO

/* DBCC CHECKIDENT (HORARIO, RESEED, 0)   PARA REINICIAR EL IDENTITY DE ALGUNA TABLA*/

/* ESPECIALIDADES ---- SELECT * FROM ESPECIALIDAD */
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('MEDICO CLINICO')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('CARDIOLOGIA')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('GASTROENTEROLOGIA')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('PEDIATRIA')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('ENDOCRINOLOGIA')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('ODONTOLOGIA')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('NEUROLOGIA')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('NEUMOLOGIA')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('NUTRICION')
INSERT INTO ESPECIALIDAD ( NOMBRE) VALUES ('OFTALMOLOGIA')

/*COBERTURAS (OBRA SOCIAL, PREPAGAS, ART) ---- SELECT * FROM OBRASOCIAL */
INSERT INTO OBRASOCIAL ( NOMBRE,SIGLA,CUIT,TELEFONO,DIRECCION,MAIL ) VALUES ('Organizacion de Servicios Directos Empresarios','OSDE',318756123,435869,'AV Avenida 123','Osde@algo.com')
INSERT INTO OBRASOCIAL ( NOMBRE,SIGLA,CUIT,TELEFONO,DIRECCION,MAIL ) VALUES ('MEDICUS','MEDICUS',31987644,499879,'Calle x 321','Medicus@algo.com')
INSERT INTO OBRASOCIAL ( NOMBRE,SIGLA,CUIT,TELEFONO,DIRECCION,MAIL ) VALUES ('GALENO','GALENO',309784552,405891,'La Calle 8','Galeno@algo.com')
INSERT INTO OBRASOCIAL ( NOMBRE,SIGLA,CUIT,TELEFONO,DIRECCION,MAIL ) VALUES ('Obra Social de Empleados de Comercio','OSECAC',32888994,397851,'Dorado oscuro 454','Osecac@algo.com')
INSERT INTO OBRASOCIAL ( NOMBRE,SIGLA,CUIT,TELEFONO,DIRECCION,MAIL ) VALUES ('Instituto de Obra Medico Asitencial','IOMA',30879456,486969,'Otra calle 13','IOMA@algo.com')
INSERT INTO OBRASOCIAL ( NOMBRE,SIGLA,CUIT,TELEFONO,DIRECCION,MAIL ) VALUES ('Programa Asistencia Medica Integral','PAMI',30123123,456123,'Calle vieja 95','PAMI@algo.com')

/* PERFILES ---- SELECT * FROM PERFIL */
INSERT INTO PERFIL ( NOMBRE ) VALUES ('Administrador')
INSERT INTO PERFIL ( NOMBRE ) VALUES ('Medico')
INSERT INTO PERFIL ( NOMBRE ) VALUES ('Recepcionista')

/* USUARIOS  ---- SELECT * FROM USUARIO */
INSERT INTO USUARIO (NOMBREUSUARIO, PASS, IDPERFIL ) VALUES ('Sebas','1234',1)
INSERT INTO USUARIO (NOMBREUSUARIO, PASS, IDPERFIL ) VALUES ('Cami','1234',2)
INSERT INTO USUARIO (NOMBREUSUARIO, PASS, IDPERFIL ) VALUES ('Maxi','1234',2)
INSERT INTO USUARIO (NOMBREUSUARIO, PASS, IDPERFIL ) VALUES ('Pepe','1234',3)

/* USUARIOS  ---- SELECT * FROM PERSONAL */
INSERT INTO PERSONA(APELLIDO, NOMBRE, FECHA_NACIMIENTO, DNI, MAIL, IDUSUARIO ) VALUES ('Goncalves', 'Camila ', '23/10/1996',43431806,'cami.goncalves@clinic.com',2)
INSERT INTO PERSONA(APELLIDO, NOMBRE, FECHA_NACIMIENTO, DNI, MAIL, IDUSUARIO ) VALUES ('Gines', 'Sebastian ', '13/01/1987',33876312,'sebastian.gines@clinic.com',1)


/* HORARIO MEDICOS ---- SELECT * FROM HORARIO */
INSERT INTO HORARIO (HORA_DESDE, HORA_HASTA, DIA) VALUES (8, 16, 1)
INSERT INTO HORARIO (HORA_DESDE, HORA_HASTA, DIA) VALUES (8, 16, 2)
INSERT INTO HORARIO (HORA_DESDE, HORA_HASTA, DIA) VALUES (8, 16, 3)
INSERT INTO HORARIO (HORA_DESDE, HORA_HASTA, DIA) VALUES (8, 16, 4)
INSERT INTO HORARIO (HORA_DESDE, HORA_HASTA, DIA) VALUES (8, 16, 5)
INSERT INTO HORARIO (HORA_DESDE, HORA_HASTA, DIA) VALUES (8, 16, 6)

/* PERSONA ---- SELECT * FROM MEDICO */ 
EXEC SP_AltaMedico  'Socolinsky', 'Mario', '12/07/1942','10231567','mario.soco.doc@clinic.com', '231441','1,2,','1,2,3,4,5,','1234'
EXEC SP_AltaMedico  'Cormillot', 'Alberto ', '31/08/1938','10198762','alberto.cormi.doc@clinic.com', '231441','1,2,','1,2,3,4,5,','1234'

/* PACIENTE ---- SELECT * FROM PACIENTE */ 
EXEC SP_AltaPaciente 'Pepe', 'Argento', '15/08/1960', 16234111, 'pepe@gmail.com', '23213123', 1, 80, '190'
EXEC SP_AltaPaciente 'Moni', 'Argento', '07/01/1970', 16234111, 'moni@gmail.com', '23213123', 1, 80, '180'




