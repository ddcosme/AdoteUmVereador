CREATE TABLE [dbo].[Usuario] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [rg]             VARCHAR (8)   NOT NULL,
    [cpf]            VARCHAR (12)  NOT NULL,
    [nome]           VARCHAR (100) NOT NULL,
    [dataNascimento] DATETIME      NULL,
    [sexo]           CHAR (1)      NOT NULL,
    [email]          VARCHAR (100) NOT NULL,
    [municipio]      VARCHAR (50)  NOT NULL,
    [estado]         VARCHAR (2)   NOT NULL,
    [status]         INT           NOT NULL,
    [tipo]           INT           NOT NULL,
    [senha]          VARCHAR (20)  NOT NULL,
    [IdVereador] INT NOT NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC)
);




CREATE TABLE [dbo].[Estado]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [nome] NCHAR(50) NULL, 
    [sigla] VARCHAR(2) NULL
);



CREATE TABLE [dbo].[Camara]
(
	[Id] INT NOT NULL PRIMARY KEY, 
	[idEstado] INT NOT NULL,
    [nome] VARCHAR(100) NULL, 
    [municipio] VARCHAR(50) NULL, 
    FOREIGN KEY (idEstado) REFERENCES Estado(id)
);




CREATE TABLE Vereador(id int NOT NULL PRIMARY KEY IDENTITY,
                    idUsuario int,
		            idCamara int,
                    partidoPulitico varchar(20),
                    dataFiliacao Date,
                    anoUltimaEleicao int,
                    FOREIGN KEY (idUsuario) REFERENCES Usuario(Id),
                    FOREIGN KEY (idCamara) REFERENCES Camara(id)
);








CREATE TABLE Moderador(id int NOT NULL PRIMARY KEY IDENTITY,
                    idUsuarioo int,
                    filiadoPartido int,
                    dataPrimeiraModeracao Date,
                    entidade varchar(50),
                    FOREIGN KEY (idUsuarioo) REFERENCES Usuario(id),
                    CONSTRAINT idUsuarioo UNIQUE(idUsuarioo)
);










CREATE TABLE Administrador(id int NOT NULL PRIMARY KEY IDENTITY,
                    email varchar(100),
                    senha varchar(20),
                    
);








CREATE TABLE TipoEncaminhamento(id int NOT NULL PRIMARY KEY IDENTITY,
                    nome varchar(20)
					
					
);





CREATE TABLE Encaminhamento(id int NOT NULL PRIMARY KEY IDENTITY,
                    dataEnc Date,
					anexo varchar(100),
					descricao varchar(500),
					status int,
					idTipoEnc int,
					idVereador int,
					idCidadao int,
					FOREIGN KEY (idTipoEnc) REFERENCES TipoEncaminhamento(id),
					FOREIGN KEY (idVereador) REFERENCES Vereador(id),
					FOREIGN KEY (idCidadao) REFERENCES Usuario(Id)

);








CREATE TABLE EventoEncaminhamento(id int NOT NULL PRIMARY KEY IDENTITY,
                    relator varchar(20),  /*vereador ou cidadao */
					dataEnc Date,
					descricao varchar(500),
					anexo varchar(100),
					idEnc int,
					FOREIGN KEY (idEnc) REFERENCES Encaminhamento(id)
); 






CREATE TABLE Moderacao(id int NOT NULL PRIMARY KEY IDENTITY,
                    dataInicio Date,
					dataFinal Date,
					descricao varchar(500),
					tipoModeracao varchar(10),
					idModerador int,
					idEncaminhamento int,
					FOREIGN KEY (idModerador) REFERENCES Moderador(id),
					FOREIGN KEY (idEncaminhamento) REFERENCES Encaminhamento(id)
					
); 





CREATE TABLE [dbo].[Municipio]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [cidade] VARCHAR(50) NOT NULL, 
    [UF] VARCHAR(2) NOT NULL
)




/* adicionar no usuario: */
FOREIGN KEY (IdVereador) REFERENCES Vereador(id),





CREATE TABLE [dbo].[RespostaPadraoVereador]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [assunto] VARCHAR(50) NOT NULL, 
    [descricaoRespsta] VARCHAR(500) NOT NULL,
	[idVereador] INT NOT NULL
)












































