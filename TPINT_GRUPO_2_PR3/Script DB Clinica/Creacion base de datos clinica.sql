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
VALUES 
('A0001', 'Juan', 'Pérez', 'admin', 'admin123'), 
('A0002', 'Joaquin', 'Rey', 'joaco', 'joaco123'), 
('A0003', 'Veronica', 'Dias', 'vero', 'vero123'), 
('A0004', 'Alejo', 'De La torre', 'alejo', 'alejo123'),
('A0005', 'Miguel', 'Bucciero', 'miguel', 'miguel123'),
('A0006', 'Pablo', 'Dietrich', 'pablo', 'pablo123'),
('A0007', 'Florencia', 'Bandini','flor', 'flor123'),
('A0008', 'Nicolas', 'Zanello', 'nico', 'nico123'),
('A0009', 'Tomas', 'Caggiano', 'tomi', 'tomi123'),
('A0010', 'Catalina', 'Rodriguez', 'Cata', 'Cata123'),
('A0011', 'Mercedes', 'Ponzini', 'mercedes', 'mercedes123'),
('A0012', 'Sofia', 'Roldan', 'Sofia', 'Sofi123'),
('A0013', 'Mateo', 'Salazar', 'mateo', 'Mateo123'),
('A0014', 'Santiago', 'Michelet', 'santi', 'santi123'),
('A0015', 'Jeremias', 'Tercero', 'jeremias', 'Jeremias123');


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

VALUES
(
    'M0001', '40123456', 'Juan', 'Alvarez', 'Masculino', 'Argentina', '1980-05-12', 'Calle Falsa 123', 'L0001', 'juan.alvarez@gmail.com', '1145550001', 'E001', 'jalvarez', 'passM0001', 1
),
(
    'M0002', '40234567', 'Lucía', 'Martínez', 'Femenino', 'Argentina', '1985-11-03', 'Av. Libertad 45', 'L0002', 'lucia.martinez@gmail.com', '1145550002', 'E002', 'lmartinez', 'passM0002', 1
),
(
    'M0003', '40345678', 'Carlos', 'García', 'Masculino', 'Chile', '1975-02-20', 'Calle del Valle 78', 'L0003', 'carlos.garcia@gmail.com', '1145550003', 'E003', 'cgarcia', 'passM0003', 1
),
(
    'M0004', '40456789', 'Mariana', 'Vega', 'Femenino', 'Argentina', '1990-07-15', 'Calle Luna 210', 'L0004', 'mariana.vega@gmail.com', '1145550004', 'E004', 'mvega', 'passM0004', 1
),
(
    'M0005', '40567890', 'Federico', 'Domínguez', 'Masculino', 'Uruguay', '1982-09-09', 'Calle del Sol 56', 'L0005', 'federico.dominguez@gmail.com', '1145550005', 'E005', 'fdominguez', 'passM0005', 1
),
(
    'M0006', '40678901', 'Silvana', 'Ríos', 'Femenino', 'Argentina', '1979-12-01', 'Av. Perón 890', 'L0006', 'silvana.rios@gmail.com', '1156660001', 'E006', 'srios', 'passM0006', 1
),
(
    'M0007', '40789012', 'Alejandro', 'Torres', 'Masculino', 'Colombia', '1988-03-22', 'Calle Nueva 321', 'L0007', 'alejandro.torres@gmail.com', '1156660002', 'E007', 'atorres', 'passM0007', 1
),
(
    'M0008', '40890123', 'Gabriela', 'Ruiz', 'Femenino', 'Argentina', '1992-06-30', 'Calle Verde 12', 'L0008', 'gabriela.ruiz@gmail.com', '1167770001', 'E008', 'gruiz', 'passM0008', 1
),
(
    'M0009', '40901234', 'Diego', 'Sánchez', 'Masculino', 'Perú', '1974-08-18', 'Pasaje Flores 9', 'L0009', 'diego.sanchez@gmail.com', '1167770002', 'E009', 'dsanchez', 'passM0009', 1
),
(
    'M0010', '41012345', 'Patricia', 'López', 'Femenino', 'Argentina', '1987-01-05', 'Calle Córdoba 444', 'L0010', 'patricia.lopez@gmail.com', '1178880001', 'E010', 'plopez', 'passM0010', 1
),
(
    'M0011', '41123456', 'Sergio', 'Molina', 'Masculino', 'Chile', '1981-10-12', 'Av. Siempre Viva 22', 'L0011', 'sergio.molina@gmail.com', '1178880002', 'E011', 'smolina', 'passM0011', 1
),
(
    'M0012', '41234567', 'Florencia', 'Cáceres', 'Femenino', 'Argentina', '1993-04-07', 'Calle Sarmiento 200', 'L0012', 'florencia.caceres@gmail.com', '1189990001', 'E012', 'fcaceres', 'passM0012', 1
),
(
    'M0013', '41345678', 'Martín', 'Ortiz', 'Masculino', 'Argentina', '1977-11-28', 'Calle Rivadavia 88', 'L0013', 'martin.ortiz@gmail.com', '1189990002', 'E013', 'mortiz', 'passM0013', 1
),
(
    'M0014', '41456789', 'Verónica', 'Herrera', 'Femenino', 'Argentina', '1986-02-14', 'Calle Independencia 7', 'L0014', 'veronica.herrera@gmail.com', '1190001112', 'E014', 'vherrera', 'passM0014', 1
),
(
    'M0015', '41567890', 'Nicolás', 'Paredes', 'Masculino', 'Argentina', '1991-09-19', 'Calle Mitre 157', 'L0015', 'nicolas.paredes@gmail.com', '1190001113', 'E015', 'nparedes', 'passM0015', 1
);

GO
--INSERT HORARIO_MEDICO
INSERT INTO dbo.HORARIO_MEDICOS (
    Nro_Legajo_HM,
    Id_Dia_HM,
    HorarioInicio_HM,
    HorarioFinal_HM
) VALUES 
('M0001','2','08:00:00','16:00:00'),
('M0001','3','08:00:00','16:00:00'),
('M0001','5','08:00:00','16:00:00'),
('M0001','6','08:00:00','16:00:00'),
('M0002','1','12:00:00','20:00:00'),
('M0002','3','12:00:00','20:00:00'),
('M0002','4','12:00:00','20:00:00'),
('M0002','7','12:00:00','20:00:00'),
('M0003','1','14:00:00','22:00:00'),
('M0003','3','14:00:00','22:00:00'),
('M0003','4','14:00:00','22:00:00'),
('M0003','5','14:00:00','22:00:00'),
('M0003','6','14:00:00','22:00:00'),
('M0004','3','09:00:00','17:00:00'),
('M0004','4','09:00:00','17:00:00'),
('M0004','5','09:00:00','17:00:00'),
('M0005','2','13:00:00','21:00:00'),
('M0005','3','13:00:00','21:00:00'),
('M0005','4','13:00:00','21:00:00'),
('M0005','5','13:00:00','21:00:00'),
('M0005','6','13:00:00','21:00:00'),
('M0006','1','07:00:00','15:00:00'),
('M0006','2','07:00:00','15:00:00'),
('M0006','3','07:00:00','15:00:00'),
('M0006','4','07:00:00','15:00:00'),
('M0006','5','07:00:00','15:00:00'),
('M0007','1','08:00:00','16:00:00'),
('M0007','2','08:00:00','16:00:00'),
('M0007','3','08:00:00','16:00:00'),
('M0007','4','08:00:00','16:00:00'),
('M0007','5','08:00:00','16:00:00'),
('M0008','1','09:00:00','17:00:00'),
('M0008','2','09:00:00','17:00:00'),
('M0008','3','09:00:00','17:00:00'),
('M0008','4','09:00:00','17:00:00'),
('M0008','5','09:00:00','17:00:00'),
('M0009','1','12:00:00','20:00:00'),
('M0009','2','12:00:00','20:00:00'),
('M0009','3','12:00:00','20:00:00'),
('M0009','4','12:00:00','20:00:00'),
('M0009','5','12:00:00','20:00:00'),
('M0010','1','14:00:00','22:00:00'),
('M0010','2','14:00:00','22:00:00'),
('M0010','3','14:00:00','22:00:00'),
('M0010','4','14:00:00','22:00:00'),
('M0010','5','14:00:00','22:00:00'),
('M0011','1','07:00:00','15:00:00'),
('M0011','2','07:00:00','15:00:00'),
('M0011','3','07:00:00','15:00:00'),
('M0011','4','07:00:00','15:00:00'),
('M0011','5','07:00:00','15:00:00'),
('M0012','1','08:00:00','16:00:00'),
('M0012','2','08:00:00','16:00:00'),
('M0012','3','08:00:00','16:00:00'),
('M0012','4','08:00:00','16:00:00'),
('M0012','5','08:00:00','16:00:00'),
('M0013','1','09:00:00','17:00:00'),
('M0013','2','09:00:00','17:00:00'),
('M0013','3','09:00:00','17:00:00'),
('M0013','4','09:00:00','17:00:00'),
('M0013','5','09:00:00','17:00:00'),
('M0014','1','12:00:00','20:00:00'),
('M0014','2','12:00:00','20:00:00'),
('M0014','3','12:00:00','20:00:00'),
('M0014','4','12:00:00','20:00:00'),
('M0014','5','12:00:00','20:00:00'),
('M0015','1','14:00:00','22:00:00'),
('M0015','2','14:00:00','22:00:00'),
('M0015','3','14:00:00','22:00:00'),
('M0015','4','14:00:00','22:00:00'),
('M0015','5','14:00:00','22:00:00');

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