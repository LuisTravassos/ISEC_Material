/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2022                    */
/* Created on:     12/11/2023 21:30:08                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FINANCIAMENTOS') and o.name = 'FK_FINANCIA_RELATIONS_DURACAO')
alter table FINANCIAMENTOS
   drop constraint FK_FINANCIA_RELATIONS_DURACAO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FINANCIAMENTOS') and o.name = 'FK_FINANCIA_RELATIONS_TIPOCONT')
alter table FINANCIAMENTOS
   drop constraint FK_FINANCIA_RELATIONS_TIPOCONT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FINANCIAMENTOS') and o.name = 'FK_FINANCIA_RELATIONS_TIPOBEMF')
alter table FINANCIAMENTOS
   drop constraint FK_FINANCIA_RELATIONS_TIPOBEMF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FINANCIAMENTOS') and o.name = 'FK_FINANCIA_RELATIONS_TIPOSITU')
alter table FINANCIAMENTOS
   drop constraint FK_FINANCIA_RELATIONS_TIPOSITU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FINANCIAMENTOS') and o.name = 'FK_FINANCIA_RELATIONS_TIPOPAGA')
alter table FINANCIAMENTOS
   drop constraint FK_FINANCIA_RELATIONS_TIPOPAGA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FINANCIAMENTOS') and o.name = 'FK_FINANCIA_RELATIONS_CLIENTES')
alter table FINANCIAMENTOS
   drop constraint FK_FINANCIA_RELATIONS_CLIENTES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTES')
            and   type = 'U')
   drop table CLIENTES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DURACAO')
            and   type = 'U')
   drop table DURACAO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FINANCIAMENTOS')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index FINANCIAMENTOS.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FINANCIAMENTOS')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index FINANCIAMENTOS.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FINANCIAMENTOS')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index FINANCIAMENTOS.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FINANCIAMENTOS')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index FINANCIAMENTOS.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FINANCIAMENTOS')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index FINANCIAMENTOS.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FINANCIAMENTOS')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index FINANCIAMENTOS.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FINANCIAMENTOS')
            and   type = 'U')
   drop table FINANCIAMENTOS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPOBEMFINANCIADO')
            and   type = 'U')
   drop table TIPOBEMFINANCIADO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPOCONTRATO')
            and   type = 'U')
   drop table TIPOCONTRATO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPOPAGAMENTO')
            and   type = 'U')
   drop table TIPOPAGAMENTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPOSITUACAO')
            and   type = 'U')
   drop table TIPOSITUACAO
go

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   IDCLIENTE            int                  not null,
   NOME                 char(256)            null,
   NIF                  int                  null,
   CREDITOHABITACAO     char(256)            null,
   ESTADOCIVIL          char(256)            null,
   RENDIMENTOBRUTO      float                null,
   NUMEROFILHOS         int                  null,
   IDADE                int                  null,
   constraint PK_CLIENTES primary key (IDCLIENTE)
)
go

/*==============================================================*/
/* Table: DURACAO                                               */
/*==============================================================*/
create table DURACAO (
   IDDURACAO            int                  not null,
   DURACAODIAS          int                  null,
   DURACAOMESES         int                  null,
   DURACAOANOS          int                  null,
   constraint PK_DURACAO primary key (IDDURACAO)
)
go

/*==============================================================*/
/* Table: FINANCIAMENTOS                                        */
/*==============================================================*/
create table FINANCIAMENTOS (
   IDFINANCIAMENTO      int                  not null,
   IDDURACAO            int                  not null,
   IDTIPOCONTRATO       int                  not null,
   IDBEMFINANCIADO      int                  not null,
   IDSITUACAO           int                  not null,
   IDPAGAMENTOS         int                  not null,
   IDCLIENTE            int                  not null,
   VALORCREDITO         float                null,
   constraint PK_FINANCIAMENTOS primary key (IDFINANCIAMENTO, IDDURACAO, IDTIPOCONTRATO, IDBEMFINANCIADO, IDSITUACAO, IDPAGAMENTOS, IDCLIENTE)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_1_FK on FINANCIAMENTOS (IDDURACAO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_2_FK on FINANCIAMENTOS (IDTIPOCONTRATO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_3_FK on FINANCIAMENTOS (IDBEMFINANCIADO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_4_FK on FINANCIAMENTOS (IDSITUACAO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_5_FK on FINANCIAMENTOS (IDPAGAMENTOS ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_6_FK on FINANCIAMENTOS (IDCLIENTE ASC)
go

/*==============================================================*/
/* Table: TIPOBEMFINANCIADO                                     */
/*==============================================================*/
create table TIPOBEMFINANCIADO (
   IDBEMFINANCIADO      int                  not null,
   BEMFINANCIADO        varchar(256)         null,
   constraint PK_TIPOBEMFINANCIADO primary key (IDBEMFINANCIADO)
)
go

/*==============================================================*/
/* Table: TIPOCONTRATO                                          */
/*==============================================================*/
create table TIPOCONTRATO (
   IDTIPOCONTRATO       int                  not null,
   TIPOCONTRATO         varchar(256)         null,
   constraint PK_TIPOCONTRATO primary key (IDTIPOCONTRATO)
)
go

/*==============================================================*/
/* Table: TIPOPAGAMENTO                                         */
/*==============================================================*/
create table TIPOPAGAMENTO (
   IDPAGAMENTOS         int                  not null,
   PAGAMENTO            varchar(256)         null,
   constraint PK_TIPOPAGAMENTO primary key (IDPAGAMENTOS)
)
go

/*==============================================================*/
/* Table: TIPOSITUACAO                                          */
/*==============================================================*/
create table TIPOSITUACAO (
   IDSITUACAO           int                  not null,
   TIPO_SITUACAO        varchar(256)         null,
   constraint PK_TIPOSITUACAO primary key (IDSITUACAO)
)
go

alter table FINANCIAMENTOS
   add constraint FK_FINANCIA_RELATIONS_DURACAO foreign key (IDDURACAO)
      references DURACAO (IDDURACAO)
go

alter table FINANCIAMENTOS
   add constraint FK_FINANCIA_RELATIONS_TIPOCONT foreign key (IDTIPOCONTRATO)
      references TIPOCONTRATO (IDTIPOCONTRATO)
go

alter table FINANCIAMENTOS
   add constraint FK_FINANCIA_RELATIONS_TIPOBEMF foreign key (IDBEMFINANCIADO)
      references TIPOBEMFINANCIADO (IDBEMFINANCIADO)
go

alter table FINANCIAMENTOS
   add constraint FK_FINANCIA_RELATIONS_TIPOSITU foreign key (IDSITUACAO)
      references TIPOSITUACAO (IDSITUACAO)
go

alter table FINANCIAMENTOS
   add constraint FK_FINANCIA_RELATIONS_TIPOPAGA foreign key (IDPAGAMENTOS)
      references TIPOPAGAMENTO (IDPAGAMENTOS)
go

alter table FINANCIAMENTOS
   add constraint FK_FINANCIA_RELATIONS_CLIENTES foreign key (IDCLIENTE)
      references CLIENTES (IDCLIENTE)
go

