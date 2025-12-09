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
('E003', 'Dermatología'),
('E004', 'Laboratorio Clinico'),
('E005', 'Cirugía'),
('E006', 'Neumología '),
('E007', 'Neurología'),
('E008', 'Ginecología'),
('E009', 'Oftalmología'),
('E010', 'Traumatología'),
('E011', 'Endocrinología'),
('E012', 'Urología'),
('E013', 'Nefrología'),
('E014', 'Oncología'),
('E015', 'Ortopedia'),
('E016', 'Audiometría'),
('E017', 'Pediatría'),
('E018', 'Nefrología'),
('E019', 'Psicología'),
('E020', 'Foniatría');

GO
--INSERT PROVINCIA
INSERT INTO dbo.PROVINCIAS (Id_Provincia, Descripcion_P)
VALUES
('P01', 'Buenos Aires'),
('P02', 'Córdoba'),
('P03', 'Santa Fe'),
('P04', 'San Luis'),
('P05', 'Mendoza'),
('P06', 'Salta'),
('P07', 'Jujuy'),
('P08', 'Corrientes'),
('P09', 'Formosa'),
('P10', 'Catamarca'),
('P11', 'Misiones'),
('P12', 'Chaco'),
('P13', 'La Rioja'),
('P14', 'San Juan'),
('P15', 'La Pampa'),
('P16', 'Chubut'),
('P17', 'Santa Cruz'),
('P18', 'Santiago del Estero'),
('P19', 'Tierra del Fuergo'),
('P20', 'Entre Ríos'),
('P21', 'Tucumán'),
('P22', 'Neuquén'),
('P23', 'Río Negro');

GO
--INSERT LOCALIDAD
INSERT INTO dbo.LOCALIDADES (Id_Localidad, Id_Provincia_L, Descripcion_L)
VALUES
('L0001', 'P01', 'La Plata'),
('L0002', 'P02', 'Villa Carlos Paz'),
('L0003', 'P03', 'Rosario'),
('L0004', 'P10', 'Belén'),
('L0005', 'P12', 'Resistencia'),
('L0006', 'P16', 'Rawson'),
('L0007', 'P02', 'Córdoba Capital'),
('L0008', 'P08', 'Corrientes Capital'),
('L0009', 'P20', 'Paraná'),
('L0010', 'P09', 'Formosa Capital'),
('L0011', 'P07', 'San Salvador de Jujuy'),
('L0012', 'P15', 'Santa Rosa'),
('L0013', 'P13', 'La Rioja Capital'),
('L0014', 'P05', 'San Rafael'),
('L0015', 'P11', 'Posadas'),
('L0016', 'P22', 'Neuquén Capital'),
('L0017', 'P23', 'Viedma'),
('L0018', 'P06', 'Salta Capital'),
('L0019', 'P14', 'San Juan Capital'),
('L0020', 'P04', 'Villa Mercedes'),
('L0021', 'P17', 'Río Gallegos'),
('L0022', 'P18', 'La Banda'),
('L0023', 'P19', 'Ushuaia'),
('L0024', 'P21', 'San Miguel de Tucumán'),
('L0025', 'P04', 'San Luis Capital');

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
INSERT INTO dbo.PACIENTES(Dni_Paciente, Nombre_P, Apellido_P, Sexo_P, Fecha_Nacimiento_P, Direccion_P, Nacionalidad_P, Id_Localidad_P, Correo_Electronico_P, Telefono_P, Estado_P) VALUES
('52813887', 'Rigoberto','Molinetes','Masculino','1991-07-23','Calle Gran Solar 475','Chile','L0002', 'molinetes_roberto@gmail.com','1144446666', 1),
('32813887', 'Mariano','Rodríguez','Masculino','1987-04-21','Calle San Nicolás 327','Argentina', 'L0001', 'marian1987@hotmail.com', '1133337777', 1),
('41462624', 'Ángela','Modera','Femenino', '2002-03-01','Calle Baroque 333','Argentina','L0003','marian1987@hotmail.com', '1133337777', 1),
('30746748', 'Jorge','Sorelo','Masculino','1999-04-05', 'Calle Robles 438','Chile', 'L0003', 'sorelo.jorge@gmail.com', '1123235782', 1),
('30777888', 'Mariano','Fernández','Masculino','1985-10-15','Calle Adobe 335', 'Argentina', 'L0002','ferman@gmail.com','1144435588', 1),
('99999999', 'Ignacio', 'Fernández', 'Masculino', '1995-08-23', 'Calle Rosario 779', 'Uruguay', 'L0002', 'nachofer@outlook.com', '1143518887', 1),
('25007853', 'Azul', 'Fernádez', 'Femenino', '2000-02-26', 'Calle Arroyo 972', 'Argentina', 'L0001', 'azuler@outlook.com', '1143518787', 0),
('45612345', 'Martina','Sabino','Femenino','2001-03-03','Calle Arroyo 971','Argentina','L0001','marina_76@gamil.com','1143121222',0 ),
('46322420', 'Santiago','Espindola','Masculino','2000-03-06','Calle Arias 221', 'Argentina', 'L0001','santiEs@outlook.com', '1123332998', 0),
('28502314', 'Alejandro', 'Bautista', 'Masculino', '1988-11-11', 'Calle Rodríguez 122', 'Argentina', 'L0014', 'ale12@gamil.com', '1187876787', 1),
('29433121', 'Guido', 'Garcia', 'Masculino', '1989-11-03', 'Calle Sarmiento 995', 'Colombia', 'L0023', 'guidoG@hotmail.es', '1121246578', 1),
('28786702', 'Bernarda', 'Rodriguez', 'Femenino', '1988-05-17', 'Calle Robles 431', 'Chile', 'L0009', 'ber@hotmail.es', '1189089789', 1),
('26546249', 'Sofia', 'Romero', 'Femenino', '1980-07-14', 'Calle Campana 121', 'Uruguay', 'L0021', 'sofi14@gmail.com', '1176667878', 1),
('41547892', 'Facundo', 'Martinez', 'Masculino', '1998-10-02', 'Calle Baroque 331', 'Colombia', 'L0015', 'facu2@hotmail.es', '1123209089', 1),
('43261120', 'Joaquina', 'Centurion', 'Femenino', '2000-12-01', 'Calle Sarmiento 551', 'Argentina', 'L0023', 'joa@gamil.com', '1167567898', 1),
('31505321', 'Antonio', 'Romero', 'Masculino', '1990-02-10', 'Calle Campana 131', 'Chile', 'L0007', 'antor_76@hotmail.es', '1132213430', 1),
('31213768', 'Miguel', 'Pino', 'Masculino', '1990-08-21', 'Calle Arroyo 970', 'Uruguay', 'L0004', 'miguel981@gmail.com', '1132890867', 1),
('28990870', 'Lourdes', 'Santos', 'Femenino', '1988-01-03', 'Calle Rodríguez 122', 'Uruguay', 'L0014', 'lou@hotmail.com', '1187340908', 1),
('28629090', 'Camila', 'Vega', 'Femenino', '1987-03-25', 'Calle Baroque 122', 'Argentina', 'L0015', 'cami_25@hotmail.es', '1121129809', 1),
('46787345', 'Jorge', 'Moral', 'Masculino', '2005-07-11', 'Calle Campana 121', 'Colombia', 'L0021', 'jorge@gmail.com', '1125432650', 1);

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