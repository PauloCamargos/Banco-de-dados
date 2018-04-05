  CREATE SCHEMA listaUm;

  CREATE TABLE listaUm.TB_CATEGORIAS(
    idCategoria SERIAL PRIMARY KEY,
    tituloCategoria VARCHAR(40),
    descricaoCategoria VARCHAR(100),
    fgAtivo INTEGER DEFAULT 1
  );

  CREATE TABLE listaUm.TB_FORNECEDORES(
    idFornecedor SERIAL PRIMARY KEY,
    cnpj VARCHAR(20),
    razaoSocial VARCHAR(50),
    telefone VARCHAR(10),
    endereco VARCHAR(60),
    contato VARCHAR(30),
    fgAtivo INTEGER DEFAULT 1
  );

  CREATE TABLE listaUm.TB_PRODUTOS(
    idProduto SERIAL PRIMARY KEY,
    --FK idFornecedor
      idFornecedor INTEGER,
    -- FK idCategoria
    idCategoria INTEGER,
    nomeProduto VARCHAR(40),
    descricaoProduto VARCHAR(100),
    valorUnitario NUMERIC(7,2) CHECK (valorUnitario > 0),
    quantidade INTEGER,
    quantidadeEstoque INTEGER,
    quantidadeMinima INTEGER,
    fgAtivo INTEGER  DEFAULT 1,
    CONSTRAINT fk_idCategoria FOREIGN KEY (idCategoria) REFERENCES listaUm.TB_CATEGORIAS(idCategoria),
    CONSTRAINT fk_idFornecedor FOREIGN KEY (idFornecedor) REFERENCES listaUm.TB_FORNECEDORES(idFornecedor)
  );

  CREATE TABLE listaUm.TB_VENDEDORES(
    idVendedor SERIAL PRIMARY KEY,
    cpf VARCHAR(14),
    nome VARCHAR(40),
    carteiraTrabalho VARCHAR(5),
    telefone VARCHAR(10),
    dataAdmissao DATE,
    fgAtivo INTEGER DEFAULT 1
  );

  CREATE TABLE listaUm.TB_COMPRAS(
    idCompra SERIAL PRIMARY KEY,
    -- FK idFornecedor
    idFornecedor INTEGER,
    -- FK idProduto
    idProduto INTEGER,
    -- FK idCategoria
    idCategoria INTEGER,
    dataCompra DATE,
    valorTotal NUMERIC(15,2) CHECK (valorTotal > 0),
    quantidade INTEGER CHECK (quantidade > 0),
    fgAtivo INTEGER DEFAULT 1,
    CONSTRAINT fk_idFornecedor FOREIGN KEY (idFornecedor) REFERENCES listaUm.TB_FORNECEDORES(idFornecedor),
    CONSTRAINT fk_idProtudo FOREIGN KEY (idProduto) REFERENCES listaUm.TB_PRODUTOS(idProduto),
    CONSTRAINT fk_idCategoria FOREIGN KEY (idCategoria) REFERENCES listaUm.TB_CATEGORIAS(idCategoria)
  );

  CREATE TABLE listaUm.TB_VENDAS(
    idVenda SERIAL PRIMARY KEY,
    -- FK idVendedor
    idVendedor INTEGER,
    -- FK idCategoria
    idCategoria INTEGER,
    -- FK idProduto
    idProduto INTEGER,
    dataVenda DATE,
    valorTotal NUMERIC(15,2) CHECK (valorTotal > 0),
    quantidade INTEGER CHECK (quantidade > 0),
    fgAtivo INTEGER DEFAULT 1,
    CONSTRAINT fk_idVendedor FOREIGN KEY (idVendedor) REFERENCES listaUm.TB_VENDEDORES(idVendedor),
    CONSTRAINT fk_idCategoria FOREIGN KEY (idCategoria) REFERENCES listaUm.TB_CATEGORIAS(idCategoria),
    CONSTRAINT fk_idProtudo FOREIGN KEY (idProduto) REFERENCES listaUm.TB_PRODUTOS(idProduto)
  );

  INSERT INTO listaUm.TB_CATEGORIAS (tituloCategoria, descricaoCategoria) VALUES
    ('Brinquedos', 'Produtos infanto/juvenil'),
    ('Bebês e Cia', 'Produtos para bebês'),
    ('Casa e Decoração', 'Produtos para casa/lar'),
    ('Colecionáveis', 'Produtos destinados para colecionadores'),
    ('Construção e Ferramentas', 'Produtos para construção civil');

    INSERT INTO listaUm.TB_FORNECEDORES (cnpj, razaoSocial, telefone, endereco, contato) VALUES
      ('01.123.456/0001-1', 'Nome da Empresa 1', '2134567827', 'Av. Nove de Julho, 520', 'contato_1@gmail.com'),
      ('01.654.456/0001-2', 'Nome da Empresa 2', '2131237850', 'Av. João Pessoa, 53', 'contato_2@hotmail.com'),
      ('01.246.456/0001-3', 'Nome da Empresa 3', '2134120987', 'Av. Floriano Peixoto, 15', 'contato_3@gmail.com'),
      ('01.623.456/0001-5', 'Nome da Empresa 4', '2134665085', 'Av. João naves de Ávila, 609', 'contato_4@hotmail.com'),
      ('01.463.456/0001-6', 'Nome da Empresa 5', '2134761287', 'Av. Rondon Pacheco, 191', 'contato_5@gmail.com'),
      ('01.709.456/0001-7', 'Nome da Empresa 6', '2134116781', 'Av. Piracicaba, 91', 'contato_6@gmail.com');

  INSERT INTO listaUm.TB_PRODUTOS (idFornecedor, idCategoria, nomeProduto, descricaoProduto, valorUnitario, quantidadeEstoque, quantidadeMinima) VALUES
    (5,2, 'Banheira para Bebê', 'Banheira de Banho de Bebê', 55.87, 7, 10),
    (4,2, 'Kit de Mágicas', 'Kit pequeno de mágicas', 89.90, 12, 15),
    (3,2, 'Tapeta', 'Tapete pequeno de chão', 15.64, 115, 50),
    (2,2, 'Selo', 'Selo 1987', 198.09, 200, 10),
    (1,2, 'Fechadura', 'Fechadura porta chave simples', 125.12, 50, 15),
    (1,2, 'Base de Cadeira', 'Base de cadeira para automóveis', 85.65, 3, 5),
    (2,2, 'Jogo Dominó', 'Jogo de dominó', 8.27, 145, 10),
    (4,2, 'Boneca', 'Bonecas russas de porcelana', 134.87, 115, 20);

  INSERT INTO listaUm.TB_VENDEDORES (cpf,nome, carteiraTrabalho, telefone, dataAdmissao) VALUES
    ('123.456.248-02', 'José Ferreira Guedes', '09821', '3212316542', '1967-12-09'),
    ('874.436.874-03', 'Fábio Morais', '06511', '3287639891', '1991-04-11'),
    ('835.763.417-04', 'Romildo Fulado', '54111', '3223477622', '1956-01-12'),
    ('158.237.317-05', 'Morty Rick', '01271', '3212313235', '1987-12-06'),
    ('373.054.418-06', 'Jamildo Robalo', '19251', '3243311891', '1985-02-12'),
    ('278.373.287-07', 'Gustavo Rampão', '01631', '3246319651', '1988-12-22');

  INSERT INTO listaUm.TB_COMPRAS (idFornecedor, idProduto, idCategoria, dataCompra, valorTotal, quantidade) VALUES
    (5,1,2,'2014-02-05', 167.65, 3),
    (5,1,2,'2013-05-12', 298.31, 7),
    (5,1,2,'2014-02-15', 541.62, 2),
    (5,1,2,'2012-03-13', 195.54, 2),
    (5,1,2,'2013-01-01', 91.12, 1),
    (5,1,2,'2011-06-11', 819.45, 3),
    (5,1,2,'2014-09-11', 819.23, 49),
    (5,1,2,'2014-10-15', 519.31, 13);

    INSERT INTO listaUm.TB_VENDAS (idVendedor, idCategoria, idProduto, dataVenda, valorTotal, quantidade) VALUES
      (5,2,1,'2014-03-03',446.96,8),
      (5,2,2,'2013-08-13',719.46,8),
      (4,3,3,'2013-05-13',74.92,4),
      (3,4,4,'2014-02-23',123.54,3),
      (2,5,5,'2014-06-13',398.12,2),
      (1,2,6,'2013-01-04',99.64,81),
      (1,1,7,'2014-02-12',89.36,10),
      (3,4,8,'2013-04-05',547.96,4),
      (1,4,4,'2014-05-15',198.75,2),
      (5,5,5,'2013-01-24',446.30,1);
