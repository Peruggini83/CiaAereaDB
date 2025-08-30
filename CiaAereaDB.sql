CREATE DATABASE CiaAereaDB;
GO
USE CiaAereaDB;
GO


CREATE TABLE Passageiros (
    PassageiroID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100),
    Documento NVARCHAR(20)
);
GO


CREATE TABLE Aeroportos (
    AeroportoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100),
    Cidade NVARCHAR(50),
    Pais NVARCHAR(50)
);
GO


CREATE TABLE Voos (
    VooID INT IDENTITY(1,1) PRIMARY KEY,
    CodigoVoo NVARCHAR(10),
    AeroportoOrigemID INT NOT NULL,
    AeroportoDestinoID INT NOT NULL,
    DataVoo DATE,
    HoraSaida TIME,
    HoraChegada TIME,
    CONSTRAINT FK_Voos_Origem FOREIGN KEY (AeroportoOrigemID) REFERENCES Aeroportos(AeroportoID),
    CONSTRAINT FK_Voos_Destino FOREIGN KEY (AeroportoDestinoID) REFERENCES Aeroportos(AeroportoID)
);
GO


CREATE TABLE Reservas (
    ReservaID INT IDENTITY(1,1) PRIMARY KEY,
    PassageiroID INT NOT NULL,
    VooID INT NOT NULL,
    Assento NVARCHAR(5),
    DataReserva DATE,
    CONSTRAINT FK_Reservas_Passageiros FOREIGN KEY (PassageiroID) REFERENCES Passageiros(PassageiroID),
    CONSTRAINT FK_Reservas_Voos FOREIGN KEY (VooID) REFERENCES Voos(VooID)
);
GO


INSERT INTO Passageiros (Nome, Email, Documento) VALUES
('João Silva', 'joao@email.com', '123456789'),
('Maria Oliveira', 'maria@email.com', '987654321'),
('Carlos Pereira', 'carlos@email.com', '456123789');
GO

INSERT INTO Aeroportos (Nome, Cidade, Pais) VALUES
('Aeroporto Internacional de São Paulo', 'São Paulo', 'Brasil'),
('Aeroporto Internacional do Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
('Aeroporto Internacional de Lisboa', 'Lisboa', 'Portugal'),
('Aeroporto Internacional de Miami', 'Miami', 'EUA');
GO

INSERT INTO Voos (CodigoVoo, AeroportoOrigemID, AeroportoDestinoID, DataVoo, HoraSaida, HoraChegada) VALUES
('AA101', 1, 2, '2025-09-01', '08:00', '09:30'),
('AA102', 2, 1, '2025-09-02', '14:00', '15:30'),
('AA201', 1, 3, '2025-09-05', '20:00', '06:00'),
('AA301', 3, 4, '2025-09-10', '10:00', '14:00');
GO

INSERT INTO Reservas (PassageiroID, VooID, Assento, DataReserva) VALUES
(1, 1, '12A', '2025-08-20'),
(2, 1, '12B', '2025-08-21'),
(3, 3, '14C', '2025-08-22'),
(1, 4, '10D', '2025-08-23');
GO
