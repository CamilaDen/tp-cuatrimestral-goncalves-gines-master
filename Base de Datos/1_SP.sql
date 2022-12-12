USE Clinica
GO

CREATE PROCEDURE SP_ListarEspecialidades as
SELECT E.ID, E.NOMBRE, E.ACTIVO FROM ESPECIALIDAD E
GO

CREATE PROCEDURE SP_ListarEspecialidadesxId 
@ID INT
AS
SELECT E.ID, E.NOMBRE, E.ACTIVO FROM ESPECIALIDAD E WHERE E.ID = @ID
GO

CREATE PROCEDURE SP_ListarObraSocial AS
SELECT O.ID,O.NOMBRE, O.SIGLA,O.CUIT, O.TELEFONO, O.DIRECCION, O.MAIL, O.ACTIVO FROM OBRASOCIAL O
GO

CREATE PROCEDURE SP_ListarObraSocialxId
    @ID INT
AS
SELECT O.ID,O.NOMBRE, O.SIGLA,O.CUIT, O.TELEFONO, O.DIRECCION, O.MAIL, O.ACTIVO FROM OBRASOCIAL O WHERE O.ID = @ID
GO


CREATE PROCEDURE SP_ListarPerfiles AS
SELECT P.ID, P.NOMBRE, P.ACTIVO FROM PERFIL P
GO

CREATE PROCEDURE SP_ListarPerfilesxId 
@ID INT
AS
SELECT P.ID, P.NOMBRE, P.ACTIVO FROM PERFIL P WHERE P.ID = @ID
GO

CREATE PROCEDURE SP_ListarHorarios AS
SELECT H.ID, H.HORA_DESDE, H.HORA_HASTA, H.DIA, H.ACTIVO FROM HORARIO H
GO

CREATE PROCEDURE SP_ListarHorariosxId
    @ID INT
AS
SELECT H.ID, H.HORA_DESDE, H.HORA_HASTA, H.DIA, H.ACTIVO FROM HORARIO H WHERE H.ID = @ID
GO

CREATE PROCEDURE SP_ListarMedicos AS
SELECT M.ID, M.MATRICULA, M.IDPERSONA, P.ACTIVO, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, '' PASS, '' HORARIOS, '' ESPECIALIDADES 
FROM MEDICO M 
INNER JOIN PERSONA P ON P.ID = M.IDPERSONA
GO

CREATE PROCEDURE SP_ListarMedicosxId 
    @ID INT
AS
SELECT M.ID, M.MATRICULA, M.IDPERSONA, P.ACTIVO, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, ISNULL(U.PASS,'') PASS, 
(SELECT ISNULL(STRING_AGG(MXH.IDHORARIO, ','),'') FROM MEDICO_X_HORARIO MXH WHERE MXH.IDMEDICO = M.ID ) HORARIOS, 
(SELECT ISNULL(STRING_AGG(MXE.IDESPECIALIDAD, ','),'') FROM MEDICO_X_ESPECIALIDAD MXE WHERE MXE.IDMEDICO = M.ID) ESPECIALIDADES
FROM MEDICO M 
INNER JOIN PERSONA P ON P.ID = M.IDPERSONA
INNER JOIN USUARIO U ON U.ID = P.IDUSUARIO
WHERE M.ID = @ID
GROUP BY M.ID, M.MATRICULA, M.IDPERSONA, P.ACTIVO, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, U.PASS
GO

CREATE PROCEDURE SP_ListarMedicosxEspecialidad 
    @ID INT
AS
SELECT M.ID, M.MATRICULA, M.IDPERSONA, P.ACTIVO, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, ISNULL(U.PASS,'') PASS, 
(SELECT ISNULL(STRING_AGG(MXH.IDHORARIO, ','),'') FROM MEDICO_X_HORARIO MXH WHERE MXH.IDMEDICO = M.ID) HORARIOS, 
(SELECT ISNULL(STRING_AGG(MXE.IDESPECIALIDAD, ','),'') FROM MEDICO_X_ESPECIALIDAD MXE WHERE MXE.IDMEDICO = M.ID AND MXE.IDESPECIALIDAD = @ID) ESPECIALIDADES
FROM MEDICO M 
INNER JOIN PERSONA P ON P.ID = M.IDPERSONA
INNER JOIN USUARIO U ON U.ID = P.IDUSUARIO
GROUP BY M.ID, M.MATRICULA, M.IDPERSONA, P.ACTIVO, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, U.PASS
GO

CREATE PROCEDURE SP_ListarPersonal AS
SELECT P.ID, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, P.ACTIVO, U.PASS, PER.ID IDPERFIL, PER.NOMBRE NOMBRE_PERFIL FROM PERSONA P 
INNER JOIN USUARIO U ON U.ID = P.IDUSUARIO 
INNER JOIN PERFIL PER ON PER.ID = U.IDPERFIL 
WHERE P.ID NOT IN (SELECT IDPERSONA FROM MEDICO)
GO


CREATE PROCEDURE SP_ListarPersonalxId 
    @ID INT
AS
SELECT P.ID, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, P.ACTIVO, U.PASS, PER.ID IDPERFIL, PER.NOMBRE NOMBRE_PERFIL FROM PERSONA P 
INNER JOIN USUARIO U ON U.ID = P.IDUSUARIO 
INNER JOIN PERFIL PER ON PER.ID = U.IDPERFIL 
WHERE P.ID = @ID AND P.ID NOT IN (SELECT IDPERSONA FROM MEDICO)
GO

CREATE PROCEDURE SP_ListarPacientes AS
SELECT PAC.ID, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, P.ACTIVO, PAC.IDPERSONA, PAC.PESO, PAC.ALTURA, PAC.CREDENCIAL, PAC.IDOBRASOCIAL, OB.NOMBRE OBRASOCIAL  FROM PACIENTE PAC INNER JOIN PERSONA P ON PAC.IDPERSONA = P.ID INNER JOIN OBRASOCIAL OB ON OB.ID = PAC.IDOBRASOCIAL
GO

CREATE PROCEDURE SP_ListarPacientesxId 
    @ID INT
AS
SELECT PAC.ID, P.APELLIDO, P.NOMBRE, P.FECHA_NACIMIENTO, P.DNI, P.MAIL, P.IDUSUARIO, P.ACTIVO, PAC.IDPERSONA, PAC.PESO, PAC.ALTURA, PAC.CREDENCIAL, PAC.IDOBRASOCIAL, OB.NOMBRE OBRASOCIAL  FROM PACIENTE PAC INNER JOIN PERSONA P ON PAC.IDPERSONA = P.ID INNER JOIN OBRASOCIAL OB ON OB.ID = PAC.IDOBRASOCIAL WHERE PAC.ID = @ID
GO


CREATE PROCEDURE SP_ListarTurno AS
SELECT T.ID, PERPACIENTE.APELLIDO as 'APELLIDOPACIENTE', PERPACIENTE.NOMBRE as 'NOMBREPACIENTE', PERPACIENTE.DNI as 'DNIPACIENTE', PERPACIENTE.MAIL as 'MAILPACIENTE' ,E.NOMBRE as 'ESPECIALIDAD', 
T.FECHA_SOLICITADO, T.FECHA, T.HORA, PERMEDICO.NOMBRE as 'NOMBREMEDICO', PERMEDICO.APELLIDO as 'APELLIDOMEDICO',
T.OBSERVACIONES, TxE.ID as'IDESTADO' , TxE.NOMBRE as'ESTADO', E.ID AS 'IDESPECIALIDAD', P.ID AS 'IDPACIENTE'
FROM TURNO T 
INNER JOIN PACIENTE P ON T.IDPACIENTE = P.ID 
INNER JOIN PERSONA PERPACIENTE ON PERPACIENTE.ID = P.IDPERSONA 
INNER JOIN ESPECIALIDAD E ON T.IDESPECIALIDAD = E.ID
INNER JOIN MEDICO M ON M.ID = T.IDMEDICO 
INNER JOIN PERSONA PERMEDICO ON M.IDPERSONA = PERMEDICO.ID
INNER JOIN TURNO_ESTADO TxE ON TxE.ID = T.ESTADO
GO


CREATE PROCEDURE SP_ListarTurnoxId
	@ID INT 
AS
SELECT T.ID, PERPACIENTE.APELLIDO as 'APELLIDOPACIENTE', PERPACIENTE.NOMBRE as 'NOMBREPACIENTE', PERPACIENTE.DNI as 'DNIPACIENTE', PERPACIENTE.MAIL as 'MAILPACIENTE' ,E.NOMBRE as 'ESPECIALIDAD', 
T.FECHA_SOLICITADO, T.FECHA, T.HORA, PERMEDICO.NOMBRE as 'NOMBREMEDICO', PERMEDICO.APELLIDO as 'APELLIDOMEDICO',
T.OBSERVACIONES, TxE.ID as'IDESTADO' , TxE.NOMBRE as'ESTADO', E.ID AS 'IDESPECIALIDAD', P.ID AS 'IDPACIENTE'
FROM TURNO T 
INNER JOIN PACIENTE P ON T.IDPACIENTE = P.ID 
INNER JOIN PERSONA PERPACIENTE ON PERPACIENTE.ID = P.IDPERSONA 
INNER JOIN ESPECIALIDAD E ON T.IDESPECIALIDAD = E.ID
INNER JOIN MEDICO M ON M.ID = T.IDMEDICO 
INNER JOIN PERSONA PERMEDICO ON M.IDPERSONA = PERMEDICO.ID
INNER JOIN TURNO_ESTADO TxE ON TxE.ID = T.ESTADO
WHERE T.ID = @ID
GO

CREATE PROCEDURE SP_ListarTurnoMedicoxId
	@IDMEDICO INT 
AS
SELECT T.ID, PERPACIENTE.APELLIDO as 'APELLIDOPACIENTE', PERPACIENTE.NOMBRE as 'NOMBREPACIENTE', PERPACIENTE.DNI as 'DNIPACIENTE', PERPACIENTE.MAIL as 'MAILPACIENTE' ,E.NOMBRE as 'ESPECIALIDAD', 
T.FECHA_SOLICITADO, T.FECHA, T.HORA, PERMEDICO.NOMBRE as 'NOMBREMEDICO', PERMEDICO.APELLIDO as 'APELLIDOMEDICO',
T.OBSERVACIONES, TxE.ID as'IDESTADO' , TxE.NOMBRE as'ESTADO', E.ID AS 'IDESPECIALIDAD', P.ID AS 'IDPACIENTE'
FROM TURNO T 
INNER JOIN PACIENTE P ON T.IDPACIENTE = P.ID 
INNER JOIN PERSONA PERPACIENTE ON PERPACIENTE.ID = P.IDPERSONA 
INNER JOIN ESPECIALIDAD E ON T.IDESPECIALIDAD = E.ID
INNER JOIN MEDICO M ON M.ID = T.IDMEDICO 
INNER JOIN PERSONA PERMEDICO ON M.IDPERSONA = PERMEDICO.ID
INNER JOIN TURNO_ESTADO TxE ON TxE.ID = T.ESTADO
WHERE T.IDMEDICO = @IDMEDICO
GO

ALTER PROCEDURE SP_UsuarioMedicoxId
	@IDUSUARIO INT
AS SELECT MED.ID AS 'IDMEDICO' FROM MEDICO MED
INNER JOIN PERSONA P ON P.ID = MED.IDPERSONA
INNER JOIN USUARIO U ON U.ID = P.IDUSUARIO
WHERE U.ID = @IDUSUARIO
GO  ---No devuelve id de medico.

CREATE PROCEDURE SP_ListarEstadoTurno
AS
SELECT TxE.ID , TxE.NOMBRE FROM TURNO_ESTADO TxE
GO

CREATE PROCEDURE SP_ListarEstadoTurnoxId
	@ID INT 
AS
SELECT TxE.ID , TxE.NOMBRE FROM TURNO_ESTADO TxE WHERE TxE.ID = @ID
GO

CREATE PROCEDURE SP_CancelarTurnoxId
	@ID INT 
AS
UPDATE TURNO
	SET ESTADO = 3  
	WHERE ID = @ID
GO


CREATE PROCEDURE SP_AltaObraSocial
    @NOMBRE VARCHAR(50),
    @SIGLA VARCHAR(10),
    @CUIT VARCHAR(20),
    @TELEFONO VARCHAR(20) ,
    @DIRECCION VARCHAR(50),
    @MAIL VARCHAR(50)
AS
INSERT INTO OBRASOCIAL VALUES (@NOMBRE, @SIGLA, @CUIT, @TELEFONO, @DIRECCION, @MAIL, 1)
GO

CREATE PROCEDURE SP_AltaEspecialidad
    @NOMBRE VARCHAR(50)
AS
INSERT INTO ESPECIALIDAD VALUES (@NOMBRE, 1)
GO

CREATE PROCEDURE SP_AltaPerfil
    @NOMBRE VARCHAR(50)
AS
INSERT INTO PERFIL VALUES (@NOMBRE, 1)
GO

CREATE PROCEDURE SP_AltaHorario
    @HORA_DESDE INT,
    @HORA_HASTA INT,
    @DIA INT
AS
INSERT INTO HORARIO VALUES (@HORA_DESDE, @HORA_HASTA, @DIA, 1)
GO


CREATE PROCEDURE SP_ModificarObraSocial
    @ID INT,
    @NOMBRE VARCHAR(50),
    @SIGLA VARCHAR(10),
    @CUIT VARCHAR(20),
    @TELEFONO VARCHAR(20),
    @DIRECCION VARCHAR(50),
    @MAIL VARCHAR(50)
AS
BEGIN
    UPDATE OBRASOCIAL 
        SET NOMBRE =  @NOMBRE, SIGLA = @SIGLA, CUIT = @CUIT, TELEFONO =@TELEFONO, DIRECCION = @DIRECCION, MAIL = @MAIL
    WHERE ID = @ID
END
GO


CREATE PROCEDURE SP_ModificarEspecialidad
    @ID INT,
    @NOMBRE VARCHAR(50)
AS
BEGIN
    UPDATE ESPECIALIDAD 
        SET NOMBRE =  @NOMBRE
    WHERE ID = @ID
END
GO


CREATE PROCEDURE SP_ModificarPerfil
    @ID INT,
    @NOMBRE VARCHAR(50)
AS
BEGIN
    UPDATE PERFIL 
        SET NOMBRE =  @NOMBRE
    WHERE ID = @ID
END
GO

CREATE PROCEDURE SP_ModificarHorario
    @ID INT,
    @HORA_DESDE INT,
    @HORA_HASTA INT,
    @DIA INT
AS
BEGIN
    UPDATE HORARIO 
        SET HORA_DESDE =  @HORA_DESDE, HORA_HASTA = @HORA_HASTA, DIA = @DIA
    WHERE ID = @ID
END
GO

CREATE PROCEDURE SP_EliminarLogicoObraSocial
    @ID INT
AS UPDATE OBRASOCIAL SET ACTIVO = 0 WHERE ID = @ID
GO

CREATE PROCEDURE SP_ReactivarLogicoObraSocial
    @ID INT
AS UPDATE OBRASOCIAL SET ACTIVO = 1 WHERE ID = @ID
GO

CREATE PROCEDURE SP_EliminarLogicoEspecialidad
    @ID INT
AS UPDATE ESPECIALIDAD SET ACTIVO = 0 WHERE ID = @ID
GO

CREATE PROCEDURE SP_ReactivarLogicoEspecialidad
    @ID INT
AS UPDATE ESPECIALIDAD SET ACTIVO = 1 WHERE ID = @ID
GO

CREATE PROCEDURE SP_EliminarLogicoPerfil
    @ID INT
AS UPDATE PERFIL SET ACTIVO = 0 WHERE ID = @ID
GO

CREATE PROCEDURE SP_ReactivarLogicoPerfil
    @ID INT
AS UPDATE PERFIL SET ACTIVO = 1 WHERE ID = @ID
GO

CREATE PROCEDURE SP_EliminarLogicoHorario
    @ID INT
AS UPDATE HORARIO SET ACTIVO = 0 WHERE ID = @ID
GO

CREATE PROCEDURE SP_ReactivarLogicoHorario
    @ID INT
AS UPDATE HORARIO SET ACTIVO = 1 WHERE ID = @ID
GO

CREATE PROCEDURE SP_AltaPersonal
    @APELLIDO VARCHAR(50),
    @NOMBRE VARCHAR(50),
	@FECHA_NACIMIENTO SMALLDATETIME,
    @DNI INT,	
    @MAIL VARCHAR(50),
    @PASS VARCHAR(50),
    @IDPERFIL INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE @LastIdentity int;
            INSERT INTO USUARIO (PASS, IDPERFIL) VALUES (@PASS, @IDPERFIL)
            SET @LastIdentity = scope_identity()
            INSERT INTO PERSONA VALUES (@APELLIDO, @NOMBRE, @FECHA_NACIMIENTO, @DNI, @MAIL, @LastIdentity, 1)
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('NO SE PUDO DAR DE ALTA EL PERSONAL', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE SP_ModificarPersonal
    @ID INT,
    @APELLIDO VARCHAR(50),
    @NOMBRE VARCHAR(50),
    @DNI INT,
	@FECHA_NACIMIENTO SMALLDATETIME,
    @MAIL VARCHAR(50),
    @PASS VARCHAR(50),
    @IDPERFIL INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE @IDUSUARIO INT
            SELECT @IDUSUARIO = ISNULL(IDUSUARIO,-1) FROM PERSONA WHERE ID = @ID
            IF(@IDUSUARIO>-1) BEGIN
                UPDATE USUARIO SET PASS = @PASS, IDPERFIL = @IDPERFIL WHERE ID = @IDUSUARIO
                UPDATE PERSONA SET APELLIDO =  @APELLIDO, NOMBRE = @NOMBRE, DNI = @DNI, FECHA_NACIMIENTO = @FECHA_NACIMIENTO, MAIL = @MAIL WHERE ID = @ID
            END
            ELSE BEGIN
                ROLLBACK TRANSACTION
            END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('NO SE PUDO MODIFICAR EL PERSONAL', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE SP_AltaPaciente
    @APELLIDO VARCHAR(50),
    @NOMBRE VARCHAR(50),
	@FECHA_NACIMIENTO SMALLDATETIME,
    @DNI INT,	
    @MAIL VARCHAR(50),
    @CREDENCIAL VARCHAR(50),
    @IDOBRASOCIAL INT,
    @PESO DECIMAL,
    @ALTURA DECIMAL
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE @LastIdentity int;
            INSERT INTO PERSONA (APELLIDO, NOMBRE, FECHA_NACIMIENTO, DNI, MAIL) VALUES (@APELLIDO, @NOMBRE, @FECHA_NACIMIENTO, @DNI, @MAIL)
            SET @LastIdentity = scope_identity()
            INSERT INTO PACIENTE (PESO, ALTURA, CREDENCIAL, IDPERSONA, IDOBRASOCIAL) VALUES (@PESO, @ALTURA, @CREDENCIAL, @LastIdentity, @IDOBRASOCIAL)
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('NO SE PUDO DAR DE ALTA EL PACIENTE', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE SP_ModificarPaciente
    @ID INT,
    @APELLIDO VARCHAR(50),
    @NOMBRE VARCHAR(50),
	@FECHA_NACIMIENTO SMALLDATETIME,
    @DNI INT,	
    @MAIL VARCHAR(50),
    @CREDENCIAL VARCHAR(50),
    @IDOBRASOCIAL INT,
    @PESO DECIMAL,
    @ALTURA DECIMAL
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE @IDPERSONA INT
            SELECT @IDPERSONA = ISNULL(IDPERSONA,-1) FROM PACIENTE WHERE ID = @ID
            IF(@IDPERSONA>-1) BEGIN
                UPDATE PACIENTE SET CREDENCIAL = @CREDENCIAL, IDOBRASOCIAL = @IDOBRASOCIAL, PESO = @PESO, ALTURA = @ALTURA WHERE ID = @ID
                UPDATE PERSONA SET APELLIDO =  @APELLIDO, NOMBRE = @NOMBRE, DNI = @DNI, FECHA_NACIMIENTO = @FECHA_NACIMIENTO, MAIL = @MAIL WHERE ID = @IDPERSONA
            END
            ELSE BEGIN
                ROLLBACK TRANSACTION
            END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('NO SE PUDO MODIFICAR EL PACIENTE', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE SP_ReactivarLogicoPersonal
    @ID INT
AS UPDATE PERSONA SET ACTIVO = 1 WHERE ID = @ID
GO
CREATE PROCEDURE SP_EliminarLogicoPersonal
    @ID INT
AS UPDATE PERSONA SET ACTIVO = 0 WHERE ID = @ID
GO

CREATE PROCEDURE SP_ReactivarLogicoPaciente 
    @ID INT
AS UPDATE PERSONA SET ACTIVO = 1 WHERE ID = (SELECT IDPERSONA FROM PACIENTE WHERE ID = @ID)
GO
CREATE PROCEDURE SP_EliminarLogicoPaciente
    @ID INT
AS UPDATE PERSONA SET ACTIVO = 0 WHERE ID = (SELECT IDPERSONA FROM PACIENTE WHERE ID = @ID)
GO

CREATE PROCEDURE SP_ReactivarLogicoMedico
    @ID INT
AS UPDATE PERSONA SET ACTIVO = 1 WHERE ID = (SELECT IDPERSONA FROM MEDICO WHERE ID = @ID)
GO
CREATE PROCEDURE SP_EliminarLogicoMedico
    @ID INT
AS UPDATE PERSONA SET ACTIVO = 0 WHERE ID = (SELECT IDPERSONA FROM MEDICO WHERE ID = @ID)
GO


CREATE PROCEDURE AgregarHorariosMedicos
    @ID INT,
    @HORARIOS VARCHAR(1000)
AS
    BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            SET NOCOUNT ON
            --El separador de nuestros parametros sera una ,
            DECLARE @Posicion int
            --@Posicion es la posicion de cada uno de nuestros separadores
            DECLARE @Parametro varchar(1000)
            --Borro los horarios de ese médico
            DELETE MEDICO_X_HORARIO WHERE IDMEDICO = @ID
            WHILE patindex('%,%' , @HORARIOS) <> 0
            --patindex busca un patron en una cadena y nos devuelve su posicion
            BEGIN
            SELECT @Posicion =  patindex('%,%' , @HORARIOS)
            --Buscamos la posicion de la primera ,
            SELECT @Parametro = left(@HORARIOS, @Posicion - 1)
            --Y guardamos los caracteres hasta esa posicion
            INSERT INTO MEDICO_X_HORARIO (IDMEDICO, IDHORARIO) VALUES (@ID, @Parametro)
            --Reemplazamos lo procesado con nada con la funcion stuff
            SELECT @HORARIOS = stuff(@HORARIOS, 1, @Posicion, '')
            END
            SET NOCOUNT OFF
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('No se pudo agregar los horarios al médico', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE AgregarEspecialidadesMedicos
    @ID INT,
    @ESPECIALIDADES VARCHAR(1000)
AS
    BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            SET NOCOUNT ON
            --El separador de nuestros parametros sera una ,
            DECLARE @Posicion int
            --@Posicion es la posicion de cada uno de nuestros separadores
            DECLARE @Parametro varchar(1000)
            --Borro las especialidades de ese médico
            DELETE MEDICO_X_ESPECIALIDAD WHERE IDMEDICO = @ID
            WHILE patindex('%,%' , @ESPECIALIDADES) <> 0
            --patindex busca un patron en una cadena y nos devuelve su posicion
            BEGIN
            SELECT @Posicion =  patindex('%,%' , @ESPECIALIDADES)
            --Buscamos la posicion de la primera ,
            SELECT @Parametro = left(@ESPECIALIDADES, @Posicion - 1)
            --Y guardamos los caracteres hasta esa posicion
            INSERT INTO MEDICO_X_ESPECIALIDAD (IDMEDICO, IDESPECIALIDAD) VALUES (@ID, @Parametro)
            --Reemplazamos lo procesado con nada con la funcion stuff
            SELECT @ESPECIALIDADES = stuff(@ESPECIALIDADES, 1, @Posicion, '')
            END
            SET NOCOUNT OFF
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('No se pudo agregar la especialidad al médico', 16, 1)
    END CATCH
END
GO


CREATE PROCEDURE SP_AltaMedico
    @APELLIDO VARCHAR(50),
    @NOMBRE VARCHAR(50),
	@FECHA_NACIMIENTO SMALLDATETIME,
    @DNI INT,	
    @MAIL VARCHAR(50),
    @MATRICULA VARCHAR(50),
    @HORARIOS VARCHAR(1000),
    @ESPECIALIDADES VARCHAR(1000),
    @PASS VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE @LastIdentity int;
            DECLARE @IdPerfil int;
            SELECT TOP 1 @IdPerfil = ID FROM PERFIL WHERE NOMBRE IN ('Médico', 'Medico')            
            INSERT INTO USUARIO (PASS, IDPERFIL) VALUES (@PASS, ISNULL(@IDPERFIL,2))
            SET @LastIdentity = scope_identity()
            INSERT INTO PERSONA (APELLIDO, NOMBRE, FECHA_NACIMIENTO, DNI, MAIL, IDUSUARIO) VALUES (@APELLIDO, @NOMBRE, @FECHA_NACIMIENTO, @DNI, @MAIL, @LastIdentity)
            SET @LastIdentity = scope_identity()
            INSERT INTO MEDICO (IDPERSONA, MATRICULA) VALUES (@LastIdentity, @MATRICULA)
            SET @LastIdentity = scope_identity()
            IF (@HORARIOS IS NOT NULL) BEGIN
                    EXEC AgregarHorariosMedicos @LastIdentity, @HORARIOS
            END    
            IF (@ESPECIALIDADES IS NOT NULL) BEGIN
                EXEC AgregarEspecialidadesMedicos @LastIdentity, @ESPECIALIDADES
            END        
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('NO SE PUDO DAR DE ALTA EL MEDICO', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE SP_ModificarMedico
    @ID INT, 
    @APELLIDO VARCHAR(50),
    @NOMBRE VARCHAR(50),
	@FECHA_NACIMIENTO SMALLDATETIME,
    @DNI INT,	
    @MAIL VARCHAR(50),
    @MATRICULA VARCHAR(50),
    @HORARIOS VARCHAR(1000),
    @ESPECIALIDADES VARCHAR(1000),
    @PASS VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE @IDPERSONA INT
            DECLARE @IDUSUARIO INT
            SELECT @IDPERSONA = ISNULL(IDPERSONA,-1) FROM MEDICO WHERE ID = @ID
            IF(@IDPERSONA>-1) BEGIN
                UPDATE MEDICO SET MATRICULA = @MATRICULA WHERE ID = @ID
                UPDATE PERSONA SET APELLIDO =  @APELLIDO, NOMBRE = @NOMBRE, DNI = @DNI, FECHA_NACIMIENTO = @FECHA_NACIMIENTO, MAIL = @MAIL WHERE ID = @IDPERSONA
                SELECT @IDUSUARIO = IDUSUARIO FROM PERSONA WHERE ID = @IDPERSONA
                UPDATE USUARIO SET PASS = @PASS WHERE ID = @IDUSUARIO
                IF (@HORARIOS IS NOT NULL) BEGIN
                    EXEC AgregarHorariosMedicos @ID, @HORARIOS
                END    
                IF (@ESPECIALIDADES IS NOT NULL) BEGIN
                    EXEC AgregarEspecialidadesMedicos @ID, @ESPECIALIDADES
                END                
            END
            ELSE BEGIN
                ROLLBACK TRANSACTION
            END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        RAISERROR('No se pudo modificar el médico', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE SP_AltaTurno
    @IDPACIENTE INT,
    @IDESPECIALIDAD INT,
	@FECHA_SOLICITADO SMALLDATETIME,
    @FECHA SMALLDATETIME,	
    @HORA INT,
    @IDMEDICO INT,
    @OBSERVACIONES VARCHAR(250)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO TURNO (IDPACIENTE, IDESPECIALIDAD, FECHA_SOLICITADO, FECHA, HORA, IDMEDICO, OBSERVACIONES, ESTADO) VALUES (@IDPACIENTE, @IDESPECIALIDAD, @FECHA_SOLICITADO, @FECHA, @HORA,@IDMEDICO, @OBSERVACIONES, 1)       
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('NO SE PUDO DAR DE ALTA EL TURNO', 16, 1)
    END CATCH
END
GO


CREATE PROCEDURE SP_CambiarPass
    @ID INT,
    @NUEVAPASS VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            UPDATE USUARIO SET PASS = @NUEVAPASS WHERE ID = @ID
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('NO SE PUDO MODIFICAR LA PASSWORD', 16, 1)
    END CATCH
END
GO

CREATE PROCEDURE SP_Loguear 
    @MAIL VARCHAR(50),
    @PASS VARCHAR(50)
AS
    SELECT U.ID, U.IDPERFIL, PER.NOMBRE PERFIL, P.APELLIDO, P.NOMBRE, P.DNI FROM USUARIO U INNER JOIN PERSONA P ON P.IDUSUARIO = U.ID INNER JOIN PERFIL PER ON PER.ID = U.IDPERFIL WHERE P.MAIL = @MAIL AND U.PASS = @PASS
GO

CREATE PROCEDURE SP_BuscarUsuarioXMail 
    @MAIL VARCHAR(50)
AS
    SELECT U.ID, U.IDPERFIL, PER.NOMBRE, P.APELLIDO, P.NOMBRE, P.DNI FROM USUARIO U INNER JOIN PERSONA P ON P.IDUSUARIO = U.ID INNER JOIN PERFIL PER ON PER.ID = U.IDPERFIL WHERE P.MAIL = @MAIL
GO


CREATE PROCEDURE SP_ModificarTurnoObsEstado
    @ID INT,
    @OBSERVACIONES VARCHAR(250),
    @ESTADO INT
AS
BEGIN
    UPDATE TURNO 
        SET OBSERVACIONES =  @OBSERVACIONES, ESTADO = @ESTADO
    WHERE ID = @ID
END
GO

CREATE PROCEDURE SP_ReagendarTurno
    @ID INT,
    @IDPACIENTE INT,
    @IDESPECIALIDAD INT,
    @FECHA SMALLDATETIME,	
    @HORA INT,
    @IDMEDICO INT,
    @OBSERVACIONES VARCHAR(250)
AS
BEGIN
    UPDATE TURNO 
        SET OBSERVACIONES =  @OBSERVACIONES, IDPACIENTE = @IDPACIENTE, IDESPECIALIDAD = @IDESPECIALIDAD, FECHA = @FECHA, HORA = @HORA, IDMEDICO = @IDMEDICO, ESTADO = 4
    WHERE ID = @ID
END
GO

CREATE PROCEDURE SP_HorariosDisponibles
    @IDPACIENTE INT,
    @IDESPECIALIDAD INT,
    @DIA SMALLDATETIME
AS
BEGIN 
    -- Para el manejo de las fechas y los días de la semana, que se empieza a contar desde el lunes (el default es desde el domingo)
    SET DATEFORMAT dmy;
    SET DATEFIRST 1;
    -- Genero la plantilla de la base que quiero retornar para conocer los horarios disponibles de los médicos para ese día y esa especialidad.
    IF (OBJECT_ID('tempdb.Clinica.#TurnosDisponibles','U')) IS NOT NULL
        DROP TABLE #TurnosDisponibles
    SELECT MED.ID IDMEDICO, PER.APELLIDO, PER.NOMBRE, MXE.IDESPECIALIDAD, ESP.NOMBRE AS ESPECIALIDAD, TUR.FECHA, TUR.HORA  
    INTO #TurnosDisponibles
    FROM MEDICO MED 
            INNER JOIN PERSONA PER ON PER.ID = MED.IDPERSONA
            INNER JOIN TURNO TUR ON TUR.IDMEDICO = MED.ID
            INNER JOIN MEDICO_X_ESPECIALIDAD MXE ON MXE.IDMEDICO = MED.ID
            INNER JOIN ESPECIALIDAD ESP ON ESP.ID = MXE.IDESPECIALIDAD
            WHERE 1 = 2
    -- Genero base de horarios de trabajo de los médicos según especialidad y día.
    IF (OBJECT_ID('tempdb.Clinica.#BaseHorariosMedicos','U')) IS NOT NULL
        DROP TABLE #BaseHorariosMedicos
            SELECT DISTINCT MED.ID IDMEDICO, PER.APELLIDO, PER.NOMBRE, MXE.IDESPECIALIDAD, ESP.NOMBRE AS ESPECIALIDAD, HORA_DESDE, HORA_HASTA 
            INTO #BaseHorariosMedicos
            FROM MEDICO MED 
            INNER JOIN MEDICO_X_ESPECIALIDAD MXE ON MXE.IDMEDICO = MED.ID
            INNER JOIN ESPECIALIDAD ESP ON ESP.ID = MXE.IDESPECIALIDAD
            INNER JOIN PERSONA PER ON PER.ID = MED.IDPERSONA
            INNER JOIN MEDICO_X_HORARIO MXH ON MXH.IDMEDICO = MED.ID
            INNER JOIN HORARIO HOR ON HOR.ID = MXH.IDHORARIO
            WHERE PER.ACTIVO = 1 AND ESP.ACTIVO = 1 AND ESP.ID = @IDESPECIALIDAD
            AND HOR.DIA = DATEPART(weekday, @DIA)
    -- Comienzo a poblar la base de turnos de acuerdo al horario desde y hasta disponibles
    DECLARE @HORA_DESDE INT
    DECLARE @HORA_HASTA INT
    DECLARE @FECHA SMALLDATETIME
    SELECT @HORA_DESDE = HORA_DESDE, @HORA_HASTA = HORA_HASTA FROM #BaseHorariosMedicos    
    WHILE ( @HORA_DESDE < @HORA_HASTA)
        BEGIN
            INSERT INTO #TurnosDisponibles (IDMEDICO, APELLIDO, NOMBRE, IDESPECIALIDAD, ESPECIALIDAD, FECHA, HORA )
                SELECT IDMEDICO, APELLIDO, NOMBRE, IDESPECIALIDAD, ESPECIALIDAD, @DIA, @HORA_DESDE FROM #BaseHorariosMedicos
            SET @HORA_DESDE = @HORA_DESDE + 1;
        END
    -- Devuelvo la información de turnos disponibles quitándole los turnos que ya están tomados 
    SELECT TOP 5 ROW_NUMBER() OVER(ORDER BY DISPONIBLE.FECHA ASC, DISPONIBLE.HORA ASC) AS ID, DISPONIBLE.* 
    FROM #TurnosDisponibles DISPONIBLE
    LEFT JOIN TURNO MEDICO_OCUPADO ON MEDICO_OCUPADO.IDMEDICO = DISPONIBLE.IDMEDICO 
                    AND CONVERT(VARCHAR(10), MEDICO_OCUPADO.FECHA, 105) = CONVERT(VARCHAR(10), DISPONIBLE.FECHA , 105) 
                    AND MEDICO_OCUPADO.HORA = DISPONIBLE.HORA
    LEFT JOIN TURNO PACIENTE_OCUPADO 
                    ON CONVERT(VARCHAR(10), PACIENTE_OCUPADO.FECHA, 105) = CONVERT(VARCHAR(10), DISPONIBLE.FECHA , 105) 
                    AND PACIENTE_OCUPADO.HORA = DISPONIBLE.HORA
                    AND PACIENTE_OCUPADO.IDPACIENTE = @IDPACIENTE                    
    WHERE MEDICO_OCUPADO.ID IS NULL AND PACIENTE_OCUPADO.ID IS NULL
    
END

GO

CREATE PROCEDURE SP_CargaDDLFecha
	@IDESPECIALIDAD INT,
    @IDMEDICO INT,
    @IDPACIENTE INT,
    @DIA SMALLDATETIME
AS
BEGIN 
    -- Para el manejo de las fechas y los días de la semana, que se empieza a contar desde el lunes (el default es desde el domingo)
    SET DATEFORMAT dmy;
    SET DATEFIRST 1;
    -- Genero la plantilla de la base que quiero retornar para conocer los horarios disponibles de los médicos para ese día y esa especialidad.
    IF (OBJECT_ID('tempdb.Clinica.#TurnosDisponibles','U')) IS NOT NULL
        DROP TABLE #TurnosDisponibles
    SELECT MED.ID IDMEDICO, PER.APELLIDO, PER.NOMBRE, MXE.IDESPECIALIDAD, ESP.NOMBRE AS ESPECIALIDAD, TUR.FECHA, TUR.HORA  
    INTO #TurnosDisponibles
    FROM MEDICO MED 
            INNER JOIN PERSONA PER ON PER.ID = MED.IDPERSONA
            INNER JOIN TURNO TUR ON TUR.IDMEDICO = MED.ID
            INNER JOIN MEDICO_X_ESPECIALIDAD MXE ON MXE.IDMEDICO = MED.ID
            INNER JOIN ESPECIALIDAD ESP ON ESP.ID = MXE.IDESPECIALIDAD
            WHERE 1 = 2
    -- Genero base de horarios de trabajo de los médicos según especialidad y día.
    IF (OBJECT_ID('tempdb.Clinica.#BaseHorariosMedicos','U')) IS NOT NULL
        DROP TABLE #BaseHorariosMedicos
            SELECT DISTINCT MED.ID IDMEDICO, PER.APELLIDO, PER.NOMBRE, MXE.IDESPECIALIDAD, ESP.NOMBRE AS ESPECIALIDAD, HORA_DESDE, HORA_HASTA 
            INTO #BaseHorariosMedicos
            FROM MEDICO MED 
            INNER JOIN MEDICO_X_ESPECIALIDAD MXE ON MXE.IDMEDICO = MED.ID
            INNER JOIN ESPECIALIDAD ESP ON ESP.ID = MXE.IDESPECIALIDAD
            INNER JOIN PERSONA PER ON PER.ID = MED.IDPERSONA
            INNER JOIN MEDICO_X_HORARIO MXH ON MXH.IDMEDICO = MED.ID
            INNER JOIN HORARIO HOR ON HOR.ID = MXH.IDHORARIO
            WHERE PER.ACTIVO = 1 AND ESP.ACTIVO = 1 AND ESP.ID = @IDESPECIALIDAD
            AND HOR.DIA = DATEPART(weekday, @DIA)
            AND MED.ID = @IDMEDICO
    -- Comienzo a poblar la base de turnos de acuerdo al horario desde y hasta disponibles
    DECLARE @HORA_DESDE INT
    DECLARE @HORA_HASTA INT
    DECLARE @FECHA SMALLDATETIME
    SELECT @HORA_DESDE = HORA_DESDE, @HORA_HASTA = HORA_HASTA FROM #BaseHorariosMedicos    
    WHILE ( @HORA_DESDE < @HORA_HASTA)
        BEGIN
            INSERT INTO #TurnosDisponibles (IDMEDICO, APELLIDO, NOMBRE, IDESPECIALIDAD, ESPECIALIDAD, FECHA, HORA )
                SELECT IDMEDICO, APELLIDO, NOMBRE, IDESPECIALIDAD, ESPECIALIDAD, @DIA, @HORA_DESDE FROM #BaseHorariosMedicos
            SET @HORA_DESDE = @HORA_DESDE + 1;
        END
    -- Devuelvo la información de turnos disponibles quitándole los turnos que ya están tomados 
    SELECT DISPONIBLE.* 
    FROM #TurnosDisponibles DISPONIBLE
    LEFT JOIN TURNO MEDICO_OCUPADO ON MEDICO_OCUPADO.IDMEDICO = DISPONIBLE.IDMEDICO 
                    AND CONVERT(VARCHAR(10), MEDICO_OCUPADO.FECHA, 105) = CONVERT(VARCHAR(10), DISPONIBLE.FECHA , 105) 
                    AND MEDICO_OCUPADO.HORA = DISPONIBLE.HORA
    LEFT JOIN TURNO PACIENTE_OCUPADO 
                    ON CONVERT(VARCHAR(10), PACIENTE_OCUPADO.FECHA, 105) = CONVERT(VARCHAR(10), DISPONIBLE.FECHA , 105) 
                    AND PACIENTE_OCUPADO.HORA = DISPONIBLE.HORA
                    AND PACIENTE_OCUPADO.IDPACIENTE = @IDPACIENTE                    
    WHERE MEDICO_OCUPADO.ID IS NULL AND PACIENTE_OCUPADO.ID IS NULL    
END
GO

CREATE PROCEDURE SP_BuscarMedicoPorId
    @ID INT
AS
BEGIN 
    SELECT MED.ID AS 'IDMEDICO' FROM MEDICO MED 
        INNER JOIN PERSONA PER ON PER.ID = MED.IDPERSONA
        INNER JOIN USUARIO USU ON USU.ID = PER.IDUSUARIO
        WHERE USU.ID = @ID
END
GO
