-- Creación de base de datos --
CREATE DATABASE AgendamientoCitas;  

--Creación de las tablas--
CCREATE TABLE Rol ( 
IdRol int (11) PRIMARY KEY AUTO_INCREMENT NOT null, 
NombreRol char (20)
);

CREATE TABLE Usuario(
ID_usu int (11) PRIMARY KEY AUTO_INCREMENT not null,
Nombre varchar(50), 
IDRol_Fk int (11) not null,
FOREIGN key (IdRol_Fk) REFERENCES Rol (IdRol)
);

Create table Horario (
ID_hora int (11) PRIMARY KEY AUTO_INCREMENT NOT null,
Fecha_hora date not null,
Hora_hora datetime not null
);

Create table Clinica (
ID_clinica int (11) PRIMARY KEY AUTO_INCREMENT NOT null,
Direccion_clin varchar (50) not null,
Nombre_clin varchar (50) not null,
Localidad_clin varchar (50) not null
);

CREATE TABLE Paciente(
ID_paci int (11) PRIMARY KEY AUTO_INCREMENT not null, 
NombrePaci varchar (50) not null, 
ApellidoPaci varchar (50) not null,
FechaNacimiento_paci date not null,
Telefono_paci int (12) not null, 
Email_paci varchar (100) not null,
TipoID_paci varchar (40)not null,
IDusu_FK int(11) not null,
FOREIGN key (IDusu_FK) REFERENCES Usuario (ID_usu )
);

CREATE TABLE Doctor(
ID_doc int (11) PRIMARY KEY AUTO_INCREMENT not null,
Nombre_doc varchar (50) not null,
Apellido_doc varchar (50) not null,
Telefono char (20)NOT null,
TipoDI_doc varchar (40) not null,
IDusu_FK int(11) not null,
FOREIGN key (IDusu_FK) REFERENCES Usuario (ID_usu ),
IDhora_FK int(11) not null,
FOREIGN key (IDhora_FK) REFERENCES Horario (ID_hora),
IDClinica_FK int(11) not null,
FOREIGN key (IDClinica_FK) REFERENCES Clinica (ID_clinica)
);

CREATE TABLE Cita(
ID_cita int (11) PRIMARY key AUTO_INCREMENT not null,
Paciente_FK int (11) not null,
FOREIGN key (Paciente_FK) REFERENCES Paciente (ID_paci),
Doctor_FK int (11) not null,
FOREIGN key (Doctor_FK) REFERENCES Doctor (ID_doc),
Horario_FK int (11) not null,
FOREIGN key (Horario_FK) REFERENCES Horario (ID_hora),
IDClinica_FK int(11) not null,
FOREIGN key (IDClinica_FK) REFERENCES Clinica (ID_clinica)
);

CREATE TABLE Historial(
ID_Histo int (11) PRIMARY key AUTO_INCREMENT not null,
Paciente_FK int (11) not null,
FOREIGN key (Paciente_FK) REFERENCES Paciente (ID_paci),
Doctor_FK int (11) not null,
FOREIGN key (Doctor_FK) REFERENCES Doctor (ID_doc),
Clinica_FK int (11) not null,
FOREIGN key (Clinica_FK) REFERENCES Clinica (ID_clinica),
Fecha_FK int (11) not null,
FOREIGN key (Fecha_FK) REFERENCES Horario (ID_hora),
Cita_FK int (11) not null,
FOREIGN key (Cita_FK) REFERENCES Cita (ID_cita)
);


--Insertar datos dentro de las tablas--

INSERT INTO `rol` (`IdRol`, `Rol`) VALUES
(1, 'Doctor'),
(2, 'Paciente');

INSERT INTO `usuario` (`ID_usu`, `Nombre`, `IDRol_Fk`) VALUES
(1, 'Usuario1', 1),
(2, 'Usuario2', 1),
(3, 'Usuario3', 1),
(4, 'Usuario4', 1),
(5, 'Usuario5', 1),
(6, 'Usuario6', 1),
(7, 'Usuario7', 1),
(8, 'Usuario8', 1),
(9, 'Usuario9', 1),
(10, 'Usuario10', 1),
(11, 'Usuario11', 2),
(12, 'Usuario12', 2),
(13, 'Usuario13', 2),
(14, 'Usuario14', 2),
(15, 'Usuario15', 2),
(16, 'Usuario16', 2),
(17, 'Usuario17', 2),
(18, 'Usuario18', 2),
(19, 'Usuario19', 2),
(20, 'Usuario20', 2);

INSERT INTO `horario` (`ID_hora`, `Fecha_hora`, `Hora`) VALUES
(1, '2023-04-26', '2023-04-26'),
(2, '2023-04-04', '2023-04-04'),
(3, '2023-04-01', '2023-04-01'),
(4, '2023-04-02', '2023-04-02'),
(5, '2023-04-05', '2023-04-26'),
(6, '2023-04-13', '2023-04-13'),
(7, '2023-04-30', '2023-04-30'),
(8, '2023-04-27', '2023-04-27'),
(9, '2023-04-12', '2023-04-12'),
(10, '2023-04-21', '2023-04-26');

INSERT INTO `clinica` (`ID_clinica`, `Direccion_FK`, `Nombre_clin`, `Localidad_clin`) VALUES
(1, 'Direccion1', 'Nombre1', 'Localidad1'),
(2, 'Direccion2', 'Nombre2', 'Localidad2'),
(3, 'Direccion3', 'Nombre3', 'Localidad3'),
(4, 'Direccion4', 'Nombre4', 'Localidad4'),
(5, 'Direccion5', 'Nombre5', 'Localidad5'),
(6, 'Direccion6', 'Nombre6', 'Localidad6'),
(7, 'Direccion7', 'Nombre7', 'Localidad7'),
(8, 'Direccion8', 'Nombre8', 'Localidad8'),
(9, 'Direccion9', 'Nombre9', 'Localidad9'),
(10, 'Direccion10', 'Nombre10', 'Localidad10');

INSERT INTO `paciente` (`ID_paci`, `Nombre_paci`, `ApellidoPaci`, `FechaNacimiento_paci`, `Telefono_paci`, `Email_paci`, `TipoID_paci`, `IDusu_FK`) VALUES
(498496, 'Nombre1', 'Apellido1', '2013-05-22', 1613134, 'correo1@gmail.com', 'TI', 11),
(3158461, 'Nombre6', 'Apellido6', '1993-01-06', 316461984, 'correo6@gmail.com', 'CC', 16),
(5468468, 'Nombre4', 'Apellido4', '1994-08-03', 364680845, 'correo4@gmail.com', 'CC', 14),
(13486418, 'Nombre2', 'Apellido2', '2005-04-01', 318461684, 'correo2@gmail.com', 'CC', 12),
(16846818, 'Nombre9', 'Apellido9', '1985-08-31', 315349648, 'correo9@gmail.com', 'CC', 19),
(31846184, 'Nombre8', 'Apellido8', '2023-01-02', 318648648, 'correo8@gmail.com', 'TI', 18),
(138161824, 'Nombre10', 'Apellido10', '2023-09-29', 31864654, 'correo10@gmail.com', 'TI', 20),
(348435215, 'Nombre5', 'Apellido5', '2013-09-13', 321841814, 'correo5@gmail.com', 'TI', 15),
(348948534, 'Nombre7', 'Apellido7', '1995-09-20', 314981894, 'correo7@gmail.com', 'CC', 17),
(889464165, 'Nombre3', 'Apellido3', '2014-04-09', 318463168, 'correo3@gmail.com', 'TI', 13);

INSERT INTO `doctor` (`ID_doc`, `Nombre_doc`, `Apellido_doc`, `Telefono_doc`, `TipoDI_doc`, `IDusu_FK`, `IDhora_FK`, `IDClinica_FK`) VALUES
(1, 'Nombre1', 'Apellido1', '3148468', 'CC', 1, 1, 1),
(2, 'Nombre2', 'Apellido2', '346841676', 'CC', 2, 2, 2),
(3, 'Nombre3', 'Apellido4', '16413463', 'CC', 3, 3, 3),
(4, 'Nombre4', 'Apellido4', '34684134', 'CC', 4, 4, 4),
(5, 'Nombre5', 'Apellido5', '4234683', 'CC', 5, 5, 5),
(6, 'Nombre6', 'Apellido6', '324437867', 'CC', 6, 6, 6),
(7, 'Nombre7', 'Apellido7', '3138468487', 'CC', 7, 7, 7),
(8, 'Nombre8', 'Apellido8', '1354357874', 'CC', 8, 8, 8),
(9, 'Nombre9', 'Apellido9', '311368746', 'CC', 9, 9, 9),
(10, 'Nombre10', 'Apellido10', '3134687468', 'CC', 10, 10, 10);

INSERT INTO `cita` (`ID_cita`, `Paciente_FK`, `Doctor_FK`, `Horario_FK`, `IDClinica_FK`) VALUES
(1, 498496, 1, 1, 1),
(2, 13486418, 2, 2, 2),
(3, 889464165, 3, 3, 3),
(4, 5468468, 4, 4, 4),
(5, 348435215, 5, 5, 5),
(6, 3158461, 6, 6, 6),
(7, 348948534, 7, 7, 7),
(8, 31846184, 8, 8, 8),
(9, 16846818, 9, 9, 9),
(10, 138161824, 10, 10, 10);

INSERT INTO `historial` (`ID_Histo`, `Paciente_FK`, `Doctor_FK`, `Clinica_FK`, `Fecha_FK`, `Cita_FK`) VALUES
(1, 498496, 1, 1, 1, 1),
(2, 13486418, 2, 2, 2, 2),
(3, 889464165, 3, 3, 3, 3),
(4, 5468468, 4, 4, 4, 4),
(5, 348435215, 5, 5, 5, 5),
(6, 3158461, 6, 6, 6, 6),
(7, 348948534, 7, 7, 7, 7),
(8, 31846184, 8, 8, 8, 8),
(9, 16846818, 9, 9, 9, 9),
(10, 138161824, 10, 10, 10, 10);


-- Consulta Cambiando el encabezado del campo--
Alter table `usuario` change `TipoRol` `Nombre` VARCHAR(50);
Alter table `rol` change `NombreRol` `Rol` VARCHAR(50);
Alter table `paciente` change `NombrePaci` ` Nombre_paci ` VARCHAR(50);
Alter table `doctor` change `Telefono` `Telefono_doc` char(20);
Alter table `cita` change `IDClinica_FK` `Clinica_Fk` VARCHAR(50);
Alter table `horario` change `Hora_hora` `Hora` date;
Alter table `clinica` change `Direccion_clin` `Direccion` VARCHAR(50);
Alter table `historia` change `Direccion` `Direccion_FK ` Int(11);

--raer los 5 primeros registros--
SELECT * FROM `rol` ORDER BY `idRol` ASC LIMIT 5;
SELECT * FROM `usuario` ORDER BY `ID_usu` ASC LIMIT 5;
SELECT * FROM `paciente` ORDER BY `Nombre_paci` ASC LIMIT 5;
SELECT * FROM `doctor` ORDER BY `ID_doc` ASC LIMIT 5;
SELECT * FROM `cita` ORDER BY `ID_cita` ASC LIMIT 5;
SELECT * FROM `horario` ORDER BY `ID_hora` ASC LIMIT 5;
SELECT * FROM `clinica` ORDER BY `ID_clinica` ASC LIMIT 5;
SELECT * FROM `historial` ORDER BY `ID_Histo` ASC LIMIT 5;

--Contar cuantos registros tienen un ID par--
SELECT `ID_usu` FROM `usuario` where `ID_usu` % 2 = 0; 
SELECT `idRol ` FROM `rol` where `idRol` % 2 = 0;
SELECT `ID_paci` FROM `paciente` where `ID_paci` % 2 = 0;
SELECT `ID_doc` FROM `doctor` where `ID_doc` % 2 = 0;
SELECT `ID_cita` FROM `cita` where `ID_cita` % 2 = 0;
SELECT `ID_hora` FROM `horario` where `ID_hora` % 2 = 0;
SELECT `ID_clinica` FROM `clinica` where `ID_clinica` % 2 = 0;
SELECT `ID_Histo` FROM `historial` where `ID_Histo` % 2 = 0;

--Realizar una su consulta 2 tablas en 1--
SELECT * from usuario inner join rol;