--- Creacion base de datos Clinica PO3

USE master

CREATE DATABASE Clinica_Medica
GO

USE Clinica_Medica

CREATE TABLE ADMINISTRADORES (
Nombre_A CHAR(40) NOT NULL,
Apellido_A CHAR(40) NOT NULL,
ID_Administrador CHAR(5) NOT NULL,
Usuario_A CHAR(40) NOT NULL,
Contrasenia_A VARCHAR(30) NOT NULL,

CONSTRAINT PK_ADMINISTRADORES PRIMARY KEY (ID_Administrador)
)
GO

CREATE TABLE MEDICOS(
Nro_Legajo_M CHAR(5) NOT NULL,
Dni_M CHAR(9) NOT NULL,
Nombre_M CHAR(40) NOT NULL,
Apellido_M CHAR(40) NOT NULL,
Sexo_M CHAR(10) NOT NULL,
Nacionalidad_M CHAR(40) NOT NULL,
Fecha_Nacimiento_M DATE NOT NULL,
Direccion_M CHAR(40) NOT NULL,
Id_Localidad_M CHAR(5) NOT NULL,
Correo_Electronico_M CHAR(40) NOT NULL,
Telefono_M CHAR(20) NOT NULL,
Id_Especialidad_M CHAR(4) NOT NULL,
Usuario_M CHAR(40) NOT NULL,
Contrasenia_M VARCHAR(30) NOT NULL,
Estado_M BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_MEDICOS PRIMARY KEY (Nro_Legajo_M)
)
GO

CREATE TABLE PACIENTES(
Dni_Paciente CHAR(9) NOT NULL,
Nombre_P CHAR(40) NOT NULL,
Apellido_P CHAR(40) NOT NULL,
Sexo_P CHAR(10) NOT NULL,
Fecha_Nacimiento_P DATE NOT NULL,
Direccion_P CHAR(40) NOT NULL,
Nacionalidad_P CHAR(40) NOT NULL,
Id_Localidad_P CHAR(5) NOT NULL,
Correo_Electronico_P CHAR(40) NOT NULL,
Telefono_P CHAR(20) NOT NULL,
Estado_P BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_PACIENTES PRIMARY KEY (Dni_Paciente)
)
GO

CREATE TABLE ESPECIALIDADES(
ID_Especialidad CHAR(4) NOT NULL,
Descripcion_E CHAR(30) NOT NULL,

CONSTRAINT PK_ESPECIALIDADES PRIMARY KEY (ID_Especialidad)
)
GO

CREATE TABLE HORARIO_MEDICOS(
Nro_Legajo_HM CHAR(5) NOT NULL,
Id_Dia_HM CHAR(1) NOT NULL CHECK(Id_Dia_HM IN ('1', '2', '3', '4', '5', '6', '7')),
HorarioInicio_HM TIME NOT NULL,
HorarioFinal_HM TIME NOT NULL,

CONSTRAINT PK_HORARIOS_MEDICOS PRIMARY KEY (Nro_Legajo_HM, Id_Dia_HM)
)
GO

CREATE TABLE TURNOS(
Id_Turno CHAR(7) NOT NULL,
Nro_Legajo_T CHAR(5) NOT NULL,
Dni_Paciente_T CHAR(9) NOT NULL,
Fecha_T DATE NOT NULL,
HORA_T TIME NOT NULL, 
Asistencia_T CHAR(20) NOT NULL,
Observaciones CHAR(1000) NOT NULL,
Estado BIT NOT NULL,

CONSTRAINT PK_TURNOS PRIMARY KEY(Id_Turno)
)
GO

CREATE TABLE PROVINCIAS(
Id_Provincia CHAR(3) NOT NULL,
Descripcion_P CHAR(30) NOT NULL

CONSTRAINT PK_PROVINCIAS PRIMARY KEY(Id_Provincia)
)
GO

CREATE TABLE LOCALIDADES(
Id_Localidad CHAR(5) NOT NULL,
Id_Provincia_L CHAR(3) NOT NULL,
Descripcion_L CHAR(30) NOT NULL,

CONSTRAINT PK_LOCALIDADES PRIMARY KEY (Id_Localidad)
)
GO

ALTER TABLE TURNOS ADD CONSTRAINT FK_TURNOS_MEDICOS FOREIGN KEY (Nro_Legajo_T) REFERENCES MEDICOS (Nro_Legajo_M)

ALTER TABLE TURNOS ADD CONSTRAINT FK_TURNOS_PACIENTES FOREIGN KEY(Dni_Paciente_T) REFERENCES PACIENTES (Dni_Paciente)

ALTER TABLE MEDICOS ADD CONSTRAINT FK_MEDICOS_ESPECIALIDADES FOREIGN KEY(Id_Especialidad_M) REFERENCES ESPECIALIDADES (ID_Especialidad)

ALTER TABLE MEDICOS ADD CONSTRAINT FK_MEDICOS_LOCALIDADES FOREIGN KEY (Id_Localidad_M) REFERENCES LOCALIDADES (Id_Localidad)

ALTER TABLE HORARIO_MEDICOS ADD CONSTRAINT FK_HORARIO_MEDICOS_MEDICOS FOREIGN KEY (Nro_Legajo_HM) REFERENCES MEDICOS (Nro_Legajo_M)

ALTER TABLE LOCALIDADES ADD CONSTRAINT FK_LOCALIDADES_PROVINCIAS FOREIGN KEY (Id_Provincia_L) REFERENCES PROVINCIAS (Id_Provincia)

ALTER TABLE PACIENTES ADD CONSTRAINT FK_PACIENTES_LOCALIDADES FOREIGN KEY (Id_Localidad_P) REFERENCES LOCALIDADES (Id_Localidad)

GO

INSERT INTO ADMINISTRADORES (ID_Administrador, Nombre_A, Apellido_A, Usuario_A, Contrasenia_A)
VALUES ('A0001', 'Juan', 'Pérez', 'admin', 'admin123');

GO

--INSERT ESPECIALIDAD
INSERT INTO dbo.ESPECIALIDADES (ID_Especialidad, Descripcion_E)
VALUES 
('E001', 'Cardiología'),
('E002', 'Pediatría'),
('E003', 'Dermatología');

GO
--INSERT PROVINCIA
INSERT INTO dbo.PROVINCIAS (Id_Provincia, Descripcion_P)
VALUES
('P01', 'Buenos Aires'),
('P02', 'Córdoba'),
('P03', 'Santa Fe');

GO
--INSERT LOCALIDAD
INSERT INTO dbo.LOCALIDADES (Id_Localidad, Id_Provincia_L, Descripcion_L)
VALUES
('L0001', 'P01', 'La Plata'),
('L0002', 'P02', 'Villa Carlos Paz'),
('L0003', 'P03', 'Rosario');

GO
--INSERT MEDICO
INSERT INTO dbo.MEDICOS (
    Nro_Legajo_M,
    Dni_M,
    Nombre_M,
    Apellido_M,
    Sexo_M,
    Nacionalidad_M,
    Fecha_Nacimiento_M,
    Direccion_M,
    Id_Localidad_M,
    Correo_Electronico_M,
    Telefono_M,
    Id_Especialidad_M,
    Usuario_M,
    Contrasenia_M,
    Estado_M
)
VALUES (
    'M0001',                -- Nro_Legajo_M
    '37564218',             -- Dni_M
    'María',                -- Nombre_M
    'Gómez',                -- Apellido_M
    'Femenino',             -- Sexo_M
    'Argentina',            -- Nacionalidad_M
    '1988-04-22',           -- Fecha_Nacimiento_M
    'Calle San Martín 123', -- Direccion_M
    'L0001',                -- Id_Localidad_M (La Plata - Buenos Aires)
    'maria.gomez@clinica.com', -- Correo_Electronico_M
    '1145892365',           -- Telefono_M
     'E001',                     -- Id_Especialidad_M (Cardiología)
    'mgomez',               -- Usuario_M
    'clave123',             -- Contrasenia_M
     1                      -- Estado_M (activo)
),
(
    'M0002',                -- Nro_Legajo_M
    '41702776',             -- Dni_M
    'Alejo',                -- Nombre_M
    'Fernández de la Torre',                -- Apellido_M
    'Masculino',             -- Sexo_M
    'Argentina',            -- Nacionalidad_M
    '1998-12-31',           -- Fecha_Nacimiento_M
    'Calle Muy Extraña 777', -- Direccion_M
    'L0001',                -- Id_Localidad_M (La Plata - Buenos Aires)
    'torrefernandez@yahoo.com', -- Correo_Electronico_M
    '1176542341',           -- Telefono_M
    'E002',                     -- Id_Especialidad_M (Cardiología)
    'alejox',               -- Usuario_M
    '77778888',             -- Contrasenia_M
     1                      -- Estado_M (activo)
);

GO
--INSERT PACIENTE
INSERT INTO dbo.PACIENTES (
    Dni_Paciente,
    Nombre_P,
    Apellido_P,
    Sexo_P,
    Fecha_Nacimiento_P,
    Direccion_P,
    Nacionalidad_P,
    Id_Localidad_P,
    Correo_Electronico_P,
    Telefono_P,
    Estado_P
)
VALUES (
    '52813887',                     -- Dni_Paciente
    'Rigoberto',                    -- Nombre_P
    'Molinetes',                    -- Apellido_P
    'Masculino',                    -- Sexo_P
    '1991-07-23',                   -- Fecha_Nacimiento_P
    'Calle Gran Solar 475',         -- Direccion_P
    'Chile',                        -- Nacionalidad_P
    'L0002',                        -- Id_Localidad_P (Villa Carlos Paz - Córdoba)
    'molinetes_roberto@gmail.com',  -- Correo_Electronico_P
    '1144446666',                   -- Telefono_P
    1                               -- Estado_P
),
(
    '32813887',                     -- Dni_Paciente
    'Mariano',                      -- Nombre_P
    'Rodríguez',                    -- Apellido_P
    'Masculino',                    -- Sexo_P
    '1987-04-21',                   -- Fecha_Nacimiento_P
    'Calle San Nicolás 327',        -- Direccion_P
    'Argentina',                    -- Nacionalidad_P
    'L0001',                        -- Id_Localidad_P (La Plata - Buenos Aires)
    'marian1987@hotmail.com',       -- Correo_Electronico_P
    '1133337777',                   -- Telefono_P
    1                               -- Estado_P
),
(
    '41462624',                     -- Dni_Paciente
    'Ángela',                       -- Nombre_P
    'Modera',                       -- Apellido_P
    'Femenino',                     -- Sexo_P
    '2002-03-01',                   -- Fecha_Nacimiento_P
    'Calle Baroque 333',            -- Direccion_P
    'Argentina',                    -- Nacionalidad_P
    'L0003',                        -- Id_Localidad_P (Rosario - Santa Fe)
    'marian1987@hotmail.com',       -- Correo_Electronico_P
    '1133337777',                   -- Telefono_P
    1                               -- Estado_P
)
;