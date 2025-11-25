--- Creacion base de datos Clinica PO3

USE master

CREATE DATABASE Clinica_Medica COLLATE SQL_Latin1_General_CP1_CS_AS
GO

USE Clinica_Medica

CREATE TABLE ADMINISTRADORES (
Nombre_A CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Apellido_A CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
ID_Administrador CHAR(5) NOT NULL,
Usuario_A CHAR(40) NOT NULL,
Contrasenia_A VARCHAR(30) NOT NULL,

CONSTRAINT PK_ADMINISTRADORES PRIMARY KEY (ID_Administrador)
)
GO

CREATE TABLE MEDICOS(
Nro_Legajo_M CHAR(5) NOT NULL,
Dni_M CHAR(9) NOT NULL,
Nombre_M CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Apellido_M CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Sexo_M  CHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Nacionalidad_M CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Fecha_Nacimiento_M DATE NOT NULL,
Direccion_M CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
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
Nombre_P CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Apellido_P CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Sexo_P CHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Fecha_Nacimiento_P DATE NOT NULL,
Direccion_P CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Nacionalidad_P CHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
Id_Localidad_P CHAR(5) NOT NULL,
Correo_Electronico_P CHAR(40) NOT NULL,
Telefono_P CHAR(20) NOT NULL,
Estado_P BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_PACIENTES PRIMARY KEY (Dni_Paciente)
)
GO

CREATE TABLE ESPECIALIDADES(
ID_Especialidad CHAR(4) NOT NULL,
Descripcion_E CHAR(30) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,

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
Hora_T TIME NOT NULL, 
Asistencia_T CHAR(20) NOT NULL,
Observaciones CHAR(1000) NOT NULL,
Estado BIT NOT NULL,

CONSTRAINT PK_TURNOS PRIMARY KEY(Id_Turno)
)
GO

CREATE TABLE PROVINCIAS(
Id_Provincia CHAR(3) NOT NULL,
Descripcion_P CHAR(30) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL

CONSTRAINT PK_PROVINCIAS PRIMARY KEY(Id_Provincia)
)
GO

CREATE TABLE LOCALIDADES(
Id_Localidad CHAR(5) NOT NULL,
Id_Provincia_L CHAR(3) NOT NULL,
Descripcion_L CHAR(30) COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,

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
    'M0001',                    -- Nro_Legajo_M
    '37564218',                 -- Dni_M
    'María',                    -- Nombre_M
    'Gómez',                    -- Apellido_M
    'Femenino',                 -- Sexo_M
    'Argentina',                -- Nacionalidad_M
    '1988-04-22',               -- Fecha_Nacimiento_M
    'Calle San Martín 123',     -- Direccion_M
    'L0001',                    -- Id_Localidad_M (La Plata - Buenos Aires)
    'maria.gomez@clinica.com',  -- Correo_Electronico_M
    '1145892365',               -- Telefono_M
    'E001',                     -- Id_Especialidad_M (Cardiología)
    'mgomez',                   -- Usuario_M
    'clave123',                 -- Contrasenia_M
     1                          -- Estado_M (activo)
),
(
    'M0002',                    -- Nro_Legajo_M
    '41702776',                 -- Dni_M
    'Alejo',                    -- Nombre_M
    'Fernández de la Torre',    -- Apellido_M
    'Masculino',                -- Sexo_M
    'Argentina',                -- Nacionalidad_M
    '1998-12-31',               -- Fecha_Nacimiento_M
    'Calle Muy Extraña 777',    -- Direccion_M
    'L0001',                    -- Id_Localidad_M (La Plata - Buenos Aires)
    'torrefernandez@yahoo.com', -- Correo_Electronico_M
    '1176542341',               -- Telefono_M
    'E003',                     -- Id_Especialidad_M (Dermatología)
    'alejox',                   -- Usuario_M
    '77778888',                 -- Contrasenia_M
     1                          -- Estado_M (activo)
),
(
    'M0003',                    -- Nro_Legajo_M
    '44752776',                 -- Dni_M
    'Ojela',                    -- Nombre_M
    'Sorrento Albino',          -- Apellido_M
    'Femenino',                 -- Sexo_M
    'Chile',                    -- Nacionalidad_M
    '1995-04-25',               -- Fecha_Nacimiento_M
    'Calle Rodríguez 233',      -- Direccion_M
    'L0001',                    -- Id_Localidad_M (La Plata - Buenos Aires)
    'sorrento_albino@gmail.com',-- Correo_Electronico_M
    '1176542341',               -- Telefono_M
    'E002',                     -- Id_Especialidad_M (Pediatría)
    'ojesor',                   -- Usuario_M
    '56564352',                 -- Contrasenia_M
     1                          -- Estado_M (activo)
),
(
    'M0004',                    -- Nro_Legajo_M
    '39887897',                 -- Dni_M
    'María',                    -- Nombre_M
    'Pérez',                    -- Apellido_M
    'Femenino',                 -- Sexo_M
    'Argentina',                    -- Nacionalidad_M
    '1995-04-25',               -- Fecha_Nacimiento_M
    'Calle Algarrobo 657',      -- Direccion_M
    'L0002',                    -- Id_Localidad_M (Villa Carlos Paz - Córdoba)
    'perez.maria@gmail.com',    -- Correo_Electronico_M
    '1176542341',               -- Telefono_M
    'E002',                     -- Id_Especialidad_M (Pediatría)
    'mapez',                    -- Usuario_M
    '33345632',                 -- Contrasenia_M
     1                          -- Estado_M (activo)
),
(
    'M0005',                    -- Nro_Legajo_M
    '31882349',                 -- Dni_M
    'Rodrigo',                  -- Nombre_M
    'Pérez Lovera',             -- Apellido_M
    'Masculino',                -- Sexo_M
    'Perú',                     -- Nacionalidad_M
    '1978-04-25',               -- Fecha_Nacimiento_M
    'Calle Sarmiento 994',      -- Direccion_M
    'L0003',                    -- Id_Localidad_M (Rosario - Santa Fe)
    'lovera.rodrigo@outlook.com',-- Correo_Electronico_M
    '1176542341',               -- Telefono_M
    'E003',                     -- Id_Especialidad_M (Dermatología)
    'medicoRPL',                -- Usuario_M
    '25041978',                 -- Contrasenia_M
     1                          -- Estado_M (activo)
);

GO
--INSERT HORARIO_MEDICO
INSERT INTO dbo.HORARIO_MEDICOS (
    Nro_Legajo_HM,
    Id_Dia_HM,
    HorarioInicio_HM,
    HorarioFinal_HM
) VALUES (
    'M0001',                    -- Nro_Legajo_HM
    '2',                        -- Id_Dia_HM
    '08:00:00',                 -- HorarioInicio_HM
    '15:00:00'                  -- HorarioFinal_HM
), (
    'M0001',
    '3',
    '08:00:00',
    '15:00:00'
), (
    'M0001',
    '5',
    '08:00:00',
    '15:00:00'
), (
    'M0001',
    '6',
    '08:00:00',
    '15:00:00'
), (
    'M0002',
    '1',
    '16:00:00',
    '21:00:00'
), (
    'M0002',
    '3',
    '16:00:00',
    '21:00:00'
), (
    'M0002',
    '4',
    '16:00:00',
    '21:00:00'
), (
    'M0002',
    '7',
    '16:00:00',
    '21:00:00'
), (
    'M0003',
    '1',
    '19:00:00',
    '04:00:00'
), (
    'M0003',
    '3',
    '19:00:00',
    '04:00:00'
), (
    'M0003',
    '4',
    '19:00:00',
    '04:00:00'
), (
    'M0003',
    '5',
    '19:00:00',
    '04:00:00'
), (
    'M0003',
    '6',
    '19:00:00',
    '04:00:00'
), (
    'M0004',
    '3',
    '09:00:00',
    '14:00:00'
), (
    'M0004',
    '4',
    '09:00:00',
    '14:00:00'
), (
    'M0004',
    '5',
    '09:00:00',
    '14:00:00'
), (
    'M0005',
    '2',
    '13:00:00',
    '20:00:00'
), (
    'M0005',
    '3',
    '13:00:00',
    '20:00:00'
), (
    'M0005',
    '4',
    '13:00:00',
    '20:00:00'
), (
    'M0005',
    '5',
    '13:00:00',
    '20:00:00'
), (
    'M0005',
    '6',
    '13:00:00',
    '20:00:00'
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
),
(
    '30746748',                     -- Dni_Paciente
    'Jorge',                        -- Nombre_P
    'Sorelo',                       -- Apellido_P
    'Masculino',                    -- Sexo_P
    '1999-04-05',                   -- Fecha_Nacimiento_P
    'Calle Robles 438',             -- Direccion_P
    'Chile',                        -- Nacionalidad_P
    'L0003',                        -- Id_Localidad_P (Rosario - Santa Fe)
    'sorelo.jorge@gmail.com',       -- Correo_Electronico_P
    '1123235782',                   -- Telefono_P
    1                               -- Estado_P
),
(
    '30777888',                     -- Dni_Paciente
    'Mariano',                      -- Nombre_P
    'Fernández',                    -- Apellido_P
    'Masculino',                    -- Sexo_P
    '1985-10-15',                   -- Fecha_Nacimiento_P
    'Calle Adobe 335',              -- Direccion_P
    'Argentina',                    -- Nacionalidad_P
    'L0002',                        -- Id_Localidad_P (Villa Carlos Paz - Córdoba)
    'ferman@gmail.com',             -- Correo_Electronico_P
    '1144435588',                   -- Telefono_P
    1                               -- Estado_P
),
(
    '99999999',                     -- Dni_Paciente
    'Ignacio',                      -- Nombre_P
    'Fernández',                    -- Apellido_P
    'Masculino',                    -- Sexo_P
    '1995-08-23',                   -- Fecha_Nacimiento_P
    'Calle Rosario 779',            -- Direccion_P
    'Uruguay',                      -- Nacionalidad_P
    'L0002',                        -- Id_Localidad_P (Villa Carlos Paz - Córdoba)
    'nachofer@outlook.com',         -- Correo_Electronico_P
    '1143518887',                   -- Telefono_P
    1                               -- Estado_P
),
(
    '25007853',                     -- Dni_Paciente
    'Azul',                      -- Nombre_P
    'Fernádez',                    -- Apellido_P
    'Femenino',                    -- Sexo_P
    '2000-02-26',                   -- Fecha_Nacimiento_P
    'Calle Arroyo 972',            -- Direccion_P
    'Argentina',                      -- Nacionalidad_P
    'L0001',                        -- Id_Localidad_P (La Plata - Buenos Aires)
    'azuler@outlook.com',         -- Correo_Electronico_P
    '1143518787',                   -- Telefono_P
    0                               -- Estado_P
),
(
    '45612345',                     -- Dni_Paciente
    'Martina',                      -- Nombre_P
    'Sabino',                    -- Apellido_P
    'Femenino',                    -- Sexo_P
    '2001-03-03',                   -- Fecha_Nacimiento_P
    'Calle Arroyo 971',            -- Direccion_P
    'Argentina',                      -- Nacionalidad_P
    'L0001',                        -- Id_Localidad_P (La Plata - Buenos Aires)
    'marina_76@gamil.com',         -- Correo_Electronico_P
    '1143121222',                   -- Telefono_P
    0                               -- Estado_P
),
(
    '46322420',                     -- Dni_Paciente
    'Santiago',                      -- Nombre_P
    'Espindola',                    -- Apellido_P
    'Masculino',                    -- Sexo_P
    '2000-03-06',                   -- Fecha_Nacimiento_P
    'Calle Arias 221',            -- Direccion_P
    'Argentina',                      -- Nacionalidad_P
    'L0001',                        -- Id_Localidad_P (La Plata - Buenos Aires)
    'santiEs@outlook.com',         -- Correo_Electronico_P
    '1123332998',                   -- Telefono_P
    0                               -- Estado_P
);

GO
--INSERT TURNOS 
INSERT INTO TURNOS (Id_Turno, Nro_Legajo_T, Dni_Paciente_T, Fecha_T, Hora_T, Asistencia_T, Observaciones, Estado) VALUES
('T000001', 'M0001', 30746748, '2025-11-17', '08:00:00', 'Asistio', 'Diagnostico por realizar', 1),
('T000002', 'M0001', 30777888, '2025-11-18', '08:00:00', 'Asistio', 'Diagnostico por realizar', 1),
('T000003', 'M0001', 32813887, '2025-11-19', '08:00:00', 'A confirmar', 'Diagnostico por realizar', 1),
('T000004', 'M0001', 41462624, '2025-11-20', '08:00:00', 'A confirmar', 'Diagnostico por realizar', 1),
('T000005', 'M0001', 52813887, '2025-11-21', '08:00:00', 'No asistio', 'Diagnostico por realizar', 1),

('T000006', 'M0002', 30746748, '2025-11-18', '09:00:00', 'Asistio', 'Diagnostico por realizar', 1),
('T000007', 'M0002', 32813887, '2025-11-19', '10:00:00', 'A confirmar', 'Diagnostico por realizar', 1),
('T000008', 'M0002', 41462624, '2025-11-20', '11:00:00', 'A confirmar', 'Diagnostico por realizar', 1),

('T000009', 'M0003', 30777888, '2025-11-17', '09:00:00', 'Asistio', 'Diagnostico por realizar', 1),
('T000010', 'M0003', 52813887, '2025-11-20', '10:00:00', 'No asistio', 'Diagnostico por realizar', 1),
('T000011', 'M0003', 41462624, '2025-11-21', '11:00:00', 'A confirmar', 'Diagnostico por realizar', 1),

('T000012', 'M0004', 30746748, '2025-11-19', '09:00:00', 'Asistio', 'Diagnostico por realizar', 1),
('T000013', 'M0004', 32813887, '2025-11-19', '10:00:00', 'A confirmar', 'Diagnostico por realizar', 1),
('T000014', 'M0004', 99999999, '2025-11-19', '11:00:00', 'A confirmar', 'Diagnostico por realizar', 1),

('T000015', 'M0005', 30777888, '2025-11-17', '13:00:00', 'Asistio', 'Diagnostico por realizar', 1),
('T000016', 'M0005', 52813887, '2025-11-18', '14:00:00', 'No asistio', 'Diagnostico por realizar', 1),
('T000017', 'M0005', 41462624, '2025-11-19', '15:00:00', 'A confirmar', 'Diagnostico por realizar', 1);