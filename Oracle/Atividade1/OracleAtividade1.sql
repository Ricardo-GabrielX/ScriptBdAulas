CREATE TABLE Socios(
    Codigo NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- O jeito moderno do Oracle fazer autoincremento
    Nome VARCHAR2(40) NOT NULL,
    Telefone VARCHAR2(20) NOT NULL,
    Lograd VARCHAR2(30) NOT NULL,
    Complem VARCHAR2(15),
    Bairro VARCHAR2(15),
    Cidade VARCHAR2(20),
    UF VARCHAR2(2),
    CEP VARCHAR2(8)
);


CREATE TABLE Assuntos (
    Codigo NUMBER PRIMARY KEY,
    Nome VARCHAR2(40) NOT NULL UNIQUE
);
     
CREATE TABLE Autores (
    Codigo NUMBER PRIMARY KEY,
    Nome VARCHAR2(40) NOT NULL,
    Origem VARCHAR2(20) NOT NULL
);

CREATE TABLE Livros (
    Id VARCHAR2(15) PRIMARY KEY,
    Titulo VARCHAR2(80) NOT NULL,
    Editora VARCHAR2(20)NOT NULL,
    TotPag NUMBER CHECK (TotPag > 0), -- Adicionar condição: in===t > 0
    DiasPrazo NUMBER CHECK (DiasPrazo >= 0),
    codAssunto NUMBER NOT NULL,
    
    CONSTRAINT FK_Livros_Assunto FOREIGN KEY(codAssunto) REFERENCES Assuntos(Codigo)
);

 
CREATE TABLE Autorias(
    IdLivro VARCHAR2(15),
    codAutor NUMBER,
    
    CONSTRAINT PK_Autorias PRIMARY KEY(IdLivro, codAutor),
    CONSTRAINT FK_Autorias_IdLivro FOREIGN KEY(IdLivro) REFERENCES Livros(Id),
    CONSTRAINT FK_Autorias_Autor FOREIGN KEY(codAutor) REFERENCES Autores(Codigo)
);
 
CREATE TABLE Emprestimos (
    IdLivro VARCHAR2(15),
    CodSocio NUMBER,
    DtRetirada DATE NOT NULL,
    DtDevPrev DATE NOT NULL,
    DtDevReal DATE,
    VrMulta NUMBER(15, 2) CHECK (VrMulta >= 0),
    
    CONSTRAINT pk_Emprestimos PRIMARY KEY (IdLivro, CodSocio, DtRetirada),
    CONSTRAINT Fk_Emprestimos_Livro FOREIGN KEY(IdLivro) REFERENCES Livros(Id),
    CONSTRAINT FK_Emprestimos_Socio FOREIGN KEY(CodSocio) REFERENCES Socios(Codigo)

);
