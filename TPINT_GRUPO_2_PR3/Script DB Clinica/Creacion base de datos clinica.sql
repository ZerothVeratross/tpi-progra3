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
    'M0001', '40123456', 'Juan', 'Alvarez', 'Masculino', 'Argentina', '1980-05-12', 'Calle Falsa 123', 'L0001', 'slkf_@hotmail.com', '1145550001', 'E001', 'prueba', '123', 1
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
),
(
    'M0016', '40909900', 'Guido', 'Torrent', 'Masculino', 'Argentina', '1980-11-11', 'Calle Serrano 123', 'L0019', 'gtorrent@gmail.com', '1145599001', 'E014', 'gTorrent', 'gu1d00', 1
),
(
    'M0017', '40221234', 'Alina', 'Espindola', 'Femenino', 'Argentina', '1980-10-12', 'Calle Conessa 333', 'L0019', 'alina@gmail.com', '1145599321', 'E017', 'AlinAEs', 'aL1n13s', 0
),
(
    'M0018', '40654234', 'Alan', 'Graziani', 'Masculino', 'Chile', '1980-09-01', 'Calle Mitre 656', 'L0022', 'aGraziani@hotmail.es', '1141550001', 'E007', 'allan', 'm2dic0', 0
),
(
    'M0019', '40765123', 'Walter', 'Ivkovic', 'Masculino', 'Croacia', '1980-08-22', 'Calle Serrano 112', 'L0001', 'ivkoWalter@gmail.com', '1176850001', 'E019', 'walterIvko', 'e011w', 1
),
(
    'M0020', '40657456', 'Manuel', 'Diermissen', 'Masculino', 'Alemania', '1980-05-22', 'Calle Verde 887', 'L0001', 'manu_dier@gmail.com', '1145511201', 'E015', 'manu', 'd13r', 0
),
(
    'M0021', '40222456', 'Bruno', 'Diaz', 'Masculino', 'Italia', '1980-03-13', 'Calle Campana 654', 'L0011', 'bruno@gmail.com', '1145577681', 'E009', 'brunoo', 'br0n0', 0
),
(
    'M0022', '41890111', 'Laura', 'Benítez', 'Femenino', 'Argentina', '1984-06-18', 'Calle Belgrano 345', 'L0002', 'laura.benitez@gmail.com', '1145600001', 'E002', 'lbenitez', 'passM0022', 0
),
(
    'M0023', '41901222', 'Ricardo', 'Suárez', 'Masculino', 'Uruguay', '1978-02-09', 'Av. San Martín 980', 'L0003', 'ricardo.suarez@gmail.com', '1145600002', 'E003', 'rsuarez', 'passM0023', 1
),
(
    'M0024', '42012333', 'Natalia', 'Figueroa', 'Femenino', 'Argentina', '1989-12-27', 'Calle Moreno 150', 'L0004', 'natalia.figueroa@gmail.com', '1145600003', 'E004', 'nfigueroa', 'passM0024', 0
),
(
    'M0025', '42123444', 'Hernán', 'Acosta', 'Masculino', 'Paraguay', '1981-04-03', 'Calle Lavalle 77', 'L0005', 'hernan.acosta@gmail.com', '1145600004', 'E005', 'hacosta', 'passM0025', 0
),
(
    'M0026', '42234555', 'Paula', 'Méndez', 'Femenino', 'Argentina', '1990-09-14', 'Av. Callao 640', 'L0006', 'paula.mendez@gmail.com', '1145600005', 'E006', 'pmendez', 'passM0026', 0
),
(   
    'M0027', '42345666', 'Claudia', 'Ponce', 'Femenino', 'Argentina', '1987-06-11', 'Calle San Martín 345', 'L0024', 'claudia.ponce@gmail.com', '1145600101', 'E016', 'cponce', 'passM0027', 1
),
(   
    'M0028', '42456777', 'Javier', 'Salas', 'Masculino', 'Argentina', '1982-03-27', 'Av. Alem 789', 'L0016', 'javier.salas@gmail.com', '1145600102', 'E018', 'jsalas', 'passM0028', 1
),
(   
    'M0029', '42567888', 'Mariela', 'Cortés', 'Femenino', 'Argentina', '1991-10-04', 'Calle Güemes 210', 'L0018', 'mariela.cortes@gmail.com', '1145600103', 'E020', 'mcortes', 'passM0029', 1
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
('M0002','1','10:00:00','18:00:00'),
('M0002','3','10:00:00','18:00:00'),
('M0002','4','10:00:00','18:00:00'),
('M0002','7','10:00:00','18:00:00'),
('M0003','1','10:00:00','18:00:00'),
('M0003','3','10:00:00','18:00:00'),
('M0003','4','10:00:00','18:00:00'),
('M0003','5','10:00:00','18:00:00'),
('M0003','6','10:00:00','18:00:00'),
('M0004','3','09:00:00','17:00:00'),
('M0004','4','09:00:00','17:00:00'),
('M0004','5','09:00:00','17:00:00'),
('M0005','2','10:00:00','18:00:00'),
('M0005','3','10:00:00','18:00:00'),
('M0005','4','10:00:00','18:00:00'),
('M0005','5','10:00:00','18:00:00'),
('M0005','6','10:00:00','18:00:00'),
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
('M0009','1','10:00:00','18:00:00'),
('M0009','2','10:00:00','18:00:00'),
('M0009','3','10:00:00','18:00:00'),
('M0009','4','10:00:00','18:00:00'),
('M0009','5','10:00:00','18:00:00'),
('M0010','1','07:00:00','15:00:00'),
('M0010','2','07:00:00','15:00:00'),
('M0010','3','07:00:00','15:00:00'),
('M0010','4','07:00:00','15:00:00'),
('M0010','5','07:00:00','15:00:00'),
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
('M0014','1','12:00:00','18:00:00'),
('M0014','2','12:00:00','18:00:00'),
('M0014','3','12:00:00','18:00:00'),
('M0014','4','12:00:00','18:00:00'),
('M0014','5','12:00:00','18:00:00'),
('M0015','1','14:00:00','17:00:00'),
('M0015','2','14:00:00','17:00:00'),
('M0015','3','14:00:00','17:00:00'),
('M0015','4','14:00:00','17:00:00'),
('M0015','5','14:00:00','17:00:00'),
('M0016','2','14:00:00','18:00:00'),
('M0016','3','14:00:00','18:00:00'),
('M0017','3','13:00:00','18:00:00'),
('M0018','3','14:00:00','18:00:00'),
('M0018','4','14:00:00','18:00:00'),
('M0019','1','11:00:00','18:00:00'),
('M0020','3','12:00:00','18:00:00'),
('M0021','3','09:00:00','16:00:00'),
('M0021','5','09:00:00','16:00:00'),
('M0022','1','08:00:00','16:00:00'),
('M0022','2','08:00:00','16:00:00'),
('M0022','3','08:00:00','16:00:00'),
('M0022','4','08:00:00','16:00:00'),
('M0022','5','08:00:00','16:00:00'),
('M0023','2','10:00:00','18:00:00'),
('M0023','3','10:00:00','18:00:00'),
('M0023','4','10:00:00','18:00:00'),
('M0023','5','10:00:00','18:00:00'),
('M0023','6','10:00:00','18:00:00'),
('M0024','1','07:00:00','15:00:00'),
('M0024','2','07:00:00','15:00:00'),
('M0024','3','07:00:00','15:00:00'),
('M0024','4','07:00:00','15:00:00'),
('M0024','5','07:00:00','15:00:00'),
('M0025','3','09:00:00','17:00:00'),
('M0025','4','09:00:00','17:00:00'),
('M0025','5','09:00:00','17:00:00'),
('M0025','6','09:00:00','17:00:00'),
('M0026','1','12:00:00','18:00:00'),
('M0026','2','12:00:00','18:00:00'),
('M0026','3','12:00:00','18:00:00'),
('M0026','4','12:00:00','18:00:00'),
('M0026','5','12:00:00','18:00:00');

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
('46787345', 'Jorge', 'Moral', 'Masculino', '2005-07-11', 'Calle Campana 121', 'Colombia', 'L0021', 'jorge@gmail.com', '1125432650', 1),
('30123456', 'Valentina', 'Ramos', 'Femenino', '1996-05-19', 'Calle Mitre 455', 'Argentina', 'L0001', 'valen.ramos@gmail.com', '1145678901', 1),
('31234567', 'Lucas', 'Pereyra', 'Masculino', '1992-09-08', 'Av. Rivadavia 1234', 'Argentina', 'L0002', 'lucasp@gmail.com', '1145678902', 1),
('32345678', 'Micaela', 'Suárez', 'Femenino', '1999-12-11', 'Calle Belgrano 78', 'Uruguay', 'L0003', 'mica.suarez@outlook.com', '1145678903', 1),
('33456789', 'Tomás', 'Ibarra', 'Masculino', '1985-01-30', 'Calle San Juan 654', 'Chile', 'L0004', 'tomas.ibarra@gmail.com', '1145678904', 1),
('34567890', 'Carolina', 'Navarro', 'Femenino', '1990-07-07', 'Av. Corrientes 990', 'Argentina', 'L0005', 'caro.navarro@hotmail.com', '1145678905', 1),
('35678901', 'Ezequiel', 'Morales', 'Masculino', '1994-03-14', 'Calle Laprida 321', 'Argentina', 'L0006', 'eze.morales@gmail.com', '1145678906', 0),
('36789012', 'Rocío', 'Castro', 'Femenino', '2001-11-25', 'Calle España 222', 'Argentina', 'L0007', 'rocio.castro@outlook.com', '1145678907', 0),
('37890123', 'Sebastián', 'Luna', 'Masculino', '1983-06-02', 'Av. Colón 456', 'Colombia', 'L0008', 'seba.luna@gmail.com', '1145678908', 1),
('38901234', 'Agustina', 'Ferreyra', 'Femenino', '1997-10-18', 'Calle Alsina 88', 'Argentina', 'L0009', 'agusf@gmail.com', '1145678909', 1),
('39012345', 'Matías', 'Quiroga', 'Masculino', '1989-04-27', 'Calle Brown 910', 'Uruguay', 'L0010', 'mati.quiroga@hotmail.com', '1145678910', 0);

GO
--INSERT TURNOS 
INSERT INTO TURNOS (Id_Turno, Nro_Legajo_T, Dni_Paciente_T, Fecha_T, Hora_T, Asistencia_T, Observaciones, Estado) VALUES
('T000001', 'M0001', 30746748, '2025-11-17', '08:00:00', 'Asistio', 'Consulta general', 1),
('T000002', 'M0001', 30777888, '2025-11-18', '08:00:00', 'Asistio', 'Control', 1),
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
('T000017', 'M0005', 41462624, '2025-11-19', '15:00:00', 'A confirmar', 'Diagnostico por realizar', 1), 

('T000018', 'M0006', 28502314, '2025-11-17', '07:00:00', 'Asistio','Control general',1),
('T000019', 'M0006', 29433121, '2025-11-18', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000020', 'M0006', 28786702, '2025-11-19', '09:00:00', 'Asistio','Seguimiento',1),
('T000021', 'M0006', 26546249, '2025-11-20', '10:00:00', 'No asistio','Diagnostico por realizar',1),
('T000022', 'M0006', 41547892, '2025-11-21', '11:00:00', 'A confirmar','Diagnostico por realizar',1),

('T000023', 'M0007', 43261120, '2025-11-17', '08:00:00', 'Asistio','Consulta general',1),
('T000024', 'M0007', 31505321, '2025-11-18', '09:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000025', 'M0007', 31213768, '2025-11-19', '10:00:00', 'Asistio','Seguimiento',1),
('T000026', 'M0007', 28990870, '2025-11-20', '11:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000027', 'M0007', 28629090, '2025-11-21', '12:00:00', 'No asistio','Diagnostico por realizar',1),

('T000028', 'M0008', 46787345, '2025-11-17', '09:00:00', 'Asistio','Consulta',1),
('T000029', 'M0008', 30123456, '2025-11-18', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000030', 'M0008', 31234567, '2025-11-19', '11:00:00', 'Asistio','Seguimiento',1),
('T000031', 'M0008', 32345678, '2025-11-20', '12:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000032', 'M0008', 33456789, '2025-11-21', '13:00:00', 'No asistio','Diagnostico por realizar',1),

('T000033', 'M0009', 34567890, '2025-11-17', '10:00:00', 'Asistio','Consulta general',1),
('T000034', 'M0009', 37890123, '2025-11-18', '11:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000035', 'M0009', 38901234, '2025-11-19', '12:00:00', 'Asistio','Seguimiento',1),
('T000036', 'M0009', 30123456, '2025-11-20', '13:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000037', 'M0009', 31234567, '2025-11-21', '14:00:00', 'No asistio','Diagnostico por realizar',1),

('T000038', 'M0010', 32345678, '2025-11-17', '07:00:00', 'Asistio','Chequeo',1),
('T000039', 'M0010', 33456789, '2025-11-18', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000040', 'M0010', 34567890, '2025-11-19', '09:00:00', 'Asistio','Seguimiento',1),
('T000041', 'M0010', 37890123, '2025-11-20', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000042', 'M0010', 38901234, '2025-11-21', '11:00:00', 'No asistio','Diagnostico por realizar',1),

('T000043', 'M0011', 30123456, '2025-11-17', '07:00:00', 'Asistio','Consulta',1),
('T000044', 'M0011', 31234567, '2025-11-18', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000045', 'M0011', 32345678, '2025-11-19', '09:00:00', 'Asistio','Seguimiento',1),
('T000046', 'M0011', 33456789, '2025-11-20', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000047', 'M0011', 34567890, '2025-11-21', '11:00:00', 'No asistio','Control',1),

('T000048', 'M0012', 37890123, '2025-11-17', '08:00:00', 'Asistio','Consulta',1),
('T000049', 'M0012', 38901234, '2025-11-18', '09:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000050', 'M0012', 30123456, '2025-11-19', '10:00:00', 'Asistio','Seguimiento',1),
('T000051', 'M0012', 31234567, '2025-11-20', '11:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000052', 'M0012', 32345678, '2025-11-21', '12:00:00', 'No asistio','Diagnostico por realizar',1),

('T000053', 'M0013', 33456789,'2025-11-17', '09:00:00', 'Asistio','Consulta',1),
('T000054', 'M0013', 34567890,'2025-11-18', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000055', 'M0013', 37890123,'2025-11-19', '11:00:00', 'Asistio','Seguimiento',1),
('T000056', 'M0013', 38901234,'2025-11-20', '12:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000057', 'M0013', 30123456,'2025-11-21', '13:00:00', 'No asistio','Diagnostico por realizar',1),

('T000058', 'M0014', 31234567, '2025-11-17', '12:00:00', 'Asistio','Consulta',1),
('T000059', 'M0014', 32345678, '2025-11-18', '13:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000060', 'M0014', 33456789, '2025-11-19', '14:00:00', 'Asistio','Seguimiento',1),
('T000061', 'M0014', 34567890, '2025-11-20', '15:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000062', 'M0014', 37890123, '2025-11-21', '16:00:00', 'No asistio','Diagnostico por realizar',1),

('T000063', 'M0015', 38901234, '2025-11-17', '14:00:00', 'Asistio','Consulta',1),
('T000064', 'M0015', 30123456, '2025-11-18', '14:30:00', 'A confirmar','Diagnostico por realizar',1),
('T000065', 'M0015', 31234567, '2025-11-19', '15:00:00', 'Asistio','Seguimiento',1),
('T000066', 'M0015', 32345678, '2025-11-20', '15:30:00', 'A confirmar','Diagnostico por realizar',1),
('T000067', 'M0015', 33456789, '2025-11-21', '16:00:00', 'No asistio','Diagnostico por realizar',1),

('T000068', 'M0001', 30123456, '2025-12-02', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000069', 'M0001', 31234567, '2025-12-04', '09:00:00', 'Asistio','Control mensual',1),
('T000070', 'M0001', 32345678, '2025-12-06', '10:00:00', 'No asistio','Diagnostico por realizar',1),

('T000071', 'M0002', 33456789, '2025-12-01', '10:00:00', 'Asistio','Consulta',1),
('T000072', 'M0002', 34567890, '2025-12-03', '11:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000073', 'M0002', 37890123, '2025-12-05', '12:00:00', 'No asistio','Diagnostico por realizar',1),

('T000074', 'M0003', 38901234, '2025-12-02', '10:00:00', 'Asistio','Consulta',1),
('T000075', 'M0003', 30123456, '2025-12-04', '11:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000076', 'M0003', 31234567, '2025-12-06', '12:00:00', 'No asistio','Diagnostico por realizar',1),

('T000077', 'M0004', 32345678, '2025-12-03', '09:00:00', 'Asistio','Consulta',1),
('T000078', 'M0004', 33456789, '2025-12-05', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000079', 'M0004', 34567890, '2025-12-07', '11:00:00', 'No asistio','Diagnostico por realizar',1),

('T000080', 'M0005', 37890123, '2025-12-02', '13:00:00', 'Asistio','Consulta',1),
('T000081', 'M0005', 38901234, '2025-12-04', '14:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000082', 'M0005', 30123456, '2025-12-06', '15:00:00', 'No asistio','Diagnostico por realizar',1),

('T000083', 'M0006', 31234567, '2025-12-01', '07:00:00', 'Asistio','Consulta',1),
('T000084', 'M0006', 32345678, '2025-12-03', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000085', 'M0006', 33456789, '2025-12-05', '09:00:00', 'No asistio','Diagnostico por realizar',1),

('T000086', 'M0007', 34567890, '2025-12-02', '08:00:00', 'Asistio','Consulta',1),
('T000087', 'M0007', 37890123, '2025-12-04', '09:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000088', 'M0007', 38901234, '2025-12-06', '10:00:00', 'No asistio','Diagnostico por realizar',1),

('T000089', 'M0008', 30123456, '2025-12-01', '09:00:00', 'Asistio','Consulta',1),
('T000090', 'M0008', 31234567, '2025-12-03', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000091', 'M0008', 32345678, '2025-12-05', '11:00:00', 'No asistio','Diagnostico por realizar',1),

('T000092', 'M0009', 33456789, '2025-12-02', '10:00:00', 'Asistio','Consulta',1),
('T000093', 'M0009', 34567890, '2025-12-04', '11:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000094', 'M0009', 37890123, '2025-12-06', '12:00:00', 'No asistio','Diagnostico por realizar',1),

('T000095', 'M0010', 38901234, '2025-12-01', '07:00:00', 'Asistio','Consulta',1),
('T000096', 'M0010', 30123456, '2025-12-03', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000097', 'M0010', 31234567, '2025-12-05', '09:00:00', 'No asistio','Diagnostico por realizar',1),

('T000098', 'M0011', 32345678, '2025-12-02', '07:00:00', 'Asistio','Consulta',1),
('T000099', 'M0011', 33456789, '2025-12-04', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000100', 'M0011', 34567890, '2025-12-06', '09:00:00', 'No asistio','Diagnostico por realizar',1),

('T000101', 'M0012', 37890123, '2025-12-02', '08:00:00', 'Asistio','Consulta diciembre',1),
('T000102', 'M0012', 38901234, '2025-12-04', '09:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000103', 'M0012', 30123456, '2025-12-06', '10:00:00', 'No asistio','Chequeo',1),

('T000104', 'M0013', 31234567, '2025-12-03', '09:00:00', 'Asistio','Consulta',1),
('T000105', 'M0013', 32345678, '2025-12-05', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000106', 'M0013', 33456789, '2025-12-07', '11:00:00', 'No asistio','Diagnostico por realizar',1),

('T000107', 'M0014', 34567890, '2025-12-02', '12:00:00', 'Asistio','Consulta',1),
('T000108', 'M0014', 37890123, '2025-12-04', '13:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000109', 'M0014', 38901234, '2025-12-06', '14:00:00', 'No asistio','Diagnostico por realizar',1),

('T000110', 'M0015', 30123456, '2025-12-03', '14:00:00', 'Asistio','Consulta',1),
('T000111', 'M0015', 31234567, '2025-12-05', '15:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000112', 'M0015', 32345678, '2025-12-07', '16:00:00', 'No asistio','Diagnostico por realizar',1),

('T000113', 'M0016', 33456789, '2025-12-04', '14:00:00', 'Asistio','Consulta',1),
('T000114', 'M0016', 34567890, '2025-12-05', '15:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000115', 'M0016', 37890123, '2025-12-06', '16:00:00', 'No asistio','Diagnostico por realizar',1),

('T000116', 'M0017', 38901234, '2025-12-03', '13:00:00', 'Asistio','Consulta',1),
('T000117', 'M0017', 30123456, '2025-12-05', '14:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000118', 'M0017', 31234567, '2025-12-07', '15:00:00', 'No asistio','Diagnostico por realizar',1),

('T000119', 'M0018', 32345678, '2025-12-04', '14:00:00', 'Asistio','Consulta',1),
('T000120', 'M0018', 33456789, '2025-12-06', '15:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000121', 'M0018', 34567890, '2025-12-07', '16:00:00', 'No asistio','Diagnostico por realizar',1),

('T000122', 'M0019', 37890123, '2025-12-02', '11:00:00', 'Asistio','Consulta',1),
('T000123', 'M0019', 38901234, '2025-12-04', '12:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000124', 'M0019', 30123456, '2025-12-06', '13:00:00', 'No asistio','Diagnostico por realizar',1),

('T000125', 'M0020', 31234567, '2025-12-03', '12:00:00', 'Asistio','Consulta',1),
('T000126', 'M0020', 32345678, '2025-12-05', '13:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000127', 'M0020', 33456789, '2025-12-07', '14:00:00', 'No asistio','Diagnostico por realizar',1),

('T000128', 'M0021', 34567890, '2025-12-02', '09:00:00', 'Asistio','Consulta',1),
('T000129', 'M0021', 37890123, '2025-12-04', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000130', 'M0021', 38901234, '2025-12-06', '11:00:00', 'No asistio','Diagnostico por realizar',1),

('T000131', 'M0022', 30123456, '2025-12-03', '08:00:00', 'Asistio','Consulta',1),
('T000132', 'M0022', 31234567, '2025-12-05', '09:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000133', 'M0022', 32345678, '2025-12-07', '10:00:00', 'No asistio','Diagnostico por realizar',1),

('T000134', 'M0023', 33456789, '2025-12-02', '10:00:00', 'Asistio','Consulta',1),
('T000135', 'M0023', 34567890, '2025-12-04', '11:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000136', 'M0023', 37890123, '2025-12-06', '12:00:00', 'No asistio','Diagnostico por realizar',1),

('T000137', 'M0024', 38901234, '2025-12-03', '07:00:00', 'Asistio','Consulta',1),
('T000138', 'M0024', 30123456, '2025-12-05', '08:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000139', 'M0024', 31234567, '2025-12-07', '09:00:00', 'No asistio','Diagnostico por realizar',1),

('T000140', 'M0025', 32345678, '2025-12-04', '09:00:00', 'Asistio','Consulta',1),
('T000141', 'M0025', 33456789, '2025-12-06', '10:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000142', 'M0025', 34567890, '2025-12-07', '11:00:00', 'No asistio','Diagnostico por realizar',1),

('T000143', 'M0026', 37890123, '2025-12-02', '12:00:00', 'Asistio','Consulta',1),
('T000144', 'M0026', 38901234, '2025-12-04', '13:00:00', 'A confirmar','Diagnostico por realizar',1),
('T000145', 'M0026', 30123456, '2025-12-06', '14:00:00', 'No asistio','Diagnostico por realizar',1);




