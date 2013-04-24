------------------------------------------------
-- Export file for user DDW                   --
-- Created by Usuario on 16/02/2013, 10:03:11 --
------------------------------------------------

spool backup_citrinoweb_16-02.log

prompt
prompt Creating table CATEG_ENTIDADE
prompt =============================
prompt
create table DDW.CATEG_ENTIDADE
(
  CATENTCODESTR VARCHAR2(30) not null,
  CATENTDESC    VARCHAR2(100) not null,
  USUCOD        NUMBER,
  CATENTCLA     VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.CATEG_ENTIDADE.CATENTCLA
  is 'Classifica��o:
OUT - OUTROS
CLI - CLIENTES
FOR - FORNECEDORES
TRA - TRANSPORTADORAS
REP - REPRESENTANTES (VENDEDORES)
FUN - FUNCION�RIOS';
alter table DDW.CATEG_ENTIDADE
  add constraint PK_CATEG_ENTIDADE primary key (CATENTCODESTR)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table UF
prompt =================
prompt
create table DDW.UF
(
  UFCOD     NUMBER not null,
  UFNOM     VARCHAR2(60) not null,
  UFCODPAIS VARCHAR2(4) not null,
  UFABREV   VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.UF
  add constraint PK_UF primary key (UFCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.UF
  add constraint UK_UF_ABREV unique (UFABREV)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.UF
  add constraint UK_UF_NOME unique (UFNOM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CIDADE
prompt =====================
prompt
create table DDW.CIDADE
(
  CIDCOD   NUMBER not null,
  CIDNOM   VARCHAR2(100),
  CIDNAC   NUMBER,
  CIDIBG   NUMBER,
  CIDUFCOD NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.CIDADE.CIDCOD
  is 'C�digo da Cidade';
comment on column DDW.CIDADE.CIDNOM
  is 'Nome da Cidade';
comment on column DDW.CIDADE.CIDNAC
  is 'C�digo Nacional';
comment on column DDW.CIDADE.CIDIBG
  is 'C�digo IBGE';
comment on column DDW.CIDADE.CIDUFCOD
  is 'C�digo da UF';
alter table DDW.CIDADE
  add constraint PK_CIDADE primary key (CIDCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.CIDADE
  add constraint FK_CIDADE_UF foreign key (CIDUFCOD)
  references DDW.UF (UFCOD);

prompt
prompt Creating table USUARIO
prompt ======================
prompt
create table DDW.USUARIO
(
  USUCOD    NUMBER not null,
  USUNOM    VARCHAR2(12) not null,
  USUPASS   VARCHAR2(8) not null,
  USUCAR    VARCHAR2(50),
  USUGRUCOD NUMBER,
  USUSTA    NUMBER default 1
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.USUARIO.USUCOD
  is 'C�digo do Usu�rio';
comment on column DDW.USUARIO.USUNOM
  is 'Nome do Usu�rio';
comment on column DDW.USUARIO.USUPASS
  is 'Senha do Usu�rio';
comment on column DDW.USUARIO.USUCAR
  is 'Cargo do Usu�rio';
comment on column DDW.USUARIO.USUGRUCOD
  is 'C�digo do Grupo';
comment on column DDW.USUARIO.USUSTA
  is 'Status do Usu�rio [1 - Ativo, 2- Inativo]';
alter table DDW.USUARIO
  add constraint PK_USUARIO primary key (USUCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.USUARIO
  add constraint UK_USUNOM unique (USUNOM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.USUARIO
  add constraint FK_USUGRUCOD foreign key (USUGRUCOD)
  references DDW.USUARIO_GRUPO (USUGRUCOD);

prompt
prompt Creating table USUARIO_GRUPO
prompt ============================
prompt
create table DDW.USUARIO_GRUPO
(
  USUGRUCOD  NUMBER not null,
  USUGRUDESC VARCHAR2(100) not null,
  USUCOD     NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.USUARIO_GRUPO.USUGRUCOD
  is 'C�digo do Grupo';
comment on column DDW.USUARIO_GRUPO.USUGRUDESC
  is 'Descri��o';
comment on column DDW.USUARIO_GRUPO.USUCOD
  is 'Usu�rio';
alter table DDW.USUARIO_GRUPO
  add constraint PK_USUARIO_GRUPO primary key (USUGRUCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.USUARIO_GRUPO
  add constraint FK_USU_GRU_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table COND_PAG
prompt =======================
prompt
create table DDW.COND_PAG
(
  CONPAGCOD       NUMBER not null,
  CONPAGDEN       VARCHAR2(100) not null,
  CONPAGQTDPAR    NUMBER not null,
  CONPAGDIAPAR    NUMBER not null,
  CONPAGDIAPRIPAR NUMBER not null,
  USUCOD          NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.COND_PAG.CONPAGCOD
  is 'C�digo';
comment on column DDW.COND_PAG.CONPAGDEN
  is 'Denomina��o';
comment on column DDW.COND_PAG.CONPAGQTDPAR
  is 'Quantidade de Parcelas';
comment on column DDW.COND_PAG.CONPAGDIAPAR
  is 'Dias entre as parcelas';
comment on column DDW.COND_PAG.CONPAGDIAPRIPAR
  is 'Dias para a primeira parcela';
comment on column DDW.COND_PAG.USUCOD
  is 'Usu�rio';
alter table DDW.COND_PAG
  add constraint PK_COND_PAG primary key (CONPAGCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.COND_PAG
  add constraint FK_COND_PAG_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table COND_PAG_PARC
prompt ============================
prompt
create table DDW.COND_PAG_PARC
(
  CONPAGCOD    NUMBER not null,
  CONPAGPARSEQ NUMBER not null,
  CONPAGPARDIA NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.COND_PAG_PARC.CONPAGCOD
  is 'Condi��o de Pagto';
comment on column DDW.COND_PAG_PARC.CONPAGPARSEQ
  is 'Sequencia';
comment on column DDW.COND_PAG_PARC.CONPAGPARDIA
  is 'Dia da parcela';
alter table DDW.COND_PAG_PARC
  add constraint PK_COND_PAG_PARC primary key (CONPAGCOD, CONPAGPARSEQ)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.COND_PAG_PARC
  add constraint FK_COND_PAG_PARC_CP foreign key (CONPAGCOD)
  references DDW.COND_PAG (CONPAGCOD);

prompt
prompt Creating table EMPRESA
prompt ======================
prompt
create table DDW.EMPRESA
(
  EMPCOD       NUMBER not null,
  EMPNOM       VARCHAR2(100) not null,
  EMPNOMFAN    VARCHAR2(100),
  EMPDATCAD    DATE not null,
  EMPSIG       VARCHAR2(20),
  EMPCNP       VARCHAR2(15),
  EMPIE        VARCHAR2(15),
  EMPEND       VARCHAR2(150),
  EMPBAI       VARCHAR2(30),
  EMPENDCOM    VARCHAR2(50),
  EMPENDNUM    VARCHAR2(10),
  EMPCEP       VARCHAR2(8),
  EMPTEL       VARCHAR2(40),
  CIDCOD       NUMBER,
  EMPEMA       VARCHAR2(100),
  EMPHOM       VARCHAR2(100),
  EMPINDVALMIN NUMBER(5,2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.EMPRESA.EMPCOD
  is 'C�digo';
comment on column DDW.EMPRESA.EMPNOM
  is 'Raz�o Social da Empresa';
comment on column DDW.EMPRESA.EMPNOMFAN
  is 'Nome Fantasia da Empresa';
comment on column DDW.EMPRESA.EMPDATCAD
  is 'Data do Cadastro da Empresa';
comment on column DDW.EMPRESA.EMPSIG
  is 'Sigla da Empresa';
comment on column DDW.EMPRESA.EMPCNP
  is 'CNPJ';
comment on column DDW.EMPRESA.EMPIE
  is 'Inscri��o estadual';
comment on column DDW.EMPRESA.EMPEND
  is 'Endere�o';
comment on column DDW.EMPRESA.EMPBAI
  is 'Bairro';
comment on column DDW.EMPRESA.EMPENDCOM
  is 'Complemento do Endere�o';
comment on column DDW.EMPRESA.EMPENDNUM
  is 'N�mero do Endere�o';
comment on column DDW.EMPRESA.EMPCEP
  is 'CEP';
comment on column DDW.EMPRESA.EMPTEL
  is 'TELEFONE';
comment on column DDW.EMPRESA.CIDCOD
  is 'Codigo da Cidade';
comment on column DDW.EMPRESA.EMPEMA
  is 'EMAIL';
comment on column DDW.EMPRESA.EMPHOM
  is 'SITE';
comment on column DDW.EMPRESA.EMPINDVALMIN
  is 'Indice para valor de venda minimo';
alter table DDW.EMPRESA
  add constraint PK_EMPRESA primary key (EMPCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.EMPRESA
  add constraint FK_EMPRESA_CIDADE foreign key (CIDCOD)
  references DDW.CIDADE (CIDCOD);

prompt
prompt Creating table ENTIDADE
prompt =======================
prompt
create table DDW.ENTIDADE
(
  ENTCOD        NUMBER not null,
  ENTNOM        VARCHAR2(150) not null,
  ENTNOMFAN     VARCHAR2(150),
  ENTEND        VARCHAR2(200),
  ENTNUM        VARCHAR2(10),
  ENTBAI        VARCHAR2(50),
  ENTCEP        VARCHAR2(8),
  CIDCOD        NUMBER,
  ENTCNPJCPF    VARCHAR2(14),
  ENTINSEST     VARCHAR2(20),
  ENTDATCAD     DATE not null,
  ENTHOMPAG     VARCHAR2(255),
  USUCOD        NUMBER not null,
  CATENTCODESTR VARCHAR2(30) not null,
  ENTNOMMAE     VARCHAR2(150),
  ENTNOMPAI     VARCHAR2(150),
  ENTRG         VARCHAR2(10),
  ENTEMA        VARCHAR2(255),
  ENTLOCTRA     VARCHAR2(200),
  ENTENDTRA     VARCHAR2(200),
  ENTATI        NUMBER default 1 not null,
  ENTPRO        VARCHAR2(50),
  ENTDATNAS     DATE,
  ENTTIPPES     VARCHAR2(8),
  ENTCON        VARCHAR2(50),
  ENTENDCOB     VARCHAR2(200),
  ENTNUMCOB     VARCHAR2(10),
  ENTBAICOB     VARCHAR2(50),
  ENTCEPCOB     VARCHAR2(8),
  CIDCODCOB     NUMBER,
  ENTTEXLIV     VARCHAR2(4000),
  ENTLIMCRE     NUMBER(15,2),
  ENTDATCONCRE  DATE,
  ENTGER        VARCHAR2(50),
  ENTBLO        NUMBER,
  ENTCOMPRA     NUMBER,
  ENTESTCIV     VARCHAR2(15),
  ENTSALTRA     NUMBER(15,2),
  ENTTEMTRA     VARCHAR2(10),
  ENTNOMCON     VARCHAR2(150),
  ENTCPFCON     VARCHAR2(11),
  ENTRGCON      VARCHAR2(10),
  ENTLOCTRACON  VARCHAR2(50),
  ENTTEMTRACON  VARCHAR2(10),
  ENTSALCON     NUMBER(15,2),
  ENTRESCONCRE  VARCHAR2(100),
  ENTCODVEN     VARCHAR2(10),
  ENTPRCPAG     VARCHAR2(50),
  ENTENDCOM     VARCHAR2(100),
  CFOCOD        NUMBER,
  ENTREPCOM     NUMBER(15,5),
  ENTCODREP     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.ENTIDADE.ENTCOD
  is 'C�digo';
comment on column DDW.ENTIDADE.ENTNOM
  is 'Nome';
comment on column DDW.ENTIDADE.ENTNOMFAN
  is 'Nome Fantasia';
comment on column DDW.ENTIDADE.ENTEND
  is 'Endere�o';
comment on column DDW.ENTIDADE.ENTNUM
  is 'N�mero';
comment on column DDW.ENTIDADE.ENTBAI
  is 'Bairro';
comment on column DDW.ENTIDADE.ENTCEP
  is 'CEP';
comment on column DDW.ENTIDADE.CIDCOD
  is 'Cidade';
comment on column DDW.ENTIDADE.ENTCNPJCPF
  is 'CNPJ / CPF';
comment on column DDW.ENTIDADE.ENTINSEST
  is 'Inscri��o Estadual';
comment on column DDW.ENTIDADE.ENTDATCAD
  is 'Data de Cadastro';
comment on column DDW.ENTIDADE.ENTHOMPAG
  is 'Home Page';
comment on column DDW.ENTIDADE.USUCOD
  is 'Usu�rio';
comment on column DDW.ENTIDADE.CATENTCODESTR
  is 'C�digo da Categoria';
comment on column DDW.ENTIDADE.ENTNOMMAE
  is 'Nome da M�e';
comment on column DDW.ENTIDADE.ENTNOMPAI
  is 'Nome do Pai';
comment on column DDW.ENTIDADE.ENTRG
  is 'RG';
comment on column DDW.ENTIDADE.ENTEMA
  is 'E-Mail';
comment on column DDW.ENTIDADE.ENTLOCTRA
  is 'Local de Trabalho';
comment on column DDW.ENTIDADE.ENTENDTRA
  is 'Endere�o de Trabalho';
comment on column DDW.ENTIDADE.ENTATI
  is 'Entidade Ativo [1 (Sim), 2 (N�o)]';
comment on column DDW.ENTIDADE.ENTPRO
  is 'Profiss�o';
comment on column DDW.ENTIDADE.ENTDATNAS
  is 'Data de Nascimento';
comment on column DDW.ENTIDADE.ENTTIPPES
  is 'Tipo de Pessoa [F�sica, Jur�dica]';
comment on column DDW.ENTIDADE.ENTCON
  is 'Contato';
comment on column DDW.ENTIDADE.ENTENDCOB
  is 'Endere�o de Cobran�a';
comment on column DDW.ENTIDADE.ENTNUMCOB
  is 'N�mero Endere�o de Cobran�a';
comment on column DDW.ENTIDADE.ENTBAICOB
  is 'Bairro de Cobran�a';
comment on column DDW.ENTIDADE.ENTCEPCOB
  is 'CEP de Cobran�a';
comment on column DDW.ENTIDADE.CIDCODCOB
  is 'Cidade de Cobran�a';
comment on column DDW.ENTIDADE.ENTTEXLIV
  is 'Texto Livre';
comment on column DDW.ENTIDADE.ENTLIMCRE
  is 'Limite de Cr�dito';
comment on column DDW.ENTIDADE.ENTDATCONCRE
  is 'Data Consulta de Cr�dito';
comment on column DDW.ENTIDADE.ENTGER
  is 'Gerente de Atendimento';
comment on column DDW.ENTIDADE.ENTBLO
  is 'Bloqueado [1 (Sim), 2 (N�o)]';
comment on column DDW.ENTIDADE.ENTCOMPRA
  is 'Compra � Prazo [1 (Sim), 2 (N�o)]';
comment on column DDW.ENTIDADE.ENTESTCIV
  is 'Estado Civil';
comment on column DDW.ENTIDADE.ENTSALTRA
  is 'Sal�rio';
comment on column DDW.ENTIDADE.ENTTEMTRA
  is 'Tempo de Trabalho';
comment on column DDW.ENTIDADE.ENTNOMCON
  is 'Nome do Conjuge';
comment on column DDW.ENTIDADE.ENTCPFCON
  is 'CPF do Conjuge';
comment on column DDW.ENTIDADE.ENTRGCON
  is 'RG do Conjuge';
comment on column DDW.ENTIDADE.ENTLOCTRACON
  is 'Local de Trabalho do Conjuge';
comment on column DDW.ENTIDADE.ENTTEMTRACON
  is 'Tempo de Trabalho do Conjuge';
comment on column DDW.ENTIDADE.ENTSALCON
  is 'Sal�rio do Conjuge';
comment on column DDW.ENTIDADE.ENTRESCONCRE
  is 'Resposta da Consulta de Cr�dito';
comment on column DDW.ENTIDADE.ENTCODVEN
  is 'C�digo utilizado apenas para vendedores';
comment on column DDW.ENTIDADE.ENTPRCPAG
  is 'Pra�a de Pagamento para o relat�rio de duplicata.';
comment on column DDW.ENTIDADE.ENTENDCOM
  is 'Endere�o - Complemento';
comment on column DDW.ENTIDADE.CFOCOD
  is 'CFOP Padr�o da Entidade';
comment on column DDW.ENTIDADE.ENTREPCOM
  is 'Percentual de Comiss�o do Representante';
comment on column DDW.ENTIDADE.ENTCODREP
  is 'C�digo do representante';
alter table DDW.ENTIDADE
  add constraint PK_ENTIDADE primary key (ENTCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.ENTIDADE
  add constraint FK_ENTIDADE_CATEG_ENTIDADE foreign key (CATENTCODESTR)
  references DDW.CATEG_ENTIDADE (CATENTCODESTR);
alter table DDW.ENTIDADE
  add constraint FK_ENTIDADE_CIDADE foreign key (CIDCOD)
  references DDW.CIDADE (CIDCOD);
alter table DDW.ENTIDADE
  add constraint FK_ENTIDADE_CIDADE_COB foreign key (CIDCODCOB)
  references DDW.CIDADE (CIDCOD);
alter table DDW.ENTIDADE
  add constraint FK_ENTIDADE_REPRES foreign key (ENTCODREP)
  references DDW.ENTIDADE (ENTCOD);
alter table DDW.ENTIDADE
  add constraint FK_ENTIDADE_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);
alter table DDW.ENTIDADE
  add constraint CHK_ENTIDADE_ENTATI
  check (EntAti in (1,2));

prompt
prompt Creating table ENT_FONE
prompt =======================
prompt
create table DDW.ENT_FONE
(
  ENTCOD     NUMBER not null,
  ENTFONNUM  VARCHAR2(15) not null,
  ENTFONDESC VARCHAR2(50),
  ENTFONTIP  VARCHAR2(50),
  USUCOD     NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.ENT_FONE.ENTFONNUM
  is 'N�mero';
comment on column DDW.ENT_FONE.ENTFONDESC
  is 'Descri��o';
comment on column DDW.ENT_FONE.ENTFONTIP
  is 'Tipo [Residencial, Comercial...]';
comment on column DDW.ENT_FONE.USUCOD
  is 'Usu�rio';
alter table DDW.ENT_FONE
  add constraint PK_ENT_FONE primary key (ENTCOD, ENTFONNUM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.ENT_FONE
  add constraint FK_ENT_FONE_ENTIDADE foreign key (ENTCOD)
  references DDW.ENTIDADE (ENTCOD) on delete cascade;

prompt
prompt Creating table PRODUTO_GRUPO
prompt ============================
prompt
create table DDW.PRODUTO_GRUPO
(
  EMPCOD    NUMBER not null,
  PROGRUCOD NUMBER not null,
  PROGRUDEN VARCHAR2(50) not null,
  USUCOD    NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.PRODUTO_GRUPO.EMPCOD
  is 'C�digo da Empresa';
comment on column DDW.PRODUTO_GRUPO.PROGRUCOD
  is 'C�digo do Grupo';
comment on column DDW.PRODUTO_GRUPO.PROGRUDEN
  is 'Denomina��o do Grupo';
comment on column DDW.PRODUTO_GRUPO.USUCOD
  is 'Usu�rio';
alter table DDW.PRODUTO_GRUPO
  add constraint PK_PRODUTO_GRUPO primary key (EMPCOD, PROGRUCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.PRODUTO_GRUPO
  add constraint FK_GRUPO_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table PRODUTO_SUBGRUPO
prompt ===============================
prompt
create table DDW.PRODUTO_SUBGRUPO
(
  EMPCOD       NUMBER not null,
  PROSUBGRUCOD NUMBER not null,
  PROSUBGRUDEN VARCHAR2(50) not null,
  PROGRUCOD    NUMBER not null,
  USUCOD       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.PRODUTO_SUBGRUPO.EMPCOD
  is 'Empresa';
comment on column DDW.PRODUTO_SUBGRUPO.PROSUBGRUCOD
  is 'C�digo';
comment on column DDW.PRODUTO_SUBGRUPO.PROSUBGRUDEN
  is 'Denomina��o';
comment on column DDW.PRODUTO_SUBGRUPO.PROGRUCOD
  is 'C�digo do Grupo';
comment on column DDW.PRODUTO_SUBGRUPO.USUCOD
  is 'Usu�rio';
alter table DDW.PRODUTO_SUBGRUPO
  add constraint PK_PRODUTO_SUBGRUPO primary key (EMPCOD, PROSUBGRUCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.PRODUTO_SUBGRUPO
  add constraint FK_SUBGRUPO_GRUPO foreign key (EMPCOD, PROGRUCOD)
  references DDW.PRODUTO_GRUPO (EMPCOD, PROGRUCOD);
alter table DDW.PRODUTO_SUBGRUPO
  add constraint FK_SUBGRUPO_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table PRODUTO
prompt ======================
prompt
create table DDW.PRODUTO
(
  EMPCOD       NUMBER not null,
  PROCOD       NUMBER not null,
  PRODES       VARCHAR2(100) not null,
  PROCODBAR    VARCHAR2(30),
  UNIMEDCOD    VARCHAR2(5),
  PRODATCAD    DATE not null,
  PROCONEST    VARCHAR2(1) not null,
  USUCOD       NUMBER not null,
  PROGRUCOD    NUMBER,
  PROSUBGRUCOD NUMBER,
  PRONCM       VARCHAR2(30),
  PROLAR       NUMBER,
  PROALT       NUMBER,
  PROCOM       NUMBER,
  PROPESLIQ    NUMBER,
  PROPESBRU    NUMBER,
  PROTIP       VARCHAR2(1) default 'A' not null,
  PROCOR       VARCHAR2(50),
  PRODESALT    VARCHAR2(100),
  PROMAT       VARCHAR2(50),
  PROCAR1      VARCHAR2(100),
  PROCAR2      VARCHAR2(100),
  PROCAR3      VARCHAR2(100),
  PROMAR       VARCHAR2(100),
  PROCODALT    NUMBER,
  PROVALCUS    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.PRODUTO.EMPCOD
  is 'Empresa';
comment on column DDW.PRODUTO.PROCOD
  is 'C�digo';
comment on column DDW.PRODUTO.PRODES
  is 'Descri��o';
comment on column DDW.PRODUTO.PROCODBAR
  is 'C�digo de Barras';
comment on column DDW.PRODUTO.UNIMEDCOD
  is 'Unidade de Medida';
comment on column DDW.PRODUTO.PRODATCAD
  is 'Data de Cadastro';
comment on column DDW.PRODUTO.PROCONEST
  is 'Controla Estoque: S - Sim; N - N�o';
comment on column DDW.PRODUTO.USUCOD
  is 'Usu�rio';
comment on column DDW.PRODUTO.PROGRUCOD
  is 'Grupo';
comment on column DDW.PRODUTO.PROSUBGRUCOD
  is 'Subgrupo';
comment on column DDW.PRODUTO.PRONCM
  is 'C�digo NCM';
comment on column DDW.PRODUTO.PROLAR
  is 'Largura';
comment on column DDW.PRODUTO.PROALT
  is 'Altura';
comment on column DDW.PRODUTO.PROCOM
  is 'Comprimento';
comment on column DDW.PRODUTO.PROPESLIQ
  is 'Peso Liquido';
comment on column DDW.PRODUTO.PROPESBRU
  is 'Peso Bruto';
comment on column DDW.PRODUTO.PROTIP
  is 'Tipo do Produto:
B - Beneficiado
F - Fantasma
C - Comprado
A - Acabado Final
P - Produzido';
comment on column DDW.PRODUTO.PROCOR
  is 'Cor do Produto';
comment on column DDW.PRODUTO.PRODESALT
  is 'Descri��o alternativa do produto';
comment on column DDW.PRODUTO.PROMAT
  is 'Material do Produto';
comment on column DDW.PRODUTO.PROCAR1
  is 'Campo de caracteristicas';
comment on column DDW.PRODUTO.PROCAR2
  is 'Campo de caracteristicas';
comment on column DDW.PRODUTO.PROCAR3
  is 'Campo de caracteristicas';
comment on column DDW.PRODUTO.PROMAR
  is 'Marca';
comment on column DDW.PRODUTO.PROCODALT
  is 'C�digo Alternativo';
comment on column DDW.PRODUTO.PROVALCUS
  is 'Valor de Custo do Produto';
alter table DDW.PRODUTO
  add constraint PK_PRODUTO primary key (EMPCOD, PROCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.PRODUTO
  add constraint FK_PRODUTO_GRUPO foreign key (EMPCOD, PROGRUCOD)
  references DDW.PRODUTO_GRUPO (EMPCOD, PROGRUCOD);
alter table DDW.PRODUTO
  add constraint FK_PRODUTO_SUBGRUPO foreign key (EMPCOD, PROSUBGRUCOD)
  references DDW.PRODUTO_SUBGRUPO (EMPCOD, PROSUBGRUCOD);
alter table DDW.PRODUTO
  add constraint FK_PRODUTO_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table FICHA_TECNICA
prompt ============================
prompt
create table DDW.FICHA_TECNICA
(
  EMPCOD       NUMBER not null,
  FICTECCOD    NUMBER not null,
  PROCOD       NUMBER not null,
  FICTECDATCAD DATE not null,
  FICTECOBS    VARCHAR2(1000),
  USUCOD       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.FICHA_TECNICA.EMPCOD
  is 'Empresa';
comment on column DDW.FICHA_TECNICA.FICTECCOD
  is 'C�digo';
comment on column DDW.FICHA_TECNICA.PROCOD
  is 'Produto';
comment on column DDW.FICHA_TECNICA.FICTECDATCAD
  is 'Data de Cadastro';
comment on column DDW.FICHA_TECNICA.FICTECOBS
  is 'Observa��o';
comment on column DDW.FICHA_TECNICA.USUCOD
  is 'Usu�rio';
alter table DDW.FICHA_TECNICA
  add constraint PK_FICHA_TECNICA primary key (EMPCOD, FICTECCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.FICHA_TECNICA
  add constraint FK_FICHA_TEC_EMPRESA foreign key (EMPCOD)
  references DDW.EMPRESA (EMPCOD);
alter table DDW.FICHA_TECNICA
  add constraint FK_FICHA_TEC_PRODUTO foreign key (EMPCOD, PROCOD)
  references DDW.PRODUTO (EMPCOD, PROCOD);
alter table DDW.FICHA_TECNICA
  add constraint FK_FICHA_TEC_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table FICHA_TECNICA_ITEM
prompt =================================
prompt
create table DDW.FICHA_TECNICA_ITEM
(
  EMPCOD       NUMBER not null,
  FICTECCOD    NUMBER not null,
  PROCOD       NUMBER not null,
  FICTECITEQTD NUMBER not null,
  USUCOD       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.FICHA_TECNICA_ITEM.EMPCOD
  is 'Empresa';
comment on column DDW.FICHA_TECNICA_ITEM.FICTECCOD
  is 'C�digo Ficha Tecnica';
comment on column DDW.FICHA_TECNICA_ITEM.PROCOD
  is 'Produto';
comment on column DDW.FICHA_TECNICA_ITEM.FICTECITEQTD
  is 'Quantidade';
comment on column DDW.FICHA_TECNICA_ITEM.USUCOD
  is 'Usuario';
alter table DDW.FICHA_TECNICA_ITEM
  add constraint PK_FIC_TEC_ITE primary key (EMPCOD, FICTECCOD, PROCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.FICHA_TECNICA_ITEM
  add constraint FK_FIC_TEC_ITE_EMPRESA foreign key (EMPCOD)
  references DDW.EMPRESA (EMPCOD);
alter table DDW.FICHA_TECNICA_ITEM
  add constraint FK_FIC_TEC_ITE_FIC_TEC foreign key (EMPCOD, FICTECCOD)
  references DDW.FICHA_TECNICA (EMPCOD, FICTECCOD);
alter table DDW.FICHA_TECNICA_ITEM
  add constraint FK_FIC_TEC_ITE_PRODUTO foreign key (EMPCOD, PROCOD)
  references DDW.PRODUTO (EMPCOD, PROCOD);
alter table DDW.FICHA_TECNICA_ITEM
  add constraint FK_FIC_TEC_ITE_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table ORCAMENTO
prompt ========================
prompt
create table DDW.ORCAMENTO
(
  EMPCOD     NUMBER not null,
  ORCCOD     NUMBER not null,
  ORCDATCAD  DATE not null,
  ORCDAT     DATE not null,
  ENTCOD     NUMBER,
  ORCDATVAL  DATE,
  ORCPRAENT  NUMBER,
  CONPAGCOD  NUMBER,
  ORCPERDES1 NUMBER,
  ORCPERDES2 NUMBER,
  ORCPERDES3 NUMBER,
  ORCVALFRE  NUMBER,
  ORCVALTOT  NUMBER not null,
  USUCOD     NUMBER not null,
  ORCOBS     VARCHAR2(200),
  ORCSTA     NUMBER default 1 not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.ORCAMENTO.EMPCOD
  is 'Empresa';
comment on column DDW.ORCAMENTO.ORCCOD
  is 'C�digo';
comment on column DDW.ORCAMENTO.ORCDATCAD
  is 'Data do Cadastro';
comment on column DDW.ORCAMENTO.ORCDAT
  is 'Data do Or�amento';
comment on column DDW.ORCAMENTO.ENTCOD
  is 'Cliente';
comment on column DDW.ORCAMENTO.ORCDATVAL
  is 'Data de Validade do Or�amento';
comment on column DDW.ORCAMENTO.ORCPRAENT
  is 'Prazo de entrega em dias';
comment on column DDW.ORCAMENTO.CONPAGCOD
  is 'Condi��o de Pagto';
comment on column DDW.ORCAMENTO.ORCPERDES1
  is 'Desconto 1 (%)';
comment on column DDW.ORCAMENTO.ORCPERDES2
  is 'Desconto 2 (%)';
comment on column DDW.ORCAMENTO.ORCPERDES3
  is 'Desconto 3 (%)';
comment on column DDW.ORCAMENTO.ORCVALFRE
  is 'Valor do Frete';
comment on column DDW.ORCAMENTO.ORCVALTOT
  is 'Valor total';
comment on column DDW.ORCAMENTO.USUCOD
  is 'Usu�rio';
comment on column DDW.ORCAMENTO.ORCOBS
  is 'Observa��o';
comment on column DDW.ORCAMENTO.ORCSTA
  is 'STATUS( 0 - Cancelado,1 - Pendente, 2 - Finalizado)';
alter table DDW.ORCAMENTO
  add constraint PK_ORCAMENTO primary key (EMPCOD, ORCCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.ORCAMENTO
  add constraint FK_ORCAMENTO_COND_PAG foreign key (CONPAGCOD)
  references DDW.COND_PAG (CONPAGCOD);
alter table DDW.ORCAMENTO
  add constraint FK_ORCAMENTO_EMPRESA foreign key (EMPCOD)
  references DDW.EMPRESA (EMPCOD);
alter table DDW.ORCAMENTO
  add constraint FK_ORCAMENTO_ENTIDADE foreign key (ENTCOD)
  references DDW.ENTIDADE (ENTCOD);
alter table DDW.ORCAMENTO
  add constraint FK_ORCAMENTO_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table ORCAMENTO_ITEM
prompt =============================
prompt
create table DDW.ORCAMENTO_ITEM
(
  ORCCOD          NUMBER not null,
  PROCOD          NUMBER not null,
  ORCITEPRODES    VARCHAR2(200),
  ORCITEPROQUA    NUMBER not null,
  ORCITEPROVALUNI NUMBER not null,
  ORCITEDES       NUMBER,
  ORCITEVALTOT    NUMBER not null,
  USUCOD          NUMBER not null,
  EMPCOD          NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DDW.ORCAMENTO_ITEM
  is 'Itens do Or�amento';
comment on column DDW.ORCAMENTO_ITEM.ORCCOD
  is 'N�mero do or�amento';
comment on column DDW.ORCAMENTO_ITEM.PROCOD
  is 'C�digo do Produto';
comment on column DDW.ORCAMENTO_ITEM.ORCITEPRODES
  is 'Descri��o do Produto';
comment on column DDW.ORCAMENTO_ITEM.ORCITEPROQUA
  is 'Quantidade de Produto';
comment on column DDW.ORCAMENTO_ITEM.ORCITEPROVALUNI
  is 'Valor Unit�rio do Produto';
comment on column DDW.ORCAMENTO_ITEM.ORCITEDES
  is 'Desconto';
comment on column DDW.ORCAMENTO_ITEM.ORCITEVALTOT
  is 'Valor Total';
comment on column DDW.ORCAMENTO_ITEM.USUCOD
  is 'Usuario';
comment on column DDW.ORCAMENTO_ITEM.EMPCOD
  is 'EMPRESA';
alter table DDW.ORCAMENTO_ITEM
  add constraint PK_ORCAMENTO_ITEM primary key (ORCCOD, PROCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.ORCAMENTO_ITEM
  add constraint FK_ORCITE_ORC foreign key (EMPCOD, ORCCOD)
  references DDW.ORCAMENTO (EMPCOD, ORCCOD);
alter table DDW.ORCAMENTO_ITEM
  add constraint FK_ORCITE_PRO foreign key (EMPCOD, PROCOD)
  references DDW.PRODUTO (EMPCOD, PROCOD);
alter table DDW.ORCAMENTO_ITEM
  add constraint FK_ORCITE_USU foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table PRODUTO_IMAGEM
prompt =============================
prompt
create table DDW.PRODUTO_IMAGEM
(
  EMPCOD    NUMBER not null,
  USUCOD    NUMBER not null,
  PROCOD    NUMBER not null,
  PROIMGCOD NUMBER not null,
  PROIMGURL VARCHAR2(150) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.PRODUTO_IMAGEM.EMPCOD
  is 'Empresa';
comment on column DDW.PRODUTO_IMAGEM.USUCOD
  is 'C�digo do Usu�rio';
comment on column DDW.PRODUTO_IMAGEM.PROCOD
  is 'C�digo do Produto';
comment on column DDW.PRODUTO_IMAGEM.PROIMGCOD
  is 'C�digo da Imagem';
comment on column DDW.PRODUTO_IMAGEM.PROIMGURL
  is 'Caminho da Imagem';
alter table DDW.PRODUTO_IMAGEM
  add constraint PK_PRODUTO_IMAGEM primary key (PROIMGCOD, PROCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.PRODUTO_IMAGEM
  add constraint FK_PRO_IMA_PRODUTO foreign key (EMPCOD, PROCOD)
  references DDW.PRODUTO (EMPCOD, PROCOD);
alter table DDW.PRODUTO_IMAGEM
  add constraint FK_PRO_IMA_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table TABELA_PRECO
prompt ===========================
prompt
create table DDW.TABELA_PRECO
(
  EMPCOD    NUMBER not null,
  TABPRECOD NUMBER not null,
  TABPREDEN VARCHAR2(50),
  USUCOD    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.TABELA_PRECO.EMPCOD
  is 'Empresa';
comment on column DDW.TABELA_PRECO.TABPRECOD
  is 'C�digo';
comment on column DDW.TABELA_PRECO.TABPREDEN
  is 'Denomina��o';
comment on column DDW.TABELA_PRECO.USUCOD
  is 'Usu�rio';
alter table DDW.TABELA_PRECO
  add constraint PK_TAB_PRE primary key (EMPCOD, TABPRECOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.TABELA_PRECO
  add constraint FK_TAB_PRE_EMPRESA foreign key (EMPCOD)
  references DDW.EMPRESA (EMPCOD);
alter table DDW.TABELA_PRECO
  add constraint FK_TAB_PRE_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table TABELA_PRECO_ITEM
prompt ================================
prompt
create table DDW.TABELA_PRECO_ITEM
(
  EMPCOD       NUMBER not null,
  TABPRECOD    NUMBER not null,
  PROCOD       NUMBER not null,
  TABPREITEVAL NUMBER not null,
  USUCOD       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.TABELA_PRECO_ITEM.EMPCOD
  is 'Empresa';
comment on column DDW.TABELA_PRECO_ITEM.TABPRECOD
  is 'C�digo tabela de pre�o';
comment on column DDW.TABELA_PRECO_ITEM.PROCOD
  is 'C�digo do produto';
comment on column DDW.TABELA_PRECO_ITEM.TABPREITEVAL
  is 'Valor';
comment on column DDW.TABELA_PRECO_ITEM.USUCOD
  is 'Usuario';
alter table DDW.TABELA_PRECO_ITEM
  add constraint PK_TAB_PRE_ITE primary key (EMPCOD, TABPRECOD, PROCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.TABELA_PRECO_ITEM
  add constraint FK_TAB_PRE_ITE_EMPRESA foreign key (EMPCOD)
  references DDW.EMPRESA (EMPCOD);
alter table DDW.TABELA_PRECO_ITEM
  add constraint FK_TAB_PRE_ITE_TAB_PRE foreign key (EMPCOD, TABPRECOD)
  references DDW.TABELA_PRECO (EMPCOD, TABPRECOD);
alter table DDW.TABELA_PRECO_ITEM
  add constraint FK_TAB_PRE_ITE_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table UNIDADE_MEDIDA
prompt =============================
prompt
create table DDW.UNIDADE_MEDIDA
(
  UNIMEDCOD VARCHAR2(5) not null,
  UNIMEDDES VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.UNIDADE_MEDIDA.UNIMEDCOD
  is 'C�digo da Unidade de Medida';
comment on column DDW.UNIDADE_MEDIDA.UNIMEDDES
  is 'DESCRICAO';
alter table DDW.UNIDADE_MEDIDA
  add constraint PK_UNIDADE_MEDIDA primary key (UNIMEDCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USUARIO_ACESSO
prompt =============================
prompt
create table DDW.USUARIO_ACESSO
(
  USUACECOD  VARCHAR2(10) not null,
  USEACEDESC VARCHAR2(250) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.USUARIO_ACESSO.USUACECOD
  is 'C�digo de acesso a tela';
comment on column DDW.USUARIO_ACESSO.USEACEDESC
  is 'Descri��o da tela.';
alter table DDW.USUARIO_ACESSO
  add constraint PK_USUARIO_ACESSO primary key (USUACECOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USUARIO_EMPRESA
prompt ==============================
prompt
create table DDW.USUARIO_EMPRESA
(
  USUCOD NUMBER not null,
  EMPCOD NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.USUARIO_EMPRESA.USUCOD
  is 'C�digo do Usu�rio';
comment on column DDW.USUARIO_EMPRESA.EMPCOD
  is 'C�digo da Empresa';
alter table DDW.USUARIO_EMPRESA
  add constraint PK_USU_EMP primary key (USUCOD, EMPCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.USUARIO_EMPRESA
  add constraint FK_USU_EMP_EMPRESA foreign key (EMPCOD)
  references DDW.EMPRESA (EMPCOD);
alter table DDW.USUARIO_EMPRESA
  add constraint FK_USU_EMP_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating table USUARIO_GRUPO_EMPRESA
prompt ====================================
prompt
create table DDW.USUARIO_GRUPO_EMPRESA
(
  USUGRUCOD NUMBER not null,
  EMPCOD    NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.USUARIO_GRUPO_EMPRESA.USUGRUCOD
  is 'Codigo do Grupo';
comment on column DDW.USUARIO_GRUPO_EMPRESA.EMPCOD
  is 'C�digo da empresa';
alter table DDW.USUARIO_GRUPO_EMPRESA
  add constraint PK_USUARIO_GRUPO_EMPRESA primary key (USUGRUCOD, EMPCOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.USUARIO_GRUPO_EMPRESA
  add constraint FK_USU_GRU_EMP_EMP foreign key (EMPCOD)
  references DDW.EMPRESA (EMPCOD);
alter table DDW.USUARIO_GRUPO_EMPRESA
  add constraint FK_USU_GRU_EMP_USU_GRU foreign key (USUGRUCOD)
  references DDW.USUARIO_GRUPO (USUGRUCOD);

prompt
prompt Creating table USUARIO_GRUPO_RESTRICAO
prompt ======================================
prompt
create table DDW.USUARIO_GRUPO_RESTRICAO
(
  USUGRUCOD    NUMBER not null,
  USUACECOD    VARCHAR2(10) not null,
  USUGRURESACE NUMBER not null,
  USUGRURESINC NUMBER not null,
  USUGRURESALT NUMBER not null,
  USUGRURESEXC NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.USUARIO_GRUPO_RESTRICAO.USUGRUCOD
  is 'C�digo do Grupo';
comment on column DDW.USUARIO_GRUPO_RESTRICAO.USUACECOD
  is 'C�digo do Acesso';
comment on column DDW.USUARIO_GRUPO_RESTRICAO.USUGRURESACE
  is 'Permite Acesso - [1, 2]
(1=SIM, 2=N�O)';
comment on column DDW.USUARIO_GRUPO_RESTRICAO.USUGRURESINC
  is 'Permite Inclus�o - [1, 2]
(1=SIM, 2=N�O)';
comment on column DDW.USUARIO_GRUPO_RESTRICAO.USUGRURESALT
  is 'Permite Altera��o - [1, 2]
(1=SIM, 2=N�O)';
comment on column DDW.USUARIO_GRUPO_RESTRICAO.USUGRURESEXC
  is 'Permite Exclus�o - [1, 2]
(1=SIM, 2=N�O)';
alter table DDW.USUARIO_GRUPO_RESTRICAO
  add constraint PK_USUARIO_GRUPO_RESTRICAO primary key (USUGRUCOD, USUACECOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USUARIO_RESTRICAO
prompt ================================
prompt
create table DDW.USUARIO_RESTRICAO
(
  USUCOD    NUMBER not null,
  USUACECOD VARCHAR2(10) not null,
  USURESACE NUMBER,
  USURESINC NUMBER,
  USURESALT NUMBER,
  USURESEXC NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DDW.USUARIO_RESTRICAO.USUCOD
  is 'C�digo do Usu�rio';
comment on column DDW.USUARIO_RESTRICAO.USUACECOD
  is 'C�digo de Acesso as telas';
comment on column DDW.USUARIO_RESTRICAO.USURESACE
  is 'Permite Acesso - [1 - Sim, 2-N�o]';
comment on column DDW.USUARIO_RESTRICAO.USURESINC
  is 'Permite Inclus�o - [1 - Sim, 2-N�o]';
comment on column DDW.USUARIO_RESTRICAO.USURESALT
  is 'Permite Altera��o - [1 - Sim, 2-N�o]';
comment on column DDW.USUARIO_RESTRICAO.USURESEXC
  is 'Permite Exclus�o - [1 - Sim,  2-N�o]';
alter table DDW.USUARIO_RESTRICAO
  add constraint PK_USUARIO_RESTRICAO primary key (USUCOD, USUACECOD)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DDW.USUARIO_RESTRICAO
  add constraint FK_USU_REST_USU_ACE foreign key (USUACECOD)
  references DDW.USUARIO_ACESSO (USUACECOD);
alter table DDW.USUARIO_RESTRICAO
  add constraint FK_USU_REST_USUARIO foreign key (USUCOD)
  references DDW.USUARIO (USUCOD);

prompt
prompt Creating sequence SEQ_CIDADE
prompt ============================
prompt
create sequence DDW.SEQ_CIDADE
minvalue 0
maxvalue 999999999999999999999999999
start with 143
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_COND_PAG
prompt ==============================
prompt
create sequence DDW.SEQ_COND_PAG
minvalue 0
maxvalue 9999999999999999
start with 62
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EMPRESA
prompt =============================
prompt
create sequence DDW.SEQ_EMPRESA
minvalue 0
maxvalue 999999999999999999999999999
start with 105
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_ENTIDADE
prompt ==============================
prompt
create sequence DDW.SEQ_ENTIDADE
minvalue 0
maxvalue 9999999999999999999999999999
start with 320
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_FICHA_TECNICA
prompt ===================================
prompt
create sequence DDW.SEQ_FICHA_TECNICA
minvalue 0
maxvalue 999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORCAMENTO
prompt ===============================
prompt
create sequence DDW.SEQ_ORCAMENTO
minvalue 0
maxvalue 9999999999999
start with 81
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUTO
prompt =============================
prompt
create sequence DDW.SEQ_PRODUTO
minvalue 0
maxvalue 999999999999999
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUTOGRUPO
prompt ==================================
prompt
create sequence DDW.SEQ_PRODUTOGRUPO
minvalue 0
maxvalue 9999999999999999999999
start with 203
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUTO_IMAGEM
prompt ====================================
prompt
create sequence DDW.SEQ_PRODUTO_IMAGEM
minvalue 0
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUTOSUBGRUPO
prompt =====================================
prompt
create sequence DDW.SEQ_PRODUTOSUBGRUPO
minvalue 0
maxvalue 99999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TABELA_PRECO
prompt ==================================
prompt
create sequence DDW.SEQ_TABELA_PRECO
minvalue 0
maxvalue 9999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_UF
prompt ========================
prompt
create sequence DDW.SEQ_UF
minvalue 0
maxvalue 999999999999999999999999999
start with 124
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_USUARIO
prompt =============================
prompt
create sequence DDW.SEQ_USUARIO
minvalue 0
maxvalue 999999999999999999999999999
start with 217
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_USUARIO_ACESSO
prompt ====================================
prompt
create sequence DDW.SEQ_USUARIO_ACESSO
minvalue 0
maxvalue 999999999999999999999999999
start with 217
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_USUARIO_GRUPO
prompt ===================================
prompt
create sequence DDW.SEQ_USUARIO_GRUPO
minvalue 0
maxvalue 9999999999999999999999999999
start with 64
increment by 1
cache 20
order;

prompt
prompt Creating procedure SP_PERMISSAO
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE DDW.SP_PERMISSAO (
    PI_USUACECOD VARCHAR2,
    PI_USUCOD INTEGER,
    PI_TIPO VARCHAR2,
    PO_PERMITE OUT VARCHAR2,
    PO_MENSAGEM OUT VARCHAR2)
AS
  V_EXISTEACESSO INTEGER;
  V_USUGRUCOD INTEGER;
  V_PERMISSAO INTEGER;
begin
  SELECT Count(1)
    INTO V_EXISTEACESSO
    FROM USUARIO_ACESSO
    WHERE USUACECOD = PI_USUACECOD;

  IF (V_EXISTEACESSO > 0) THEN
    SELECT UsuGruCod
      INTO V_USUGRUCOD
      FROM Usuario
      WHERE UsuCod = PI_USUCOD;

    IF (V_USUGRUCOD IS NULL) THEN
      IF (PI_TIPO = 'ACESSAR') THEN
        SELECT UsuResAce
          INTO V_PERMISSAO
          FROM Usuario_Restricao
          WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
      END IF;

      IF (PI_TIPO = 'INCLUIR') THEN
        SELECT UsuResInc
          INTO V_PERMISSAO
          FROM Usuario_Restricao
          WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
      END IF;

      IF (PI_TIPO = 'ALTERAR') THEN
        SELECT UsuResAlt
          INTO V_PERMISSAO
          FROM Usuario_Restricao
          WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
      END IF;

      IF (PI_TIPO = 'EXCLUIR') THEN
        SELECT UsuResExc
          INTO V_PERMISSAO
          FROM Usuario_Restricao
          WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
      END IF;
    ELSE
      IF (PI_TIPO = 'ACESSAR') THEN
        SELECT UsuGruResAce
          INTO V_PERMISSAO
          FROM Usuario_Grupo_Restricao
          WHERE UsuGruCod = V_USUGRUCOD AND UsuAceCod = PI_USUACECOD;

        IF (V_PERMISSAO = 2) THEN
          SELECT UsuResAce
            INTO V_PERMISSAO
            FROM Usuario_Restricao
            WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
        END IF;
      END IF;

      IF (PI_TIPO = 'INCLUIR') THEN
        SELECT UsuGruResInc
          INTO V_PERMISSAO
          FROM Usuario_Grupo_Restricao
          WHERE UsuGruCod = V_USUGRUCOD AND UsuAceCod = PI_USUACECOD;

        IF (V_PERMISSAO = 2) THEN
          SELECT UsuResInc
            INTO V_PERMISSAO
            FROM Usuario_Restricao
            WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
        END IF;
      END IF;

      IF (PI_TIPO = 'ALTERAR') THEN
        SELECT UsuGruResAlt
          INTO V_PERMISSAO
          FROM Usuario_Grupo_Restricao
          WHERE UsuGruCod = V_USUGRUCOD AND UsuAceCod = PI_USUACECOD;

        IF (V_PERMISSAO = 2) THEN
          SELECT UsuResAlt
            INTO V_PERMISSAO
            FROM Usuario_Restricao
            WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
        END IF;
      END IF;

      IF (PI_TIPO = 'EXCLUIR') THEN
        SELECT UsuGruResExc
          INTO V_PERMISSAO
          FROM Usuario_Grupo_Restricao
          WHERE UsuGruCod = V_USUGRUCOD AND UsuAceCod = PI_USUACECOD;

        IF (V_PERMISSAO = 2) THEN
          SELECT UsuResExc
            INTO V_PERMISSAO
            FROM Usuario_Restricao
            WHERE UsuCod = PI_USUCOD AND UsuAceCod = PI_USUACECOD;
        END IF;
      END IF;
    END IF;

    if (V_PERMISSAO = 1) then
      PO_PERMITE := 'SIM';
    else
      PO_PERMITE := 'NAO';
    end if;

    PO_MENSAGEM := 'Usu�rio n�o possui permiss�o para '|| PI_TIPO ||' registro(s) desta tabela.';
  ELSE
    PO_PERMITE := 'NAO';
    PO_MENSAGEM := 'Acesso n�o encontrado no cadastro. Informe o Administrador do Sistema. Acesso: "'|| PI_USUACECOD ||'"';
  END IF;
end;
/

prompt
prompt Creating trigger CIDADE_BF
prompt ==========================
prompt
create or replace trigger DDW.cidade_bf
  before insert on cidade
  for each row
declare


begin
  /*passando o C�digo da Sequ�ncia p/ Tabela*/
  if :new.cidcod is null then
    select seq_cidade.nextval into :new.cidcod from dual;
  end if;
end cidade_bf;
/

prompt
prompt Creating trigger COND_PAG
prompt =========================
prompt
create or replace trigger DDW.cond_pag
  after insert on cond_pag  
  for each row
declare
  -- local variables here
  v_dia_vcto  number;
  
begin
  /*contador for*/
  for c1 in  1 .. :new.conpagqtdpar 
  loop
     /*testando se o cursor � a primeira parcela*/
     if c1 = 1 Then 
       v_dia_vcto := :new.conpagdiapripar;
     else
       v_dia_vcto := v_dia_vcto + :new.conpagdiapar;
     end if;   
     /*inserindo dados na tabela parcelas*/  
    insert into cond_pag_parc (conpagcod, 
                               conpagparseq, 
                               conpagpardia
                               )
                      values  (:new.conpagcod, 
                               c1, 
                               v_dia_vcto 
                               );
  end loop;
  
end cond_pag;
/

prompt
prompt Creating trigger COND_PAG_BF
prompt ============================
prompt
CREATE OR REPLACE TRIGGER DDW.COND_PAG_BF
  BEFORE INSERT ON COND_PAG  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  /*PASSANDO O C�DIGO DA SEQU�NCIA P/ TABELA*/
  IF :NEW.CONPAGCOD IS NULL THEN
    SELECT SEQ_COND_PAG.NEXTVAL INTO :NEW.CONPAGCOD FROM DUAL;
  END IF;
END COND_PAG_BF;
/

prompt
prompt Creating trigger COND_PAG_DELETE
prompt ================================
prompt
CREATE OR REPLACE TRIGGER DDW.COND_PAG_DELETE
  BEFORE DELETE ON COND_PAG  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  -- DELETA PARCELAS
  DELETE FROM COND_PAG_PARC C
    WHERE C.CONPAGCOD = :OLD.CONPAGCOD;
END COND_PAG_DELETE;
/

prompt
prompt Creating trigger EMPRESA_BF
prompt ===========================
prompt
create or replace trigger DDW.empresa_bf
  before insert on empresa
  for each row
declare

begin
  /*passando o c�digo da sequ�ncia p/ empres*/
  if :new.empcod is null then
    select seq_empresa.nextval into :new.empcod from dual;
  end if;
end empresa_bf;
/

prompt
prompt Creating trigger ENTIDADE_BF
prompt ============================
prompt
create or replace trigger DDW.entidade_bf
  before insert on entidade  
  for each row
declare
  -- local variables here
begin
   /*passando o c�digo da sequ�ncia p/ empres*/
  if :new.entcod is null then
    select seq_entidade.nextval into :new.entcod from dual;
  end if;
end entidade_bf;
/

prompt
prompt Creating trigger FICHA_TECNICA_BI
prompt =================================
prompt
CREATE OR REPLACE TRIGGER DDW.FICHA_TECNICA_BI
  BEFORE INSERT ON FICHA_TECNICA  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
    /*PASSANDO O C�DIGO DA SEQU�NCIA P/ TABELA*/
  IF :NEW.FICTECCOD IS NULL THEN
    SELECT SEQ_FICHA_TECNICA.NEXTVAL INTO :NEW.FICTECCOD FROM DUAL;
  END IF;
END FICHA_TECNICA_BI;
/

prompt
prompt Creating trigger ORCAMENTO_BI
prompt =============================
prompt
CREATE OR REPLACE TRIGGER DDW.ORCAMENTO_BI
  BEFORE INSERT ON ORCAMENTO  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  -- INSERE NA SEQUENCE SEQ_ORCAMENTO
  IF :NEW.ORCCOD IS NULL THEN
      SELECT SEQ_ORCAMENTO.NEXTVAL INTO :NEW.ORCCOD FROM DUAL;
  END IF; 
END ORCAMENTO_BI;
/

prompt
prompt Creating trigger PRODUTO_BI
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER DDW.PRODUTO_BI
  BEFORE INSERT ON PRODUTO  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  -- Insere na sequence SEQ_PRODUTO
  IF :NEW.PROCOD IS NULL THEN
      SELECT SEQ_PRODUTO.NEXTVAL INTO :NEW.PROCOD FROM DUAL;
  END IF; 
END PRODUTO_BI;
/

prompt
prompt Creating trigger PRODUTO_GRUPO_BF
prompt =================================
prompt
CREATE OR REPLACE TRIGGER DDW.PRODUTO_GRUPO_BF
  BEFORE INSERT ON PRODUTO_GRUPO  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  /*PASSANDO O C�DIGO DA SEQU�NCIA P/ TABELA*/
  IF :NEW.PROGRUCOD IS NULL THEN
    SELECT SEQ_PRODUTOGRUPO.NEXTVAL INTO :NEW.PROGRUCOD FROM DUAL;
  END IF;
END PRODUTO_GRUPO_BF;
/

prompt
prompt Creating trigger PRODUTO_IMAGEM_BI
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER DDW.PRODUTO_IMAGEM_BI
  BEFORE INSERT ON PRODUTO_IMAGEM  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  /*PASSANDO O C�DIGO DA SEQU�NCIA P/ EMPRES*/
  IF :NEW.PROIMGCOD IS NULL THEN
    SELECT SEQ_PRODUTO_IMAGEM.NEXTVAL INTO :NEW.PROIMGCOD FROM DUAL;
  END IF;
END PRODUTO_IMAGEM_BI;
/

prompt
prompt Creating trigger PRODUTO_SUB_GRUPO_BF
prompt =====================================
prompt
CREATE OR REPLACE TRIGGER DDW.PRODUTO_SUB_GRUPO_BF
  BEFORE INSERT ON PRODUTO_SUBGRUPO  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  /*PASSANDO O C�DIGO DA SEQU�NCIA P/ TABELA*/
  IF :NEW.PROSUBGRUCOD IS NULL THEN
    SELECT SEQ_PRODUTOSUBGRUPO.NEXTVAL INTO :NEW.PROSUBGRUCOD FROM DUAL;
  END IF;
END PRODUTO_SUB_GRUPO_BF;
/

prompt
prompt Creating trigger TABELA_PRECO_BI
prompt ================================
prompt
CREATE OR REPLACE TRIGGER DDW.TABELA_PRECO_BI
  BEFORE INSERT ON TABELA_PRECO  
  FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
   /*PASSANDO O C�DIGO DA SEQU�NCIA P/ TABELA*/
  IF :NEW.TABPRECOD IS NULL THEN
    SELECT SEQ_TABELA_PRECO.NEXTVAL INTO :NEW.TABPRECOD FROM DUAL;
  END IF;
END TABELA_PRECO_BI;
/

prompt
prompt Creating trigger UF_BF
prompt ======================
prompt
create or replace trigger DDW.uf_bf
  before insert on uf
  for each row
declare
  -- local variables here
begin
  /*passando o c�digo da sequ�ncia p/ tabela uf*/
  if :new.ufcod is null then
    select seq_uf.nextval into :new.ufcod from dual;
  end if;
end uf_bf;
/

prompt
prompt Creating trigger USUARIO_ACESSO_AI
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER DDW.USUARIO_ACESSO_AI
AFTER INSERT ON USUARIO_ACESSO
FOR EACH ROW
begin
  for c1 in (select UsuCod from Usuario)
  loop
    insert into Usuario_Restricao values(c1.Usucod, :NEW.usuacecod, 2, 2, 2, 2);
  end loop;
  
  for c2 in (select UsuGruCod from Usuario_Grupo)
  loop
    insert into Usuario_Grupo_Restricao values(c2.UsuGruCod, :NEW.usuacecod, 2, 2, 2, 2);
  end loop;
END;
/

prompt
prompt Creating trigger USUARIO_ACESSO_BD
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER DDW.USUARIO_ACESSO_BD
BEFORE DELETE ON USUARIO_ACESSO
FOR EACH ROW
begin
  DELETE FROM Usuario_Restricao
    WHERE UsuAceCod = :OLD.UsuAceCod;
    
  DELETE FROM Usuario_Grupo_Restricao
    WHERE UsuAceCod = :OLD.UsuAceCod;
END;
/

prompt
prompt Creating trigger USUARIO_ACESSO_BF
prompt ==================================
prompt
create or replace trigger DDW.usuario_acesso_bf
  before insert on usuario_acesso
  for each row
declare

begin
  /*passando o C�digo da Sequ�ncia p/ Tabela usuario acesso*/
  if :new.usuacecod is null then
    select seq_usuario_acesso.nextval into :new.usuacecod from dual;
  end if;
end usuario_acesso_bf;
/

prompt
prompt Creating trigger USUARIO_AI
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER DDW.USUARIO_AI
AFTER INSERT ON USUARIO
FOR EACH ROW
BEGIN
  FOR c1 in (SELECT UsuAceCod FROM Usuario_Acesso)
  loop
    INSERT INTO Usuario_Restricao VALUES(:NEW.USUCOD, c1.UsuAceCod, 2, 2, 2, 2);
  END loop;
END;
/

prompt
prompt Creating trigger USUARIO_BD
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER DDW.USUARIO_BD
BEFORE DELETE ON USUARIO
FOR EACH ROW
begin
  DELETE FROM Usuario_Restricao
    WHERE UsuCod = :OLD.usucod;
END;
/

prompt
prompt Creating trigger USUARIO_BF
prompt ===========================
prompt
create or replace trigger DDW.usuario_bf
  before insert on usuario
  for each row
declare
  -- local variables here
begin
  /*passando o c�digo da sequ�ncia p/ usuario*/
  if :new.usucod is null then
    select seq_usuario.nextval into :new.usucod from dual;
  end if;
end usuario_bf;
/

prompt
prompt Creating trigger USUARIO_GRUPO_AI0
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER DDW.USUARIO_GRUPO_AI0
AFTER INSERT ON USUARIO_GRUPO
FOR EACH ROW
BEGIN
  for c1 in (select UsuAceCod from Usuario_Acesso)
  loop
    insert into Usuario_Grupo_Restricao values(:NEW.USUGRUCOD, c1.UsuAceCod, 2, 2, 2, 2);
  end loop;
END;
/

prompt
prompt Creating trigger USUARIO_GRUPO_BD
prompt =================================
prompt
CREATE OR REPLACE TRIGGER DDW.USUARIO_GRUPO_BD
BEFORE DELETE ON USUARIO_GRUPO
FOR EACH ROW
begin
  DELETE FROM Usuario_Grupo_Restricao
    WHERE UsuGruCod = :OLD.UsuGruCod;
END;
/

prompt
prompt Creating trigger USUARIO_GRUPO_BI
prompt =================================
prompt
CREATE OR REPLACE TRIGGER DDW.USUARIO_GRUPO_BI
BEFORE INSERT ON USUARIO_GRUPO
FOR EACH ROW
BEGIN
  IF (:NEW.USUGRUCOD IS NULL) THEN
    select seq_usuario_grupo.nextval into :NEW.USUGRUCOD from dual;
  END IF;
END;
/


spool off
