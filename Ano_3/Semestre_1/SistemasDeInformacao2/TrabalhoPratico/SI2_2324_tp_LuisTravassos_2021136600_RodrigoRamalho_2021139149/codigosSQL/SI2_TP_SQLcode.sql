/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     04/12/2023 19:31:13                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CINEMA                                                */
/*==============================================================*/
create table CINEMA 
(
   ID_CINEMA            INTEGER              not null,
   DESIGNACAO           VARCHAR(1024),
   ANO_ABERTURA         INTEGER,
   GERENTE              VARCHAR(1024),
   RUA                  VARCHAR(1024),
   CIDADE               VARCHAR(1024),
   DISTRITO             VARCHAR(1024),
   constraint PK_CINEMA primary key (ID_CINEMA)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_CLIENTE           INTEGER              not null,
   IDADE                INTEGER,
   SEXO                 VARCHAR(1024),
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CONCESSAO                                             */
/*==============================================================*/
create table CONCESSAO 
(
   ID_CONCESSAO         INTEGER              not null,
   TIPOITEM             VARCHAR(1024),
   PRECOUNITARIO        INTEGER,
   constraint PK_CONCESSAO primary key (ID_CONCESSAO)
);

/*==============================================================*/
/* Table: FILME                                                 */
/*==============================================================*/
create table FILME 
(
   ID_FILME             INTEGER              not null,
   TITULO               VARCHAR(1024),
   GENERO               VARCHAR(1024),
   DURACAO_MIN          INTEGER,
   DIRETOR              VARCHAR(1024),
   constraint PK_FILME primary key (ID_FILME)
);

/*==============================================================*/
/* Table: FUNCIONARIO                                           */
/*==============================================================*/
create table FUNCIONARIO 
(
   ID_FUNCIONARIO       INTEGER              not null,
   NOME                 VARCHAR(1024),
   TIPO                 VARCHAR(1024),
   constraint PK_FUNCIONARIO primary key (ID_FUNCIONARIO)
);

/*==============================================================*/
/* Table: PROMOCAO                                              */
/*==============================================================*/
create table PROMOCAO 
(
   ID_PROMOCAO          INTEGER              not null,
   DESCRICAO            VARCHAR(1024),
   DATAINICIO           DATE,
   DATAFIM              DATE,
   DESCONTO             INTEGER,
   constraint PK_PROMOCAO primary key (ID_PROMOCAO)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA 
(
   ID_SALA              INTEGER              not null,
   CAPACIDADE           INTEGER,
   LOCALIZACAO          VARCHAR(1024),
   constraint PK_SALA primary key (ID_SALA)
);

/*==============================================================*/
/* Table: TEMPO                                                 */
/*==============================================================*/
create table TEMPO 
(
   ID_TEMPO             INTEGER              not null,
   MINUTO               INTEGER,
   HORA                 INTEGER,
   DIA                  INTEGER,
   MES                  INTEGER,
   TRIMESTRE            INTEGER,
   SEMESTRE             INTEGER,
   ANO                  INTEGER,
   constraint PK_TEMPO primary key (ID_TEMPO)
);

/*==============================================================*/
/* Table: VENDAS                                                */
/*==============================================================*/
create table VENDAS 
(
   ID_VENDA             INTEGER               not null,
   ID_CLIENTE           INTEGER              not null,
   ID_FILME             INTEGER              not null,
   ID_SALA              INTEGER              not null,
   ID_CONCESSAO         INTEGER              not null,
   ID_PROMOCAO          INTEGER              not null,
   ID_CINEMA            INTEGER              not null,
   ID_TEMPO             INTEGER              not null,
   ID_FUNCIONARIO       INTEGER              not null,
   VALORTOTAL           FLOAT                not null,
   constraint PK_VENDAS primary key (ID_VENDA)
);

/*==============================================================*/
/* Index: "1_CLIENTE_N_VENDA_FK"                                */
/*==============================================================*/
create index "1_CLIENTE_N_VENDA_FK" on VENDAS (
   ID_CLIENTE ASC
);

/*==============================================================*/
/* Index: "1_FILME_N_VENDA_FK"                                  */
/*==============================================================*/
create index "1_FILME_N_VENDA_FK" on VENDAS (
   ID_FILME ASC
);

/*==============================================================*/
/* Index: "1_SALA__N_VENDA_FK"                                  */
/*==============================================================*/
create index "1_SALA__N_VENDA_FK" on VENDAS (
   ID_SALA ASC
);

/*==============================================================*/
/* Index: "1_CONCESSAO_N_VENDA_FK"                              */
/*==============================================================*/
create index "1_CONCESSAO_N_VENDA_FK" on VENDAS (
   ID_CONCESSAO ASC
);

/*==============================================================*/
/* Index: "1_PROMOCAO_N_VENDA_FK"                               */
/*==============================================================*/
create index "1_PROMOCAO_N_VENDA_FK" on VENDAS (
   ID_PROMOCAO ASC
);

/*==============================================================*/
/* Index: "1_CINEMA_N_VENDA_FK"                                 */
/*==============================================================*/
create index "1_CINEMA_N_VENDA_FK" on VENDAS (
   ID_CINEMA ASC
);

/*==============================================================*/
/* Index: "1_TEMPO_N_VENDA_FK"                                  */
/*==============================================================*/
create index "1_TEMPO_N_VENDA_FK" on VENDAS (
   ID_TEMPO ASC
);

/*==============================================================*/
/* Index: "1_FUNCIONARIO_N_VENDA_FK"                            */
/*==============================================================*/
create index "1_FUNCIONARIO_N_VENDA_FK" on VENDAS (
   ID_FUNCIONARIO ASC
);

alter table VENDAS
   add constraint FK_VENDAS_1_CINEMA__CINEMA foreign key (ID_CINEMA)
      references CINEMA (ID_CINEMA);

alter table VENDAS
   add constraint FK_VENDAS_1_CLIENTE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table VENDAS
   add constraint FK_VENDAS_1_CONCESS_CONCESSA foreign key (ID_CONCESSAO)
      references CONCESSAO (ID_CONCESSAO);

alter table VENDAS
   add constraint FK_VENDAS_1_FILME_N_FILME foreign key (ID_FILME)
      references FILME (ID_FILME);

alter table VENDAS
   add constraint FK_VENDAS_1_FUNCION_FUNCIONA foreign key (ID_FUNCIONARIO)
      references FUNCIONARIO (ID_FUNCIONARIO);

alter table VENDAS
   add constraint FK_VENDAS_1_PROMOCA_PROMOCAO foreign key (ID_PROMOCAO)
      references PROMOCAO (ID_PROMOCAO);

alter table VENDAS
   add constraint FK_VENDAS_1_SALA__N_SALA foreign key (ID_SALA)
      references SALA (ID_SALA);

alter table VENDAS
   add constraint FK_VENDAS_1_TEMPO_N_TEMPO foreign key (ID_TEMPO)
      references TEMPO (ID_TEMPO);

