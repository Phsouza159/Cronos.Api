/*

*/

create database `cronos.db`;

use `cronos.db`;

CREATE TABLE  IF NOT EXISTS `CRONOS_001_USUARIO`(
	ID int not NULL
    , NOME VARCHAR(25) NULL 
    , SOBRENOME VARCHAR(25) NULL
    , NM_USER VARCHAR(25) NULL
    , SENHA VARCHAR(255) NULL
    , EMAIL VARCHAR(50) NULL
    , ID_SALARIO INT NULL
    , ID_TOKIEN INT NULL
    , DTH_INCLUSAO DATETIME NULL 
	, SITUACAO bit not NULL 
) ENGINE = INNODB;

CREATE TABLE if not EXISTS `CRONOS_002_LIVRO`
( 
	ID int not NULL 
    , TITULO varchar(35) NULL 
	, AUTOR varchar(35) NULL 
	, VALOR DOUBLE null 
	, NUM_PGS INT null 

	, DTH_INCLUSAO DATETIME NULL 
	, SITUACAO bit not NULL 

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `CRONOS_003_GASTO`(
	ID INT NOT NULL
    , ID_USUARIO INT NULL
    , MES_REFERENCIA DATETIME NULL 
    , GASTO_NAME VARCHAR(45) NULL
    , VALOR_GASTO DOUBLE NULL
    , ID_STATUS INT NULL

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `CRONOS_004_SALARIO`(
	ID INT NOT NULL
	, SOUDO_BRUTO DOUBLE NULL
    , SOUDO_LIQUIDO DOUBLE NULL
    , DTH_PAGAMENTO DATETIME NULL
    , DTH_INCLUSAO DATETIME NULL 
	, SITUACAO BIT NOT NULL 
    
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `CRONOS_005_AUTENTIFICACAO` (
	ID INT NOT NULL
    , TOKIEN VARCHAR(255) NULL
    , DTH_EXPIRACAO DATETIME NULL
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS `CRONOS_101_USUARIO_LIVRO`(
	ID INT NOT NULL
    , ID_USUARIO INT NULL
	, ID_LIVRO INT NULL
	, DTH_LEITURA_INICIO DATETIME NULL 
	, DTH_LEITURA_FIM DATETIME NULL 
	, LIDO bit NULL 
    , DTH_INCLUSAO DATETIME NULL 
	, SITUACAO BIT NOT NULL 
) ENGINE = INNODB;

-- Chaves primarias
ALTER TABLE `CRONOS_001_USUARIO` 	ADD CONSTRAINT CR_PK_001 PRIMARY KEY (`ID`);
ALTER TABLE `CRONOS_002_LIVRO` 		ADD CONSTRAINT CR_PK_002 PRIMARY KEY (`ID`);
ALTER TABLE `CRONOS_003_GASTO` 		ADD CONSTRAINT CR_PK_003 PRIMARY KEY (`ID`);
ALTER TABLE `CRONOS_004_SALARIO` 	ADD CONSTRAINT CR_PK_004 PRIMARY KEY (`ID`);
ALTER TABLE `CRONOS_005_AUTENTIFICACAO` ADD CONSTRAINT CR_PK_005 PRIMARY KEY (`ID`);

ALTER TABLE `CRONOS_101_USUARIO_LIVRO` 	ADD CONSTRAINT CR_PK_004 PRIMARY KEY AUTO_INCREMENT (`ID`);


-- Chaves estrangeiras
ALTER TABLE `CRONOS_001_USUARIO`	ADD CONSTRAINT CR_FK_001_004 FOREIGN KEY (`ID_SALARIO`) REFERENCES `CRONOS_004_SALARIO`(`ID`);
ALTER TABLE `CRONOS_001_USUARIO`	ADD CONSTRAINT CR_FK_001_005 FOREIGN KEY (`ID_TOKIEN`)  REFERENCES `CRONOS_005_AUTENTIFICACAO`(`ID`);
ALTER TABLE `CRONOS_003_GASTO`		ADD CONSTRAINT CR_FK_003_001 FOREIGN KEY (`ID_USUARIO`) REFERENCES `CRONOS_001_USUARIO`(`ID`);

-- RELACIONAMENTOS 
ALTER TABLE `CRONOS_101_USUARIO_LIVRO`	ADD CONSTRAINT CR_FK_101_001 FOREIGN KEY (`ID_USUARIO`) REFERENCES `CRONOS_001_USUARIO`(`ID`);
ALTER TABLE `CRONOS_101_USUARIO_LIVRO`	ADD CONSTRAINT CR_FK_101_002 FOREIGN KEY (`ID_LIVRO`) 	REFERENCES `CRONOS_002_LIVRO`(`ID`);


-- INCREMENTE
ALTER TABLE `CRONOS_001_USUARIO` 		CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `CRONOS_002_LIVRO` 			CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `CRONOS_003_GASTO` 			CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `CRONOS_004_SALARIO` 		CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `CRONOS_005_AUTENTIFICACAO` CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `CRONOS_101_USUARIO_LIVRO`	CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT;




