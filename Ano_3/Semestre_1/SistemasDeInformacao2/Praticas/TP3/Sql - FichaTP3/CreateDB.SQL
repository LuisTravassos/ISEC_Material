/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2022                    */
/* Created on:     09/11/2023 16:59:18                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENDAS') and o.name = 'FK_VENDAS_RELATIONS_TEMPO')
alter table VENDAS
   drop constraint FK_VENDAS_RELATIONS_TEMPO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENDAS') and o.name = 'FK_VENDAS_RELATIONS_PRODUTO')
alter table VENDAS
   drop constraint FK_VENDAS_RELATIONS_PRODUTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENDAS') and o.name = 'FK_VENDAS_RELATIONS_LOJA')
alter table VENDAS
   drop constraint FK_VENDAS_RELATIONS_LOJA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENDAS') and o.name = 'FK_VENDAS_RELATIONS_FUNCIONA')
alter table VENDAS
   drop constraint FK_VENDAS_RELATIONS_FUNCIONA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENDAS') and o.name = 'FK_VENDAS_RELATIONS_METODO_P')
alter table VENDAS
   drop constraint FK_VENDAS_RELATIONS_METODO_P
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FUNCIONARIO')
            and   type = 'U')
   drop table FUNCIONARIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOJA')
            and   type = 'U')
   drop table LOJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('METODO_PAGAMENTO')
            and   type = 'U')
   drop table METODO_PAGAMENTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUTO')
            and   type = 'U')
   drop table PRODUTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMPO')
            and   type = 'U')
   drop table TEMPO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDAS')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDAS.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDAS')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDAS.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDAS')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDAS.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDAS')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDAS.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENDAS')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENDAS.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VENDAS')
            and   type = 'U')
   drop table VENDAS
go

/*==============================================================*/
/* Table: FUNCIONARIO                                           */
/*==============================================================*/
create table FUNCIONARIO (
   ID_FUNCIONARIO       int                  not null,
   NOME_FUNCIONARIO     varchar(256)         null,
   TIPO_FUNCIONARIO     varchar(256)         null,
   constraint PK_FUNCIONARIO primary key (ID_FUNCIONARIO)
)
go

/*==============================================================*/
/* Table: LOJA                                                  */
/*==============================================================*/
create table LOJA (
   ID_LOJA              int                  not null,
   DESIGNACAO_LOJA      varchar(256)         null,
   ANO_ABERTURA         int                  null,
   GERENTE              varchar(256)         null,
   RUA                  varchar(256)         null,
   CIDADE               varchar(256)         null,
   DISTRITO             varchar(256)         null,
   constraint PK_LOJA primary key (ID_LOJA)
)
go

/*==============================================================*/
/* Table: METODO_PAGAMENTO                                      */
/*==============================================================*/
create table METODO_PAGAMENTO (
   ID_METODO_PAGAMENTO  int                  not null,
   DESIGNACAO_METODO_PAGAMENTO varchar(256)         null,
   constraint PK_METODO_PAGAMENTO primary key (ID_METODO_PAGAMENTO)
)
go

/*==============================================================*/
/* Table: PRODUTO                                               */
/*==============================================================*/
create table PRODUTO (
   ID_PRODUTO           int                  not null,
   DESIGNACAO_PRODUTO   varchar(256)         null,
   DESIGNACAO_MARCA     varchar(256)         null,
   DESIGNACAO_SUBCATEGORIA varchar(256)         null,
   DESIGNACAO_CATEGORIA varchar(256)         null,
   DESIGNACAO_DEPARTAMENTO varchar(256)         null,
   constraint PK_PRODUTO primary key (ID_PRODUTO)
)
go

/*==============================================================*/
/* Table: TEMPO                                                 */
/*==============================================================*/
create table TEMPO (
   ID_TEMPO             int                  not null,
   MINUTO               int                  null,
   HORA                 datetime             null,
   DIA                  int                  null,
   MES                  int                  null,
   TRIMESTRE            int                  null,
   SEMESTRE             int                  null,
   ANO                  int                  null,
   constraint PK_TEMPO primary key (ID_TEMPO)
)
go

/*==============================================================*/
/* Table: VENDAS                                                */
/*==============================================================*/
create table VENDAS (
   IDVENDAS             int                  not null,
   ID_TEMPO             int                  not null,
   ID_PRODUTO           int                  not null,
   ID_LOJA              int                  not null,
   ID_FUNCIONARIO       int                  not null,
   ID_METODO_PAGAMENTO  int                  not null,
   QUANTIDADE           int                  null,
   PRECO_UNITARIO       float                null,
   VALOR_VENDA          float                null,
   constraint PK_VENDAS primary key (IDVENDAS, ID_TEMPO, ID_PRODUTO, ID_LOJA, ID_FUNCIONARIO, ID_METODO_PAGAMENTO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_1_FK on VENDAS (ID_TEMPO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_2_FK on VENDAS (ID_PRODUTO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_3_FK on VENDAS (ID_LOJA ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_4_FK on VENDAS (ID_FUNCIONARIO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_5_FK on VENDAS (ID_METODO_PAGAMENTO ASC)
go

alter table VENDAS
   add constraint FK_VENDAS_RELATIONS_TEMPO foreign key (ID_TEMPO)
      references TEMPO (ID_TEMPO)
go

alter table VENDAS
   add constraint FK_VENDAS_RELATIONS_PRODUTO foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO)
go

alter table VENDAS
   add constraint FK_VENDAS_RELATIONS_LOJA foreign key (ID_LOJA)
      references LOJA (ID_LOJA)
go

alter table VENDAS
   add constraint FK_VENDAS_RELATIONS_FUNCIONA foreign key (ID_FUNCIONARIO)
      references FUNCIONARIO (ID_FUNCIONARIO)
go

alter table VENDAS
   add constraint FK_VENDAS_RELATIONS_METODO_P foreign key (ID_METODO_PAGAMENTO)
      references METODO_PAGAMENTO (ID_METODO_PAGAMENTO)
go

