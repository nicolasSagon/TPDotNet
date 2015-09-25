/*==============================================================*/
/* Nom de SGBD :  Microsoft SQL Server                          */
/* Date de création :  19/09/2014 00:02:54                      */
/*==============================================================*/

IF EXISTS (SELECT * FROM sys.views WHERE object_id = object_id(N'dbo.vAbonnes'))
DROP VIEW dbo.vAbonnes
go

IF EXISTS (SELECT * FROM sys.views WHERE object_id = object_id(N'dbo.vPays'))
DROP VIEW dbo.vPays
go

IF EXISTS (SELECT * FROM sys.views WHERE object_id = object_id(N'dbo.vIndicatifs'))
DROP VIEW dbo.vIndicatifs
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_ABONNE_ABO') and o.name = 'FK_ABO_IND')
alter table T_E_ABONNE_ABO
   drop constraint FK_ABO_IND
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_ABONNE_ABO') and o.name = 'FK_ABO_PAY')
alter table T_E_ABONNE_ABO
   drop constraint FK_ABO_PAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_AVIS_AVI') and o.name = 'FK_AVI_VIS')
alter table T_E_AVIS_AVI
   drop constraint FK_AVI_VIS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_AVIS_AVI') and o.name = 'FK_AVI_REP')
alter table T_E_AVIS_AVI
   drop constraint FK_AVI_REP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_AVIS_AVI') and o.name = 'FK_AVI_PRX')
alter table T_E_AVIS_AVI
   drop constraint FK_AVI_PRX
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_AVIS_AVI') and o.name = 'FK_AVI_ABO')
alter table T_E_AVIS_AVI
   drop constraint FK_AVI_ABO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_AVIS_AVI') and o.name = 'FK_AVI_RES')
alter table T_E_AVIS_AVI
   drop constraint FK_AVI_RES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_PHOTO_PHO') and o.name = 'FK_PHO_RES')
alter table T_E_PHOTO_PHO
   drop constraint FK_PHO_RES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_PHOTO_PHO') and o.name = 'FK_PHO_AVI')
alter table T_E_PHOTO_PHO
   drop constraint FK_PHO_AVI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_RESTAURANT_RES') and o.name = 'FK_RES_PRX')
alter table T_E_RESTAURANT_RES
   drop constraint FK_RES_PRX
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_RESTAURANT_RES') and o.name = 'FK_RES_IND')
alter table T_E_RESTAURANT_RES
   drop constraint FK_RES_IND
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_E_RESTAURANT_RES') and o.name = 'FK_RES_PAY')
alter table T_E_RESTAURANT_RES
   drop constraint FK_RES_PAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_J_CUISINERESTO_CUR') and o.name = 'FK_CUR_RES')
alter table T_J_CUISINERESTO_CUR
   drop constraint FK_CUR_RES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_J_CUISINERESTO_CUR') and o.name = 'FK_CUR_CUI')
alter table T_J_CUISINERESTO_CUR
   drop constraint FK_CUR_CUI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_J_FAVORI_FAV') and o.name = 'FK_FAV_ABO')
alter table T_J_FAVORI_FAV
   drop constraint FK_FAV_ABO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('T_J_FAVORI_FAV') and o.name = 'FK_FAV_RES')
alter table T_J_FAVORI_FAV
   drop constraint FK_FAV_RES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_E_ABONNE_ABO')
            and   type = 'U')
   drop table T_E_ABONNE_ABO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_E_AVIS_AVI')
            and   type = 'U')
   drop table T_E_AVIS_AVI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_E_PHOTO_PHO')
            and   type = 'U')
   drop table T_E_PHOTO_PHO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_E_RESTAURANT_RES')
            and   type = 'U')
   drop table T_E_RESTAURANT_RES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_J_CUISINERESTO_CUR')
            and   type = 'U')
   drop table T_J_CUISINERESTO_CUR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_J_FAVORI_FAV')
            and   type = 'U')
   drop table T_J_FAVORI_FAV
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_R_CUISINE_CUI')
            and   type = 'U')
   drop table T_R_CUISINE_CUI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_R_INDICATIFTEL_IND')
            and   type = 'U')
   drop table T_R_INDICATIFTEL_IND
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_R_PAYS_PAY')
            and   type = 'U')
   drop table T_R_PAYS_PAY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_R_TYPEPRIX_PRX')
            and   type = 'U')
   drop table T_R_TYPEPRIX_PRX
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_R_TYPEREPAS_REP')
            and   type = 'U')
   drop table T_R_TYPEREPAS_REP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_R_TYPEVISITE_VIS')
            and   type = 'U')
   drop table T_R_TYPEVISITE_VIS
go

/*==============================================================*/
/* Table : T_E_ABONNE_ABO                                       */
/*==============================================================*/
create table T_E_ABONNE_ABO (
   ABO_ID               int               	 identity,
   ABO_PSEUDO           varchar(20)          not null,
   ABO_MOTPASSE         varchar(40)          not null,
   ABO_MEL              varchar(80)          not null,
   ABO_NOM              varchar(50)          not null,
   ABO_PRENOM           varchar(50)          not null,
   ABO_ADRLIGNE1        varchar(100)         not null,
   ABO_ADRLIGNE2        varchar(100)         null,
   ABO_CP               varchar(10)          not null,
   ABO_VILLE            varchar(50)          not null,
   ABO_ETAT             varchar(50)          null,
   PAY_ID               int                  not null,
   ABO_LATITUDE         float(16)            null,
   ABO_LONGITUDE        float(16)            null,
   IND_INDICATIF        int                  not null,
   ABO_TEL              varchar(15)          not null,
   ABO_AEROPORT         varchar(50)          null,
   constraint PK_T_E_ABONNE_ABO primary key nonclustered (ABO_ID)
)
go

/*==============================================================*/
/* Table : T_E_AVIS_AVI                                         */
/*==============================================================*/
create table T_E_AVIS_AVI (
   AVI_ID               int               	 identity,
   RES_ID               int                  not null,
   VIS_ID               int                  not null,
   REP_ID               int                  not null,
   PRX_PRIX             char(4)              null,
   ABO_ID               int                  null,
   AVI_DATE             datetime             not null default getdate(),
   AVI_TITRE            varchar(100)         not null,
   AVI_DETAIL           varchar(2000)        not null,
   AVI_NOTEGLOBALE      numeric(1)           not null,
   AVI_NOTECUISINE      numeric(1)           not null,
   AVI_NOTESERVICE      numeric(1)           not null,
   AVI_NOTEQUALITEPRIX  numeric(1)           not null,
   AVI_NOTEAMBIANCE     numeric(1)           not null,
   constraint PK_T_E_AVIS_AVI primary key nonclustered (AVI_ID)
)
go

/*==============================================================*/
/* Table : T_E_PHOTO_PHO                                        */
/*==============================================================*/
create table T_E_PHOTO_PHO (
   PHO_ID               int                  identity,
   RES_ID               int                  null,
   AVI_ID               int                  null,
   PHO_URL              varchar(100)         not null,
   constraint PK_T_E_PHOTO_PHO primary key nonclustered (PHO_ID)
)
go

/*==============================================================*/
/* Table : T_E_RESTAURANT_RES                                   */
/*==============================================================*/
create table T_E_RESTAURANT_RES (
   RES_ID               int                  identity,
   PRX_PRIX             char(4)              null,
   RES_NOM              varchar(80)          not null,
   RES_DESCRIPTION      varchar(500)         not null,
   RES_CATEGORIEPRIX    varchar(20)          not null,
   RES_ADRLIGNE1        varchar(100)         not null,
   RES_ADRLIGNE2        varchar(100)         null,
   RES_CP               varchar(10)          not null,
   RES_VILLE            varchar(50)          not null,
   RES_ETAT             varchar(50)          null,
   PAY_ID               int                  not null,
   RES_LATITUDE         float(16)            not null,
   RES_LONGITUDE        float(16)            not null,
   IND_INDICATIF        int                  not null,
   RES_TEL              varchar(15)          not null,
   RES_SITEWEB          varchar(100)         null,
   RES_MEL              varchar(80)          not null,
   constraint PK_T_E_RESTAURANT_RES primary key nonclustered (RES_ID)
)
go

/*==============================================================*/
/* Table : T_J_CUISINERESTO_CUR                                 */
/*==============================================================*/
create table T_J_CUISINERESTO_CUR (
   CUI_ID               int               not null,
   RES_ID               int               not null,
   constraint PK_T_J_CUISINERESTO_CUR primary key nonclustered (CUI_ID, RES_ID)
)
go

/*==============================================================*/
/* Table : T_J_FAVORI_FAV                                       */
/*==============================================================*/
create table T_J_FAVORI_FAV (
   ABO_ID               int               not null,
   RES_ID               int               not null,
   constraint PK_T_J_FAVORI_FAV primary key nonclustered (ABO_ID, RES_ID)
)
go

/*==============================================================*/
/* Table : T_R_CUISINE_CUI                                      */
/*==============================================================*/
create table T_R_CUISINE_CUI (
   CUI_ID               int                  identity,
   CUI_LIBELLE          varchar(30)          not null,
   constraint PK_T_R_CUISINE_CUI primary key nonclustered (CUI_ID)
)
go

/*==============================================================*/
/* Table : T_R_INDICATIFTEL_IND                                 */
/*==============================================================*/
create table T_R_INDICATIFTEL_IND (
   IND_INDICATIF        int                  not null,
   constraint PK_T_R_INDICATIFTEL_IND primary key nonclustered (IND_INDICATIF)
)
go

/*==============================================================*/
/* Table : T_R_PAYS_PAY                                         */
/*==============================================================*/
create table T_R_PAYS_PAY (
   PAY_ID               int                  identity,
   PAY_NOM              varchar(50)          not null,
   constraint PK_T_R_PAYS_PAY primary key nonclustered (PAY_ID)
)
go

/*==============================================================*/
/* Table : T_R_TYPEPRIX_PRX                                     */
/*==============================================================*/
create table T_R_TYPEPRIX_PRX (
   PRX_PRIX             char(4)              not null,
   constraint PK_T_R_TYPEPRIX_PRX primary key nonclustered (PRX_PRIX)
)
go

/*==============================================================*/
/* Table : T_R_TYPEREPAS_REP                                    */
/*==============================================================*/
create table T_R_TYPEREPAS_REP (
   REP_ID               int                  identity,
   REP_LIBELLE          varchar(20)          not null,
   constraint PK_T_R_TYPEREPAS_REP primary key nonclustered (REP_ID)
)
go

/*==============================================================*/
/* Table : T_R_TYPEVISITE_VIS                                   */
/*==============================================================*/
create table T_R_TYPEVISITE_VIS (
   VIS_ID               int                  identity,
   VIS_LIBELLE          varchar(20)          not null,
   constraint PK_T_R_TYPEVISITE_VIS primary key nonclustered (VIS_ID)
)
go

alter table T_E_ABONNE_ABO
   add constraint FK_ABO_IND foreign key (IND_INDICATIF)
      references T_R_INDICATIFTEL_IND (IND_INDICATIF)
go

alter table T_E_ABONNE_ABO
   add constraint FK_ABO_PAY foreign key (PAY_ID)
      references T_R_PAYS_PAY (PAY_ID)
go

alter table T_E_AVIS_AVI
   add constraint FK_AVI_VIS foreign key (VIS_ID)
      references T_R_TYPEVISITE_VIS (VIS_ID)
go

alter table T_E_AVIS_AVI
   add constraint FK_AVI_REP foreign key (REP_ID)
      references T_R_TYPEREPAS_REP (REP_ID)
go

alter table T_E_AVIS_AVI
   add constraint FK_AVI_PRX foreign key (PRX_PRIX)
      references T_R_TYPEPRIX_PRX (PRX_PRIX)
go

alter table T_E_AVIS_AVI
   add constraint FK_AVI_ABO foreign key (ABO_ID)
      references T_E_ABONNE_ABO (ABO_ID)
go

alter table T_E_AVIS_AVI
   add constraint FK_AVI_RES foreign key (RES_ID)
      references T_E_RESTAURANT_RES (RES_ID)
go

alter table T_E_PHOTO_PHO
   add constraint FK_PHO_RES foreign key (RES_ID)
      references T_E_RESTAURANT_RES (RES_ID)
go

alter table T_E_PHOTO_PHO
   add constraint FK_PHO_AVI foreign key (AVI_ID)
      references T_E_AVIS_AVI (AVI_ID)
go

alter table T_E_RESTAURANT_RES
   add constraint FK_RES_PRX foreign key (PRX_PRIX)
      references T_R_TYPEPRIX_PRX (PRX_PRIX)
go

alter table T_E_RESTAURANT_RES
   add constraint FK_RES_IND foreign key (IND_INDICATIF)
      references T_R_INDICATIFTEL_IND (IND_INDICATIF)
go

alter table T_E_RESTAURANT_RES
   add constraint FK_RES_PAY foreign key (PAY_ID)
      references T_R_PAYS_PAY (PAY_ID)
go

alter table T_J_CUISINERESTO_CUR
   add constraint FK_CUR_RES foreign key (RES_ID)
      references T_E_RESTAURANT_RES (RES_ID)
go

alter table T_J_CUISINERESTO_CUR
   add constraint FK_CUR_CUI foreign key (CUI_ID)
      references T_R_CUISINE_CUI (CUI_ID)
go

alter table T_J_FAVORI_FAV
   add constraint FK_FAV_ABO foreign key (ABO_ID)
      references T_E_ABONNE_ABO (ABO_ID)
go

alter table T_J_FAVORI_FAV
   add constraint FK_FAV_RES foreign key (RES_ID)
      references T_E_RESTAURANT_RES (RES_ID)
go

CREATE VIEW vAbonnes(pseudo, motpasse, mel, nom, prenom, adrligne1, adrligne2, cp, ville, etat, idpay, indicatif, tel)
AS
SELECT abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_adrligne2, abo_cp, abo_ville, abo_etat, pay_id, ind_indicatif, abo_tel
FROM T_E_ABONNE_ABO
go

CREATE VIEW vPays(id, nom)
AS
SELECT pay_id, pay_nom
FROM T_R_PAYS_PAY
go

CREATE VIEW vIndicatifs(indicatiftel)
AS
SELECT ind_indicatif
FROM T_R_INDICATIFTEL_IND
go

create index IX_AVI_VIS_ID ON T_E_AVIS_AVI(VIS_ID)
go

create index IX_AVI_REP_ID ON T_E_AVIS_AVI(REP_ID)
go

create index IX_AVI_PRX_PRIX ON T_E_AVIS_AVI(PRX_PRIX)
go

create index IX_RES_PRX_PRIX ON T_E_RESTAURANT_RES(PRX_PRIX)
go

create index IX_AVI_ABO_ID ON T_E_AVIS_AVI(ABO_ID)
go

create index IX_AVI_RES_ID ON T_E_AVIS_AVI(RES_ID)
go

create index IX_FAV_ABO_ID ON T_J_FAVORI_FAV(ABO_ID)
go

create index IX_FAV_RES_ID ON T_J_FAVORI_FAV(RES_ID)
go

create index IX_RES_IND_INDICATIF ON T_E_RESTAURANT_RES(IND_INDICATIF)
go

create index IX_RES_PAY_ID ON T_E_RESTAURANT_RES(PAY_ID)
go

create index IX_ABO_IND_INDICATIF ON T_E_ABONNE_ABO(IND_INDICATIF)
go

create index IX_ABO_PAY_ID ON T_E_ABONNE_ABO(PAY_ID)
go

create index IX_CUR_RES_ID ON T_J_CUISINERESTO_CUR(RES_ID)
go

create index IX_CUR_CUI_ID ON T_J_CUISINERESTO_CUR(CUI_ID)
go

create index IX_PHO_RES_ID ON T_E_PHOTO_PHO(RES_ID)
go

create index IX_PHO_AVI_ID ON T_E_PHOTO_PHO(AVI_ID)
go


/*==============================================================*/
/* INSERT                    */
/*==============================================================*/

Insert into t_r_typevisite_vis(vis_libelle) values('En couple');
Insert into t_r_typevisite_vis(vis_libelle) values('En famille');
Insert into t_r_typevisite_vis(vis_libelle) values('Amis');
Insert into t_r_typevisite_vis(vis_libelle) values('Affaires');
Insert into t_r_typevisite_vis(vis_libelle) values('Voyage solo');

Insert into t_r_typerepas_rep(rep_libelle) values('Petit-déjeuner');
Insert into t_r_typerepas_rep(rep_libelle) values('Brunch');
Insert into t_r_typerepas_rep(rep_libelle) values('Dîner');
Insert into t_r_typerepas_rep(rep_libelle) values('Thé ou café');
Insert into t_r_typerepas_rep(rep_libelle) values('Boissons');
Insert into t_r_typerepas_rep(rep_libelle) values('Tard le soir');

Insert into t_r_typeprix_prx values('€');
Insert into t_r_typeprix_prx values('€€');
Insert into t_r_typeprix_prx values('€€€');
Insert into t_r_typeprix_prx values('€€€€');

Insert into t_r_indicatiftel_ind values(1);
Insert into t_r_indicatiftel_ind values(7);
Insert into t_r_indicatiftel_ind values(20);
Insert into t_r_indicatiftel_ind values(27);
Insert into t_r_indicatiftel_ind values(30);
Insert into t_r_indicatiftel_ind values(31);
Insert into t_r_indicatiftel_ind values(32);
Insert into t_r_indicatiftel_ind values(33);
Insert into t_r_indicatiftel_ind values(34);
Insert into t_r_indicatiftel_ind values(36);
Insert into t_r_indicatiftel_ind values(39);
Insert into t_r_indicatiftel_ind values(40);
Insert into t_r_indicatiftel_ind values(41);
Insert into t_r_indicatiftel_ind values(43);
Insert into t_r_indicatiftel_ind values(44);
Insert into t_r_indicatiftel_ind values(45);
Insert into t_r_indicatiftel_ind values(46);
Insert into t_r_indicatiftel_ind values(47);
Insert into t_r_indicatiftel_ind values(48);
Insert into t_r_indicatiftel_ind values(49);
Insert into t_r_indicatiftel_ind values(51);
Insert into t_r_indicatiftel_ind values(52);
Insert into t_r_indicatiftel_ind values(53);
Insert into t_r_indicatiftel_ind values(54);
Insert into t_r_indicatiftel_ind values(55);
Insert into t_r_indicatiftel_ind values(56);
Insert into t_r_indicatiftel_ind values(57);
Insert into t_r_indicatiftel_ind values(58);
Insert into t_r_indicatiftel_ind values(60);
Insert into t_r_indicatiftel_ind values(61);
Insert into t_r_indicatiftel_ind values(62);
Insert into t_r_indicatiftel_ind values(63);
Insert into t_r_indicatiftel_ind values(64);
Insert into t_r_indicatiftel_ind values(65);
Insert into t_r_indicatiftel_ind values(66);
Insert into t_r_indicatiftel_ind values(81);
Insert into t_r_indicatiftel_ind values(82);
Insert into t_r_indicatiftel_ind values(84);
Insert into t_r_indicatiftel_ind values(86);
Insert into t_r_indicatiftel_ind values(90);
Insert into t_r_indicatiftel_ind values(91);
Insert into t_r_indicatiftel_ind values(92);
Insert into t_r_indicatiftel_ind values(93);
Insert into t_r_indicatiftel_ind values(94);
Insert into t_r_indicatiftel_ind values(95);
Insert into t_r_indicatiftel_ind values(98);
Insert into t_r_indicatiftel_ind values(211);
Insert into t_r_indicatiftel_ind values(212);
Insert into t_r_indicatiftel_ind values(213);
Insert into t_r_indicatiftel_ind values(216);
Insert into t_r_indicatiftel_ind values(218);
Insert into t_r_indicatiftel_ind values(220);
Insert into t_r_indicatiftel_ind values(221);
Insert into t_r_indicatiftel_ind values(222);
Insert into t_r_indicatiftel_ind values(223);
Insert into t_r_indicatiftel_ind values(224);
Insert into t_r_indicatiftel_ind values(225);
Insert into t_r_indicatiftel_ind values(226);
Insert into t_r_indicatiftel_ind values(227);
Insert into t_r_indicatiftel_ind values(228);
Insert into t_r_indicatiftel_ind values(229);
Insert into t_r_indicatiftel_ind values(230);
Insert into t_r_indicatiftel_ind values(231);
Insert into t_r_indicatiftel_ind values(232);
Insert into t_r_indicatiftel_ind values(233);
Insert into t_r_indicatiftel_ind values(234);
Insert into t_r_indicatiftel_ind values(235);
Insert into t_r_indicatiftel_ind values(236);
Insert into t_r_indicatiftel_ind values(237);
Insert into t_r_indicatiftel_ind values(238);
Insert into t_r_indicatiftel_ind values(239);
Insert into t_r_indicatiftel_ind values(240);
Insert into t_r_indicatiftel_ind values(241);
Insert into t_r_indicatiftel_ind values(242);
Insert into t_r_indicatiftel_ind values(243);
Insert into t_r_indicatiftel_ind values(244);
Insert into t_r_indicatiftel_ind values(245);
Insert into t_r_indicatiftel_ind values(246);
Insert into t_r_indicatiftel_ind values(247);
Insert into t_r_indicatiftel_ind values(248);
Insert into t_r_indicatiftel_ind values(249);
Insert into t_r_indicatiftel_ind values(250);
Insert into t_r_indicatiftel_ind values(251);
Insert into t_r_indicatiftel_ind values(252);
Insert into t_r_indicatiftel_ind values(253);
Insert into t_r_indicatiftel_ind values(254);
Insert into t_r_indicatiftel_ind values(255);
Insert into t_r_indicatiftel_ind values(256);
Insert into t_r_indicatiftel_ind values(257);
Insert into t_r_indicatiftel_ind values(258);
Insert into t_r_indicatiftel_ind values(260);
Insert into t_r_indicatiftel_ind values(261);
Insert into t_r_indicatiftel_ind values(262);
Insert into t_r_indicatiftel_ind values(263);
Insert into t_r_indicatiftel_ind values(264);
Insert into t_r_indicatiftel_ind values(265);
Insert into t_r_indicatiftel_ind values(266);
Insert into t_r_indicatiftel_ind values(267);
Insert into t_r_indicatiftel_ind values(268);
Insert into t_r_indicatiftel_ind values(269);
Insert into t_r_indicatiftel_ind values(290);
Insert into t_r_indicatiftel_ind values(291);
Insert into t_r_indicatiftel_ind values(297);
Insert into t_r_indicatiftel_ind values(298);
Insert into t_r_indicatiftel_ind values(299);
Insert into t_r_indicatiftel_ind values(350);
Insert into t_r_indicatiftel_ind values(351);
Insert into t_r_indicatiftel_ind values(352);
Insert into t_r_indicatiftel_ind values(353);
Insert into t_r_indicatiftel_ind values(354);
Insert into t_r_indicatiftel_ind values(355);
Insert into t_r_indicatiftel_ind values(356);
Insert into t_r_indicatiftel_ind values(357);
Insert into t_r_indicatiftel_ind values(358);
Insert into t_r_indicatiftel_ind values(359);
Insert into t_r_indicatiftel_ind values(370);
Insert into t_r_indicatiftel_ind values(371);
Insert into t_r_indicatiftel_ind values(372);
Insert into t_r_indicatiftel_ind values(373);
Insert into t_r_indicatiftel_ind values(374);
Insert into t_r_indicatiftel_ind values(375);
Insert into t_r_indicatiftel_ind values(376);
Insert into t_r_indicatiftel_ind values(377);
Insert into t_r_indicatiftel_ind values(378);
Insert into t_r_indicatiftel_ind values(379);
Insert into t_r_indicatiftel_ind values(380);
Insert into t_r_indicatiftel_ind values(381);
Insert into t_r_indicatiftel_ind values(382);
Insert into t_r_indicatiftel_ind values(385);
Insert into t_r_indicatiftel_ind values(386);
Insert into t_r_indicatiftel_ind values(387);
Insert into t_r_indicatiftel_ind values(389);
Insert into t_r_indicatiftel_ind values(420);
Insert into t_r_indicatiftel_ind values(421);
Insert into t_r_indicatiftel_ind values(423);
Insert into t_r_indicatiftel_ind values(500);
Insert into t_r_indicatiftel_ind values(501);
Insert into t_r_indicatiftel_ind values(502);
Insert into t_r_indicatiftel_ind values(503);
Insert into t_r_indicatiftel_ind values(504);
Insert into t_r_indicatiftel_ind values(505);
Insert into t_r_indicatiftel_ind values(506);
Insert into t_r_indicatiftel_ind values(507);
Insert into t_r_indicatiftel_ind values(508);
Insert into t_r_indicatiftel_ind values(509);
Insert into t_r_indicatiftel_ind values(590);
Insert into t_r_indicatiftel_ind values(591);
Insert into t_r_indicatiftel_ind values(592);
Insert into t_r_indicatiftel_ind values(593);
Insert into t_r_indicatiftel_ind values(594);
Insert into t_r_indicatiftel_ind values(595);
Insert into t_r_indicatiftel_ind values(596);
Insert into t_r_indicatiftel_ind values(597);
Insert into t_r_indicatiftel_ind values(598);
Insert into t_r_indicatiftel_ind values(599);
Insert into t_r_indicatiftel_ind values(670);
Insert into t_r_indicatiftel_ind values(672);
Insert into t_r_indicatiftel_ind values(673);
Insert into t_r_indicatiftel_ind values(674);
Insert into t_r_indicatiftel_ind values(675);
Insert into t_r_indicatiftel_ind values(676);
Insert into t_r_indicatiftel_ind values(677);
Insert into t_r_indicatiftel_ind values(678);
Insert into t_r_indicatiftel_ind values(679);
Insert into t_r_indicatiftel_ind values(680);
Insert into t_r_indicatiftel_ind values(681);
Insert into t_r_indicatiftel_ind values(682);
Insert into t_r_indicatiftel_ind values(683);
Insert into t_r_indicatiftel_ind values(685);
Insert into t_r_indicatiftel_ind values(686);
Insert into t_r_indicatiftel_ind values(687);
Insert into t_r_indicatiftel_ind values(688);
Insert into t_r_indicatiftel_ind values(689);
Insert into t_r_indicatiftel_ind values(690);
Insert into t_r_indicatiftel_ind values(691);
Insert into t_r_indicatiftel_ind values(692);
Insert into t_r_indicatiftel_ind values(850);
Insert into t_r_indicatiftel_ind values(852);
Insert into t_r_indicatiftel_ind values(853);
Insert into t_r_indicatiftel_ind values(855);
Insert into t_r_indicatiftel_ind values(856);
Insert into t_r_indicatiftel_ind values(880);
Insert into t_r_indicatiftel_ind values(886);
Insert into t_r_indicatiftel_ind values(960);
Insert into t_r_indicatiftel_ind values(961);
Insert into t_r_indicatiftel_ind values(962);
Insert into t_r_indicatiftel_ind values(963);
Insert into t_r_indicatiftel_ind values(964);
Insert into t_r_indicatiftel_ind values(965);
Insert into t_r_indicatiftel_ind values(966);
Insert into t_r_indicatiftel_ind values(967);
Insert into t_r_indicatiftel_ind values(968);
Insert into t_r_indicatiftel_ind values(970);
Insert into t_r_indicatiftel_ind values(971);
Insert into t_r_indicatiftel_ind values(972);
Insert into t_r_indicatiftel_ind values(973);
Insert into t_r_indicatiftel_ind values(974);
Insert into t_r_indicatiftel_ind values(975);
Insert into t_r_indicatiftel_ind values(976);
Insert into t_r_indicatiftel_ind values(977);
Insert into t_r_indicatiftel_ind values(992);
Insert into t_r_indicatiftel_ind values(993);
Insert into t_r_indicatiftel_ind values(994);
Insert into t_r_indicatiftel_ind values(995);
Insert into t_r_indicatiftel_ind values(996);
Insert into t_r_indicatiftel_ind values(998);
Insert into t_r_indicatiftel_ind values(1242);
Insert into t_r_indicatiftel_ind values(1246);
Insert into t_r_indicatiftel_ind values(1264);
Insert into t_r_indicatiftel_ind values(1268);
Insert into t_r_indicatiftel_ind values(1284);
Insert into t_r_indicatiftel_ind values(1340);
Insert into t_r_indicatiftel_ind values(1345);
Insert into t_r_indicatiftel_ind values(1441);
Insert into t_r_indicatiftel_ind values(1473);
Insert into t_r_indicatiftel_ind values(1649);
Insert into t_r_indicatiftel_ind values(1664);
Insert into t_r_indicatiftel_ind values(1670);
Insert into t_r_indicatiftel_ind values(1671);
Insert into t_r_indicatiftel_ind values(1684);
Insert into t_r_indicatiftel_ind values(1721);
Insert into t_r_indicatiftel_ind values(1758);
Insert into t_r_indicatiftel_ind values(1767);
Insert into t_r_indicatiftel_ind values(1784);
Insert into t_r_indicatiftel_ind values(1868);
Insert into t_r_indicatiftel_ind values(1869);
Insert into t_r_indicatiftel_ind values(1876);

Insert into t_r_pays_pay(pay_nom) values('Afghanistan');
Insert into t_r_pays_pay(pay_nom) values('Afrique du Sud');
Insert into t_r_pays_pay(pay_nom) values('Albanie');
Insert into t_r_pays_pay(pay_nom) values('Algérie');
Insert into t_r_pays_pay(pay_nom) values('Allemagne');
Insert into t_r_pays_pay(pay_nom) values('Angola');
Insert into t_r_pays_pay(pay_nom) values('Antigua-et-Barbuda');
Insert into t_r_pays_pay(pay_nom) values('Arabie saoudite');
Insert into t_r_pays_pay(pay_nom) values('Argentine');
Insert into t_r_pays_pay(pay_nom) values('Arménie');
Insert into t_r_pays_pay(pay_nom) values('Australie');
Insert into t_r_pays_pay(pay_nom) values('Autriche');
Insert into t_r_pays_pay(pay_nom) values('Azerbaïdjan');
Insert into t_r_pays_pay(pay_nom) values('Bahamas');
Insert into t_r_pays_pay(pay_nom) values('Bahreïn');
Insert into t_r_pays_pay(pay_nom) values('Bangladesh');
Insert into t_r_pays_pay(pay_nom) values('Barbade');
Insert into t_r_pays_pay(pay_nom) values('Belau');
Insert into t_r_pays_pay(pay_nom) values('Belgique');
Insert into t_r_pays_pay(pay_nom) values('Belize');
Insert into t_r_pays_pay(pay_nom) values('Bénin');
Insert into t_r_pays_pay(pay_nom) values('Bhoutan');
Insert into t_r_pays_pay(pay_nom) values('Biélorussie');
Insert into t_r_pays_pay(pay_nom) values('Birmanie');
Insert into t_r_pays_pay(pay_nom) values('Bolivie');
Insert into t_r_pays_pay(pay_nom) values('Bosnie-Herzégovine');
Insert into t_r_pays_pay(pay_nom) values('Botswana');
Insert into t_r_pays_pay(pay_nom) values('Brésil');
Insert into t_r_pays_pay(pay_nom) values('Brunei');
Insert into t_r_pays_pay(pay_nom) values('Bulgarie');
Insert into t_r_pays_pay(pay_nom) values('Burkina');
Insert into t_r_pays_pay(pay_nom) values('Burundi');
Insert into t_r_pays_pay(pay_nom) values('Cambodge');
Insert into t_r_pays_pay(pay_nom) values('Cameroun');
Insert into t_r_pays_pay(pay_nom) values('Canada');
Insert into t_r_pays_pay(pay_nom) values('Cap-Vert');
Insert into t_r_pays_pay(pay_nom) values('Chili');
Insert into t_r_pays_pay(pay_nom) values('Chine');
Insert into t_r_pays_pay(pay_nom) values('Chypre');
Insert into t_r_pays_pay(pay_nom) values('Colombie');
Insert into t_r_pays_pay(pay_nom) values('Comores');
Insert into t_r_pays_pay(pay_nom) values('Congo');
Insert into t_r_pays_pay(pay_nom) values('Cook');
Insert into t_r_pays_pay(pay_nom) values('Corée du Nord');
Insert into t_r_pays_pay(pay_nom) values('Corée du Sud');
Insert into t_r_pays_pay(pay_nom) values('Costa Rica');
Insert into t_r_pays_pay(pay_nom) values('Côte d''Ivoire');
Insert into t_r_pays_pay(pay_nom) values('Croatie');
Insert into t_r_pays_pay(pay_nom) values('Cuba');
Insert into t_r_pays_pay(pay_nom) values('Danemark');
Insert into t_r_pays_pay(pay_nom) values('Djibouti');
Insert into t_r_pays_pay(pay_nom) values('Dominique');
Insert into t_r_pays_pay(pay_nom) values('Écosse');
Insert into t_r_pays_pay(pay_nom) values('Égypte');
Insert into t_r_pays_pay(pay_nom) values('Émirats arabes unis');
Insert into t_r_pays_pay(pay_nom) values('Équateur');
Insert into t_r_pays_pay(pay_nom) values('Érythrée');
Insert into t_r_pays_pay(pay_nom) values('Espagne');
Insert into t_r_pays_pay(pay_nom) values('Estonie');
Insert into t_r_pays_pay(pay_nom) values('États-Unis');
Insert into t_r_pays_pay(pay_nom) values('Éthiopie');
Insert into t_r_pays_pay(pay_nom) values('Fidji');
Insert into t_r_pays_pay(pay_nom) values('Finlande');
Insert into t_r_pays_pay(pay_nom) values('France');
Insert into t_r_pays_pay(pay_nom) values('Gabon');
Insert into t_r_pays_pay(pay_nom) values('Gambie');
Insert into t_r_pays_pay(pay_nom) values('Géorgie');
Insert into t_r_pays_pay(pay_nom) values('Ghana');
Insert into t_r_pays_pay(pay_nom) values('Grèce');
Insert into t_r_pays_pay(pay_nom) values('Grenade');
Insert into t_r_pays_pay(pay_nom) values('Guatemala');
Insert into t_r_pays_pay(pay_nom) values('Guinée');
Insert into t_r_pays_pay(pay_nom) values('Guinée-Bissao');
Insert into t_r_pays_pay(pay_nom) values('Guinée équatoriale');
Insert into t_r_pays_pay(pay_nom) values('Guyana');
Insert into t_r_pays_pay(pay_nom) values('Haïti');
Insert into t_r_pays_pay(pay_nom) values('Honduras');
Insert into t_r_pays_pay(pay_nom) values('Hongrie');
Insert into t_r_pays_pay(pay_nom) values('Inde');
Insert into t_r_pays_pay(pay_nom) values('Indonésie');
Insert into t_r_pays_pay(pay_nom) values('Iran');
Insert into t_r_pays_pay(pay_nom) values('Irak');
Insert into t_r_pays_pay(pay_nom) values('Irlande');
Insert into t_r_pays_pay(pay_nom) values('Islande');
Insert into t_r_pays_pay(pay_nom) values('Israël');
Insert into t_r_pays_pay(pay_nom) values('Italie');
Insert into t_r_pays_pay(pay_nom) values('Jamaïque');
Insert into t_r_pays_pay(pay_nom) values('Japon');
Insert into t_r_pays_pay(pay_nom) values('Jordanie');
Insert into t_r_pays_pay(pay_nom) values('Kazakhstan');
Insert into t_r_pays_pay(pay_nom) values('Kenya');
Insert into t_r_pays_pay(pay_nom) values('Kirghizistan');
Insert into t_r_pays_pay(pay_nom) values('Kiribati');
Insert into t_r_pays_pay(pay_nom) values('Koweït');
Insert into t_r_pays_pay(pay_nom) values('Laos');
Insert into t_r_pays_pay(pay_nom) values('Lesotho');
Insert into t_r_pays_pay(pay_nom) values('Lettonie');
Insert into t_r_pays_pay(pay_nom) values('Liban');
Insert into t_r_pays_pay(pay_nom) values('Liberia');
Insert into t_r_pays_pay(pay_nom) values('Libye');
Insert into t_r_pays_pay(pay_nom) values('Liechtenstein');
Insert into t_r_pays_pay(pay_nom) values('Lituanie');
Insert into t_r_pays_pay(pay_nom) values('Luxembourg');
Insert into t_r_pays_pay(pay_nom) values('Macédoine');
Insert into t_r_pays_pay(pay_nom) values('Madagascar');
Insert into t_r_pays_pay(pay_nom) values('Malaisie');
Insert into t_r_pays_pay(pay_nom) values('Malawi');
Insert into t_r_pays_pay(pay_nom) values('Maldives');
Insert into t_r_pays_pay(pay_nom) values('Mali');
Insert into t_r_pays_pay(pay_nom) values('Malte');
Insert into t_r_pays_pay(pay_nom) values('Maroc');
Insert into t_r_pays_pay(pay_nom) values('Marshall');
Insert into t_r_pays_pay(pay_nom) values('Maurice');
Insert into t_r_pays_pay(pay_nom) values('Mauritanie');
Insert into t_r_pays_pay(pay_nom) values('Mexique');
Insert into t_r_pays_pay(pay_nom) values('Micronésie');
Insert into t_r_pays_pay(pay_nom) values('Moldavie');
Insert into t_r_pays_pay(pay_nom) values('Monaco');
Insert into t_r_pays_pay(pay_nom) values('Mongolie');
Insert into t_r_pays_pay(pay_nom) values('Mozambique');
Insert into t_r_pays_pay(pay_nom) values('Namibie');
Insert into t_r_pays_pay(pay_nom) values('Nauru');
Insert into t_r_pays_pay(pay_nom) values('Népal');
Insert into t_r_pays_pay(pay_nom) values('Nicaragua');
Insert into t_r_pays_pay(pay_nom) values('Niger');
Insert into t_r_pays_pay(pay_nom) values('Nigeria');
Insert into t_r_pays_pay(pay_nom) values('Niue');
Insert into t_r_pays_pay(pay_nom) values('Norvège');
Insert into t_r_pays_pay(pay_nom) values('Nouvelle-Zélande');
Insert into t_r_pays_pay(pay_nom) values('Oman');
Insert into t_r_pays_pay(pay_nom) values('Ouganda');
Insert into t_r_pays_pay(pay_nom) values('Ouzbékistan');
Insert into t_r_pays_pay(pay_nom) values('Pakistan');
Insert into t_r_pays_pay(pay_nom) values('Palestine');
Insert into t_r_pays_pay(pay_nom) values('Panama');
Insert into t_r_pays_pay(pay_nom) values('Papouasie - Nouvelle Guinée');
Insert into t_r_pays_pay(pay_nom) values('Paraguay');
Insert into t_r_pays_pay(pay_nom) values('Pays-Bas');
Insert into t_r_pays_pay(pay_nom) values('Pérou');
Insert into t_r_pays_pay(pay_nom) values('Philippines');
Insert into t_r_pays_pay(pay_nom) values('Pologne');
Insert into t_r_pays_pay(pay_nom) values('Portugal');
Insert into t_r_pays_pay(pay_nom) values('Qatar');
Insert into t_r_pays_pay(pay_nom) values('République centrafricaine');
Insert into t_r_pays_pay(pay_nom) values('République démocratique du Congo');
Insert into t_r_pays_pay(pay_nom) values('République dominicaine');
Insert into t_r_pays_pay(pay_nom) values('République tchèque');
Insert into t_r_pays_pay(pay_nom) values('Roumanie');
Insert into t_r_pays_pay(pay_nom) values('Royaume-Uni');
Insert into t_r_pays_pay(pay_nom) values('Russie');
Insert into t_r_pays_pay(pay_nom) values('Rwanda');
Insert into t_r_pays_pay(pay_nom) values('Saint-Christophe-et-Niévès');
Insert into t_r_pays_pay(pay_nom) values('Sainte-Lucie');
Insert into t_r_pays_pay(pay_nom) values('Saint-Marin');
Insert into t_r_pays_pay(pay_nom) values('Saint-Siège');
Insert into t_r_pays_pay(pay_nom) values('Saint-Vincent-et-les-Grenadine');
Insert into t_r_pays_pay(pay_nom) values('Salomon');
Insert into t_r_pays_pay(pay_nom) values('Salvador');
Insert into t_r_pays_pay(pay_nom) values('Samoa occidentales');
Insert into t_r_pays_pay(pay_nom) values('Sao Tomé-et-Principe');
Insert into t_r_pays_pay(pay_nom) values('Sénégal');
Insert into t_r_pays_pay(pay_nom) values('Seychelles');
Insert into t_r_pays_pay(pay_nom) values('Sierra Leone');
Insert into t_r_pays_pay(pay_nom) values('Singapour');
Insert into t_r_pays_pay(pay_nom) values('Slovaquie');
Insert into t_r_pays_pay(pay_nom) values('Slovénie');
Insert into t_r_pays_pay(pay_nom) values('Somalie');
Insert into t_r_pays_pay(pay_nom) values('Soudan');
Insert into t_r_pays_pay(pay_nom) values('Sri Lanka');
Insert into t_r_pays_pay(pay_nom) values('Suède');
Insert into t_r_pays_pay(pay_nom) values('Suisse');
Insert into t_r_pays_pay(pay_nom) values('Suriname');
Insert into t_r_pays_pay(pay_nom) values('Swaziland');
Insert into t_r_pays_pay(pay_nom) values('Syrie');
Insert into t_r_pays_pay(pay_nom) values('Tadjikistan');
Insert into t_r_pays_pay(pay_nom) values('Tanzanie');
Insert into t_r_pays_pay(pay_nom) values('Tchad');
Insert into t_r_pays_pay(pay_nom) values('Thaïlande');
Insert into t_r_pays_pay(pay_nom) values('Togo');
Insert into t_r_pays_pay(pay_nom) values('Tonga');
Insert into t_r_pays_pay(pay_nom) values('Trinité-et-Tobago');
Insert into t_r_pays_pay(pay_nom) values('Tunisie');
Insert into t_r_pays_pay(pay_nom) values('Turkménistan');
Insert into t_r_pays_pay(pay_nom) values('Turquie');
Insert into t_r_pays_pay(pay_nom) values('Tuvalu');
Insert into t_r_pays_pay(pay_nom) values('Ukraine');
Insert into t_r_pays_pay(pay_nom) values('Uruguay');
Insert into t_r_pays_pay(pay_nom) values('Vanuatu');
Insert into t_r_pays_pay(pay_nom) values('Venezuela');
Insert into t_r_pays_pay(pay_nom) values('Viêt Nam');
Insert into t_r_pays_pay(pay_nom) values('Yémen');
Insert into t_r_pays_pay(pay_nom) values('Yougoslavie');
Insert into t_r_pays_pay(pay_nom) values('Zambie');
Insert into t_r_pays_pay(pay_nom) values('Zimbabwe');

Insert into t_r_cuisine_cui(cui_libelle) values('Africaine');
Insert into t_r_cuisine_cui(cui_libelle) values('Américaine');
Insert into t_r_cuisine_cui(cui_libelle) values('Asiatique');
Insert into t_r_cuisine_cui(cui_libelle) values('Boulangerie/Patisserie');
Insert into t_r_cuisine_cui(cui_libelle) values('Barbecue/Grillades');
Insert into t_r_cuisine_cui(cui_libelle) values('Britannique');
Insert into t_r_cuisine_cui(cui_libelle) values('Café');
Insert into t_r_cuisine_cui(cui_libelle) values('Cajun & créole');
Insert into t_r_cuisine_cui(cui_libelle) values('Caraïbes');
Insert into t_r_cuisine_cui(cui_libelle) values('Chinoise');
Insert into t_r_cuisine_cui(cui_libelle) values('Continentale');
Insert into t_r_cuisine_cui(cui_libelle) values('Charcuterie');
Insert into t_r_cuisine_cui(cui_libelle) values('Desserts');
Insert into t_r_cuisine_cui(cui_libelle) values('Europe de l''Est');
Insert into t_r_cuisine_cui(cui_libelle) values('Fusion');
Insert into t_r_cuisine_cui(cui_libelle) values('Européenne');
Insert into t_r_cuisine_cui(cui_libelle) values('Française');
Insert into t_r_cuisine_cui(cui_libelle) values('Allemande');
Insert into t_r_cuisine_cui(cui_libelle) values('Internationale');
Insert into t_r_cuisine_cui(cui_libelle) values('Grecque');
Insert into t_r_cuisine_cui(cui_libelle) values('Indienne');
Insert into t_r_cuisine_cui(cui_libelle) values('Irlandaire');
Insert into t_r_cuisine_cui(cui_libelle) values('Italienne');
Insert into t_r_cuisine_cui(cui_libelle) values('Japonaise');
Insert into t_r_cuisine_cui(cui_libelle) values('Méditerranéenne');
Insert into t_r_cuisine_cui(cui_libelle) values('Mexicaine/Tex-mex');
Insert into t_r_cuisine_cui(cui_libelle) values('Moyen Orient');
Insert into t_r_cuisine_cui(cui_libelle) values('Pizza');
Insert into t_r_cuisine_cui(cui_libelle) values('Pub');
Insert into t_r_cuisine_cui(cui_libelle) values('Fruits de mer/Poisson');
Insert into t_r_cuisine_cui(cui_libelle) values('Soupes');
Insert into t_r_cuisine_cui(cui_libelle) values('Amérique du Sud');
Insert into t_r_cuisine_cui(cui_libelle) values('Espagnole');
Insert into t_r_cuisine_cui(cui_libelle) values('Steakhouse');
Insert into t_r_cuisine_cui(cui_libelle) values('Sushi');
Insert into t_r_cuisine_cui(cui_libelle) values('Thaï');
Insert into t_r_cuisine_cui(cui_libelle) values('Végétarienne');
Insert into t_r_cuisine_cui(cui_libelle) values('Vietnamienne');

Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Jean-Michel', 'info', 'jean-michel.aulas@gmail.com', 'AULAS', 'Jean-Michel', '10 Avenue Général Frère', '69008', 'Lyon', 64, 45.729394, 4.879395, 33, '401020304', 'Lyon');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Yohann', 'info', 'yohann.gourcuf@gmail.com', 'GOURCUF', 'Yohann', 'Rue Maryse Bastié', '69500', 'Bron', 64, 45.726888, 4.922322, 33, '401020305', 'Lyon');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Tony', 'info', 'tony.parker@gmail.com', 'PARKER', 'Tony', '3 rue du 8 mai 1945', '69100', 'Villeurbanne', 64, 45.781412, 4.891292, 33, '401020305', 'Lyon');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Juninho', 'info', 'juninho.pernambucano@gmail.com', 'PERNAMBUCANO', 'Juninho', '10 rue des 3 Rois', '69007', 'Lyon', 64, 45.75398, 4.842775, 33, '401020305', 'Lyon');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Homer', 'info', 'homer.simpson@gmail.com', 'SIMPSON', 'Homer', '11 rue Sommeiller', '74000', 'Annecy', 64, 45.902126, 6.123754, 33, '450010203', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Marge', 'info', 'marge.simpson@gmail.com', 'SIMPSON', 'Marge', '11 rue Sommeiller', '74000', 'Annecy', 64, 45.902126, 6.123754, 33, '450010204', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Matt', 'info', 'matt.groening@gmail.com', 'GROENING', 'Matt', '9 rue de l''Arc en Ciel', '74940', 'Annecy Le Vieux', 64, 45.921153, 6.153794, 33, '450010205', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Bart', 'info', 'moe.szyslak@gmail.com', 'SZYSLAK', 'Moe', '5 Chemin de Bellevue', '74940', 'Annecy Le Vieux', 64, 45.920254, 6.16188, 33, '450010206', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Bob', 'info', 'bart.simpson@gmail.com', 'SIMPSON', 'Bart', 'Chef-Lieu', '74150', 'Vaulx', 64, 45.885129, 5.94805, 33, '450010207', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Joe', 'info', 'bob.leponge@gmail.com', 'LEPONGE', 'Bob', '50 route de Poisy', '74330', 'Lovagny', 64, 45.903805, 6.031961, 33, '450010208', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Jeff', 'info', 'joe.quimby@gmail.com', 'QUIMBY', 'Joe', 'Place Gabriel Fauré', '74940', 'Annecy le Vieux', 64, 45.91972, 6.142131, 33, '450010209', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Barney', 'info', 'jeff.albertson@gmail.com', 'ALBERTSON', 'Jeff', 'Place de la Navigation 2', '1201', 'Genève', 171, 46.211399, 6.14983, 41, '227354438', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Mel', 'info', 'barney.gumble@gmail.com', 'GUMBLE', 'Barney', '21, quai des Bergues', '1201', 'Genève', 171, 46.20615, 6.14461, 41, '227354439', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Mel', 'info', 'mel.sideshow@gmail.com', 'SIDESHOW', 'Mel', 'Route de la Galaise 8', '1228', 'Plan-les-Ouates', 171, 46.164563, 6.105927, 41, '227354440', 'Genève');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Winnie', 'info', 'winnie.lourson@gmail.com', 'LOURSON', 'Winnie', 'Kornhausstrasse 3', '3000', 'Bern', 171, 46.95303, 7.44966, 41, '227354441', 'Zurich');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Candy', 'info', 'candy.crush@gmail.com', 'CRUSH', 'Candy', 'Zeughausgasse 41', '3000', 'Bern', 171, 46.949089, 7.44456, 41, '227354442', 'Zurich');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Capitaine', 'info', 'capitaine.flam@gmail.com', 'FLAM', 'Capitaine', 'Claridenstrasse 30', '8022', 'Zurich', 171, 47.367611, 8.53718, 41, '227354443', 'Zurich');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Ken', 'info', 'ken.lesurvivant@gmail.com', 'LESURVIVANT', 'Ken', 'Weinbergstrasse 92', '8006', 'Zurich', 171, 47.384696, 8.542859, 41, '227354444', 'Zurich');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Mario', 'info', 'mario.bros@gmail.com', 'BROS', 'Mario', 'Via Di Ripetta 231', '00186', 'Roma', 86, 41.908498, 12.476017, 39, '677261658', 'Roma');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Luigi', 'info', 'luigi.bros@gmail.com', 'BROS', 'Luigi', 'Via del Pellegrino 122', '00186', 'Roma', 86, 41.89702, 12.470217, 39, '677261659', 'Roma');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Peach', 'info', 'peach.princesse@gmail.com', 'PRINCESSE', 'Peach', 'Via V. Veneto 155', '00187', 'Roma', 86, 41.908244, 12.489189, 39, '677261660', 'Roma');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Diddy', 'info', 'diddy.kong@gmail.com', 'KONG', 'Diddy', 'Via Mario De Fiori 93', '00187', 'Roma', 86, 41.904565, 12.481899, 39, '677261661', 'Roma');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('William', 'info', 'william.decambridge@gmail.com', 'DE CAMBRIDGE', 'William', '22 Portman Square', 'W1H 7BG ', 'London', 149, 51.516231, -0.157945, 44, '2073887666', 'London');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Kate', 'info', 'kate.middleton@gmail.com', 'MIDDLETON', 'Kate', 'A41 Watford Bypass', 'WD25 8JH', 'Watford', 149, 51.657604, -0.349246, 44, '2073887667', 'London');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Pippa', 'info', 'pippa.middleton@gmail.com', 'MIDDLETON', 'Pippa', '19 Bridle Path', 'WD17 1UE', 'Watford', 149, 51.664622, -0.398241, 44, '2073887668', 'London');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('George', 'info', 'george.decambridge@gmail.com', 'DE CAMBRIDGE', 'George', 'Primrose Hill Rd', 'NW3 3NA', 'London', 149, 51.544239, -0.162251, 44, '2073887669', 'London');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Frank', 'info', 'frank.ribbery@gmail.com', 'RIBBERY', 'Frank', 'Gabriele-Tergit-Promenade 19', '10963', 'Berlin', 5, 52.504639, 13.374837, 49, '304172400', 'Berlin');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Benoit', 'info', 'benoit.treize@gmail.com', 'TREIZE', 'Benoit', 'Landsberger Allee 106', '10369', 'Berlin', 5, 52.528562, 13.457339, 49, '304172401', 'Berlin');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Angela', 'info', 'angela.merkel@gmail.com', 'MERKEL', 'Angela', 'Wittenbergplatz 5', '10789', 'Berlin', 5, 52.502727, 13.343332, 49, '304172402', 'Berlin');
Insert into t_e_abonne_abo(abo_pseudo, abo_motpasse, abo_mel, abo_nom, abo_prenom, abo_adrligne1, abo_cp, abo_ville, pay_id, abo_latitude, abo_longitude, ind_indicatif, abo_tel, abo_aeroport) values('Rainer', 'info', 'rainer.wolfcastle@gmail.com', 'WOLFCASTLE', 'Rainer', 'Charlottenstrasse 49', '10117', 'Berlin', 5, 52.515126, 13.390790, 49, '304172403', 'Berlin');

Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€€€', 'Restaurant Le Clos des Sens', 'La cuisine du Clos des Sens est rythmée par les saisons, par l''élaboration d''une carte qui ose et surprend tout en conservant l''esprit de subtiles associations. De ces rencontres inattendues naissent l''harmonie et la redécouverte unique de chacun des produits ainsi sublimés.', '50 € - 140 €', '13 Rue Jean Mermoz', '74940', 'Annecy-le-Vieux', 64, 45.917074, 6.14548, 33, '450230790', 'http://www.closdessens.com', 'closdessens@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€', 'L''Atelier des 4 Gourmets', 'L''Atelier des 4 Gourmets est un restaurant d''inspiration italienne labellisé Maitre artisan restaurateur. L''établissement compte également une épicerie fine italienne, une cave à vins ainsi qu''un atelier cours de cuisine.', '18 € - 40 €', '16 rue Jean Mermoz', '74940', 'Annecy-le-Vieux', 64, 45.918476, 6.143679, 33, '450230791', 'http://latelier.les4gourmets.com', 'les4gourmets@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€€', 'Restaurant du clocher', 'Nous vous accueillons tous les jours de l''année midi et soir, nous disposons de grands parkings à proximité. Venez déguster notre cuisine traditionnelle et conviviale dans l''ambiance chaleureuse de la salle de restaurant ou sur la terrasse à l''ombre de nos arbres.', '17 € - 70 €', '20 place Gabriel Faure', '74940', 'Annecy-le-Vieux', 64, 45.919934, 6.14218, 33, '450230792', 'http://www.le-clocher.com', 'leclocher@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€', 'La Nef des Fous', 'La Nef des Fous- Galerie B''Art', '5 € - 14 €', '11 rue centrale', '74940', 'Annecy-le-Vieux', 64, 45.907181, 6.150237, 33, '450230793', null, 'nefdesfsous@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€', 'In Bocca Lupo', 'Cuisine Italienne', '20 € - 40 €', '11 rue de Lachat ', '74940', 'Annecy-le-Vieux', 64, 45.921256, 6.145531, 34, '450230794', null, 'boccalupo@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€', 'La Trinquette', 'Spécialités de poisson', '20 € - 40 €', '27 Avenue Petit Port', '74940', 'Annecy-le-Vieux', 64, 45.905246, 6.15071, 34, '450230795', null, 'trinquette@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€', 'Pizza Relax', 'Pizzeria', '5 € - 14 €', '9 Rue des Ecoles', '74940', 'Annecy-le-Vieux', 64, 45.9119, 6.144095, 34, '450230796', null, 'pizzarelax@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€', 'Marina Bay', 'Cuisine moderne, bar', '10 € - 25 €', '59 Avenue Petit Port', '74940', 'Annecy-le-Vieux', 64, 45.905913, 6.154789, 34, '450230797', null, 'marinabay@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€', 'Brasserie Le Parc', 'Brasserie, bar', '10 € - 25 €', '12 Rue Centrale', '74940', 'Annecy-le-Vieux', 64, 45.90651, 6.146369, 34, '450230798', null, 'brasserieduparc@gmail.com');
Insert into t_e_restaurant_res(prx_prix, res_nom, res_description, res_categorieprix, res_adrligne1, res_cp, res_ville, pay_id, res_latitude, res_longitude, ind_indicatif, res_tel, res_siteweb, res_mel) values('€€', 'L''Annexe d''Albigny', 'Hambugers', '5 € - 20 €', '13, rue Centrale', '74940', 'Annecy-le-Vieux', 64, 45.907181, 6.150237, 34, '450230799', null, 'annexe.albigny@gmail.com');


Insert into t_j_cuisineresto_cur(res_id, cui_id) values(1, 16); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(1, 17); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(2, 23); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(3, 17); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(3, 19); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(4, 25); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(4, 33); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(5, 23); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(6, 30); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(6, 17); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(7, 28); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(8, 5); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(8, 2); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(9, 5); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(9, 7); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(9, 2); 
Insert into t_j_cuisineresto_cur(res_id, cui_id) values(10, 17); 

Insert into t_j_favori_fav values(5, 1);
Insert into t_j_favori_fav values(6, 1);
Insert into t_j_favori_fav values(7, 1);
Insert into t_j_favori_fav values(1, 2);
Insert into t_j_favori_fav values(3, 3);
Insert into t_j_favori_fav values(1, 4);
Insert into t_j_favori_fav values(2, 4);
Insert into t_j_favori_fav values(3, 4);
Insert into t_j_favori_fav values(4, 4);
Insert into t_j_favori_fav values(5, 4);
Insert into t_j_favori_fav values(6, 4);
Insert into t_j_favori_fav values(7, 4);
Insert into t_j_favori_fav values(8, 4);

Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 1, 4, '€€€€', 5, '1/02/11', 'Une pure merveille', 'Après l''apéritif pris sur une terrasse dominant Annecy, un succulent repas qui régale les yeux et les papilles. S''offrir une soirée dans ce restaurant est une pure merveille.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 6, '1/03/11', 'Tout simplement parfait ', 'Nous revenons pour la seconde fois et le charme continue à opérer. Le cadre, l''accueil de tout le personnel attentif et attentionné, contribuent à la magie des lieux.', 5, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 3, 4, '€€€€', 7, '1/04/11', 'Un régal pour les papilles!', 'L''ambiance, le service et les nombreuses surprises du chef ont fait de ce repas et de cette soirée une expérience inoubliable. Un festival de saveurs, avec une liste de vins presque infinie, et des plats copieux et variés font de ce restaurant une adresse incontournable.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 4, 4, '€€€', 1, '1/05/11', 'Une table enchanteresse, un service parfait', 'Nous avons suivi l''ascension du Clos des Sens depuis plusieurs années, et nous y revenons toujours avec la même emotion. Le Chef, desormais detenteur de 2 etoiles largement meritees, est au sommet de son art. Son epouse, attentive aux moindres details, de l''accueil au service, veille au parfait bien etre des clients avec une amabilite, un professionnalisme et une efficacite sans faille.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 1, 4, '€€€€', 2, '1/06/11', 'Je préfère Veyrat', 'Un repas cher, des serveurs pas au top. Je suis déçu par rapport au prix. Il me semble préférable de mettre 50 euros de plus et d''aller chez Veyrat qui en plus propose une cuisine atypique', 1, 1, 1, 1, 1);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 3, '1/07/11', 'Exceptionnellement bon!', '2 fois que nous y allons et rien à dire... Enfin si plutôt : un moment divin! Adepte de la cuisine de Laurent petit, le Clos des Sens, vient chapeauter les trois autres restaurants du chef (Contre sens, Café Brunet et Bœuf patate). ', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 3, 4, '€€€€', 4, '1/08/11', 'Très bien', 'Un restaurant gastronomique accessible à tous grâce à ses différents menus !! Très bel endroit, moderne et chaleureux. ', 4, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 4, 4, '€€€', 8, '1/09/11', 'Quelle expérience!!!', 'C''était notre première expérience étoilée... Magique! Le menu découverte en 8 services nous a offert un véritable réveil des papilles. Craignant d''être déplacés en un lieu trop pompeux, nous avons déjeuné dans une ambiance feutrée et chaleureuse. Les vins suggérés par le sommeiller ont accompagné divinement les assiettes jusqu''aux desserts.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 1, 4, '€€€€', 9, '1/10/11', 'Cuisine de très haut niveau, service à revoir', 'Le service n''est pas à la hauteur. Les serveurs sont gentils quoiqu''un peu amateurs, le sommelier est inexistant, le maître d''hôtel a les manières d''un chef de rang d''une brasserie moyenne et le chef est absent. C''est dommage, on aurait aimé, comme il est d''usage dans ce types de lieux, faire un brin de causette en fin de repas.', 3, 4, 2, 3, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 10, '1/11/11', 'Excellent', 'En famille pour un anniversaire, le repas (menu au choix du chef selon son marché) à été tout simplement parfait!!!!!!!!!!! Aucune fausse note avec une mention extraordinnaire pour les desserts.....', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 3, 4, '€€€€', 11, '1/12/11', 'Un moment juste parfait', 'Nous avons passé un moment d''exception .notre première impression a été plus que favorable .l''accueil du directeur du restaurant efficace ,sobre,et distingué nous a permis de passer une excellente journée.les plats se sont succédés ,tout à été un vrai délice.varié et surprenant un vrai bon moment.', 4, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 4, 4, '€€€', 5, '1/01/12', 'Moment d''exception', 'Cadre sympa à découvrir. Vue sur le lac de la terrasse, belle piscine..... Accueil très chaleureux et pourtant discret. Table "superbe" à découvrir...et à recommander. avons dégusté le menu Découverte, ce fut une réelle découverte des produits de saison du jardin et de leurs accords. Bravo au chef pour toutes ces créations.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 1, 4, '€€€€', 6, '1/02/12', 'Un restaurant qui mérite bien son nom', 'Nous sommes allés dans ce restaurant à pour fêter un évènement familial. Première impression : Un restaurant localisé un peu à l''écart d''Annecy, décoré avec goût. Petit plus pour le parasol naturel, un marronnier au milieu des tables dont les branches recouvraient la terrasse en un petit plafond. ', 4, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 7, '1/03/12', 'Un moment agréable', 'Nous avons déjeuner en famille en terrasse pendant une belle journée d''août. Nous avons pris le menu découverte, c''était vraiment très bien, varié, surprenant (pigeonneau, écrevisse, légumes, ...). Un petit bémol sur le deuxième et dernier dessert (chocolat+menthe glacée) qui n''était peut-être pas assez léger à ce stade du repas.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 3, 4, '€€€€', 12, '1/04/12', 'Tous les sens en éveil !', 'Pour nos 7 ans de mariage, nous avons eu droit à la soirée parfaite. Le cadre magnifique (terrasse avec vue sur Annecy le vieux et arbre centenaire au milieu des tables...) y acontribué, mais pas seulement. La cuisine est vraiment orientée sur les sens. Nous avons pris le menu Originel et ne l''avons pas regretté.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 4, 4, '€€€€', 13, '1/05/12', 'Petit bémol', 'Décor moderne et agréable, Le Clos des Sens offre une cuisine exceptionnelle qui est à la hauteur des concurrents de la région... inventivité, délicatesse.. nous avons apprécié cette cuisine de haut niveau.
Petit bémol : le service à revoir. ', 4, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 1, 4, '€€€€', 14, '1/06/12', 'Repas délicieux et personnel aux petits soins', 'Nous avons choisi le Clos des Sens pour fêter un événement en famille, et à aucun moment nous n''avons regretté notre réservation. L''ambiance, l''architecture et la décoration sont déjà à elles seules dignes d''intérêt (je suis sensible à ces détails...) ! Nous avons apprécié la terrasse sous le plafond de marronniers, qui constitue un point de vue en hauteur sur la ville, cadre agréable pour un déjeuner en cas de beau temps.', 4, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 15, '1/07/12', 'MENTION TRES BIEN', 'Plaisirs des yeux et des sens , des amuses bouches aux mignardises en passant par les 9 plats tous aussi originaux, beaux à voir et fins, les uns que les autres. Service efficace, souriant et agréable (mention particulière pour Camille) qui vous fait vous régaler rien qu''en annonçant les plats. Et que dire de la terrasse, au calme, avec vue dégagée sur Annecy.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 3, 4, '€€€€', 16, '1/08/12', 'A ne pas manquer à Annecy le Vieux', 'Cadre moderne au dessus du lac d''Annecy, le Clos des Sens est une révélation depuis que le grand restaurateur au chapeau noir a disparu. Menu à 100 ou 130 euros, les plats sont travaillės et originaux mettant un accès particulier aux poissons et crustacés du lac. En particulier une écrevisse brute dans sa bisque ou une truite sauvage.', 4, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 4, 4, '€€€€', 17, '1/09/12', 'Cuisine excellente.....', 'Très belle carte des vins en particulier régionaux parmi lesquels quelques perles. Nous étions plusieurs couples et avons passé une excellente soirée. Seul gros bémol: le service devrait être largement amélioré par rapport au niveau de la cuisine et aux tarifs. Annonces des plats erronées, absence et sommelier peu ouvert à l''échange. Voilà pourquoi nous ne sommes pas à l''excellence cette fois. Mais nous reviendrons c''est sûr.', 4, 4, 4, 4, 4);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 1, 4, '€€€€', 18, '1/10/12', 'Un restau ou l''on se sent attendu', 'Un repas découverte génial. Je voulais un verre de vin rouge, il ne me convenait pas car je n''y connais rien mais j''aime ou j''aime pas. Sans prob. m''en ont apporté un autre de "côtes roties" absolument fabuleux! Des produits très recherchés , c''est vraiment délicieux. Un accueil parfait et des tables espacées. Ce restau. vaut vraiment le détour.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 19, '1/11/12', 'Parfait de l''accueil au départ !', 'Un travail exceptionnel sur des produits qui vous fait découvrir des saveurs inconnues et retrouver d''autres oubliées ! le fenouil, les cèpes etc...comme jamais vous ne les avez dégustés
Laissez vous tenter par les menus originel ou découverte, chaque plat sera une surprise dans sa présentation et ses saveurs ', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 3, 4, '€€€€', 20, '1/12/12', 'Un moment exceptionnel', 'Dès que nous avons franchi les portes du Clos des Sens, nous avons été chaleureusement accueillis. Un peu comme de vieux amis dont on attend la venue. Toute l''équipe a su s''adapter au changement de dernière minute ( nous avions réservé pour trois et arrivons à six dont un bébé). Nous avons été particulièrement sensibles à l''attention portée à notre fille de neuf mois. A cuisine exceptionnelle, service exceptionnel : toute l''équipe du restaurant, de la cuisine à la salle œuvre en parfaite harmonie.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 4, 4, '€€€', 21, '1/01/13', 'Toujours aussi bon', 'C''est notre deuxième Originel Original et c''est toujours le même plaisir. De la coupe de Krug au papier de sucre, tout était parfait, j''ai même réussi à prendre plaisir à manger des ris de veau (c''était pas gagné...). Les plats de crustacés et poissons étaient simplement fabuleux, un équilibre de saveurs et textures superbes, des cuissons parfaites, vraiment rien à redire. ', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 1, 4, '€€€€', 22, '1/02/13', 'On ne veut plus partir !', 'Le temps s''arrête lorsque l''on met les pieds dans cette magnifique bâtisse. Une seule chose à faire : profiter d''un accueil délicieux accompagné d''une vue imprenable et d''un décor parfait. Les amuses bouche aussi goûteux soient ils, ne représentent alors que les prémices d''un repas inoubliable.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 5, '1/03/13', 'le meilleur !', 'cuisine superbe ! le cuisto a réussi a me faire manger des produit que je n''aimais pas. du grand art culinaire !', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 3, 4, '€€€€', 6, '1/04/13', 'Magnifique !', 'Un accueil pétillant. Un sommelier attentif aux choix pertinents. Des plats aux saveurs et aux textures hors du commun. Nous avons passé un moment inoubliable. Du homard à la goutte d''eau passion-café, tout nous a emporté dans un monde de bonheur. Le luxe et la simplicité se confondent pour nous faire vivre une expérience sensationnelle.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 4, 4, '€€€', 7, '1/05/13', 'le bonheur à l''état pur', 'Un voyage culinaire fabuleux dans le monde de Laurent PETIT. Nous avons opté pour le menu gastronomique et sommes allés de surprises en surprises. C''est de la haute voltige, du grand art culinaire. Service parfait, tout en simplicité et en sourires. Seul petit, mais tout petit bémol, dressage de la table un peu tristounet. Une petite fleur aurait égayé le blanc de la nappe.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€', 23, '1/06/13', 'Magique', 'Magique ! C''est bien le mot approprié pour évoquer ce superbe déjeuner passé au Clos des Sens. La cuisine fût un sans-faute du début à la fin. De la créativité, de la technique, des innovations, beaucoup de travail dans l''assiette au service du plaisir et des émotions gustatives, un régal.', 5, 5, 5, 5, 5);
Insert into t_e_avis_avi(res_id, vis_id, rep_id,  prx_prix, abo_id, avi_date, avi_titre, avi_detail, avi_noteglobale, avi_notecuisine, avi_noteservice, avi_notequaliteprix, avi_noteambiance) values(1, 2, 4, '€€€€', 24, '1/07/13', 'Mauvais rapport qualité-prix', 'Je ne sais pas si le chef était aux cuisines aujourd''hui car j''ai eu l''impression d''avoir à faire à des commis de cuisine n''ayant pas leur CAP. En outre, le serveuse a tiré la gueule pendant toute la soirée. Je suis déçue alors que la dernière fois, ce fut exceptionnel.', 1, 1, 1, 1, 1);

Insert into t_e_photo_pho(res_id, avi_id, pho_url) values(1, null, 'images/img1.jpg'); 
Insert into t_e_photo_pho(res_id, avi_id, pho_url) values(1, null, 'images/img2.jpg'); 
Insert into t_e_photo_pho(res_id, avi_id, pho_url) values(1, null, 'images/img3.jpg'); 
Insert into t_e_photo_pho(res_id, avi_id, pho_url) values(null, 1, 'images/img4.jpg'); 
Insert into t_e_photo_pho(res_id, avi_id, pho_url) values(null, 2, 'images/img5.jpg'); 