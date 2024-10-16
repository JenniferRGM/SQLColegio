CREATE DATABASE Colegio;
GO

USE Colegio;
GO
CREATE TABLE Escuela (
    EscuelaId INT PRIMARY KEY IDENTITY(1,1),
    NombreEscuela VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(1000),
    Direccion VARCHAR(50),
    Telefono VARCHAR(50),
    CodigoPostal VARCHAR(50),
    DireccionPostal VARCHAR(50)
);
CREATE TABLE Clase (
    ClaseId INT PRIMARY KEY IDENTITY(1,1),
    EscuelaId INT NOT NULL,
    NombreClase VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(1000),
    FOREIGN KEY (EscuelaId) REFERENCES Escuela(EscuelaId)
);
CREATE TABLE Curso (
    CursoId INT PRIMARY KEY IDENTITY(1,1),
    NombreCurso VARCHAR(50) NOT NULL,
    EscuelaId INT NOT NULL,
    Descripcion VARCHAR(1000),
    FOREIGN KEY (EscuelaId) REFERENCES Escuela(EscuelaId)
);
CREATE TABLE Estudiante (
    EstudianteId INT PRIMARY KEY IDENTITY(1,1),
    ClaseId INT NOT NULL,
    NombreEstudiante VARCHAR(100) NOT NULL,
    NumeroEstudiante VARCHAR(20) NOT NULL,
    NotaTotal FLOAT,
    Direccion VARCHAR(100),
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(100),
    FOREIGN KEY (ClaseId) REFERENCES Clase(ClaseId)
);
CREATE TABLE Profesor (
    ProfesorId INT PRIMARY KEY IDENTITY(1,1),
    EscuelaId INT NOT NULL,
    NombreProfesor VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(1000),
    FOREIGN KEY (EscuelaId) REFERENCES Escuela(EscuelaId)
);
CREATE TABLE Estudiante_Curso (
    EstudianteId INT NOT NULL,
    CursoId INT NOT NULL,
    PRIMARY KEY (EstudianteId, CursoId),
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId),
    FOREIGN KEY (CursoId) REFERENCES Curso(CursoId)
);
CREATE TABLE Profesor_Curso (
    ProfesorId INT NOT NULL,
    CursoId INT NOT NULL,
    PRIMARY KEY (ProfesorId, CursoId),
    FOREIGN KEY (ProfesorId) REFERENCES Profesor(ProfesorId),
    FOREIGN KEY (CursoId) REFERENCES Curso(CursoId)
);
CREATE TABLE Nota (
    NotaId INT PRIMARY KEY IDENTITY(1,1),
    EstudianteId INT NOT NULL,
    CursoId INT NOT NULL,
    Calificacion FLOAT NOT NULL,
    Comentario VARCHAR(1000),
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId),
    FOREIGN KEY (CursoId) REFERENCES Curso(CursoId)
);




