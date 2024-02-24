/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     15/12/2023 16:23:35                          */
/*==============================================================*/


/*==============================================================*/
/* Table: LOJA                                                  */
/*==============================================================*/
create table LOJA 
(
   ID_LOJA              INTEGER              not null,
   NOME_LOJA            VARCHAR(1024),
   RUA                  VARCHAR(1024),
   CIDADE               VARCHAR(1024),
   DISTRITO             VARCHAR(1024),
   constraint PK_LOJA primary key (ID_LOJA)
);

/*==============================================================*/
/* Table: PRODUTO                                               */
/*==============================================================*/
create table PRODUTO 
(
   ID_PRODUTO           INTEGER              not null,
   NOME_PRODUTO         VARCHAR(1024),
   CATEGORIA            VARCHAR(1024),
   UPC                  INTEGER,
   constraint PK_PRODUTO primary key (ID_PRODUTO)
);

/*==============================================================*/
/* Table: PROMOCAO                                              */
/*==============================================================*/
create table PROMOCAO 
(
   ID_PROMOCAO          INTEGER              not null,
   DESCRICAO_PROCESSO   VARCHAR(1024),
   DATA_INICIO          DATE,
   DATA_FIM             DATE,
   DESCONTO             INTEGER,
   constraint PK_PROMOCAO primary key (ID_PROMOCAO)
);

/*==============================================================*/
/* Table: TEMPO                                                 */
/*==============================================================*/
create table TEMPO 
(
   ID_TEMPO             INTEGER              not null,
   DATA                 DATE,
   ANO                  INTEGER,
   MES                  INTEGER,
   TRIMESTRE            INTEGER,
   SEMESTRE             INTEGER,
   DIA_DA_SEMANA        INTEGER,
   DIA_DO_MES           INTEGER,
   constraint PK_TEMPO primary key (ID_TEMPO)
);

/*==============================================================*/
/* Table: VENDAS                                                */
/*==============================================================*/
create table VENDAS 
(
   ID_VENDAS            INTEGER              not null,
   ID_LOJA              INTEGER              not null,
   ID_PRODUTO           INTEGER              not null,
   ID_PROMOCAO          INTEGER              not null,
   ID_TEMPO             INTEGER              not null,
   VALOR_TOTAL          FLOAT,
   QUANTIDADE_VENDIDA   INTEGER,
   constraint PK_VENDAS primary key (ID_VENDAS)
);

/*==============================================================*/
/* Index: "1_LOJA_N_VENDAS_FK"                                  */
/*==============================================================*/
create index "1_LOJA_N_VENDAS_FK" on VENDAS (
   ID_LOJA ASC
);

/*==============================================================*/
/* Index: "1_PRODUTO_N_VENDAS_FK"                               */
/*==============================================================*/
create index "1_PRODUTO_N_VENDAS_FK" on VENDAS (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Index: "1_PROMOCAO_N_VENDAS_FK"                              */
/*==============================================================*/
create index "1_PROMOCAO_N_VENDAS_FK" on VENDAS (
   ID_PROMOCAO ASC
);

/*==============================================================*/
/* Index: "1_TEMPO_N_VENDAS_FK"                                 */
/*==============================================================*/
create index "1_TEMPO_N_VENDAS_FK" on VENDAS (
   ID_TEMPO ASC
);

alter table VENDAS
   add constraint FK_VENDAS_1_LOJA_N__LOJA foreign key (ID_LOJA)
      references LOJA (ID_LOJA);

alter table VENDAS
   add constraint FK_VENDAS_1_PRODUTO_PRODUTO foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO);

alter table VENDAS
   add constraint FK_VENDAS_1_PROMOCA_PROMOCAO foreign key (ID_PROMOCAO)
      references PROMOCAO (ID_PROMOCAO);

alter table VENDAS
   add constraint FK_VENDAS_1_TEMPO_N_TEMPO foreign key (ID_TEMPO)
      references TEMPO (ID_TEMPO);

