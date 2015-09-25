CREATE PROCEDURE SPRestaurant_Insert(
	@PRX_Prix             char(4),
	@RES_NOM	          varchar(80),
	@RES_DESCRIPTION	  varchar(500),
	@RES_CATEGORIEPRIX	  varchar(20),
	@RES_ADRLIGNE1        varchar(100),
	@RES_ADRLIGNE2        varchar(100),
	@RES_CP               varchar(10),
	@RES_VILLE            varchar(50),
	@RES_ETAT             varchar(50),
	@PAY_ID               int,
	@RES_LATITUDE		  float,
	@RES_LONGITUDE		  float,
	@IND_INDICATIF        int,
	@RES_TEL              varchar(15),
	@RES_SITEWEB          varchar(100),
	@RES_MEL              varchar(80),
	@ID					  int OUTPUT
	)
AS
BEGIN	
	DECLARE @CODEERREUR int=0
	
	INSERT INTO t_e_restaurant_res (
		prx_prix, 
		res_nom, 
		res_description,
		res_categorieprix,
		res_adrligne1, 
		res_adrligne2,
		res_cp, 
		res_ville, 
		res_etat, 
		pay_id,
		res_latitude,
		res_longitude,
		ind_indicatif, 
		res_tel,
		res_siteweb,
		res_mel
		)
	VALUES(
		@PRX_Prix,
		@RES_NOM,
		@RES_DESCRIPTION,
		@RES_CATEGORIEPRIX,
		@RES_ADRLIGNE1,
		@RES_ADRLIGNE2,
		@RES_CP,
		@RES_VILLE,
		@RES_ETAT,
		@PAY_ID,
		@RES_LATITUDE,
		@RES_LONGITUDE,
		@IND_INDICATIF,
		@RES_TEL,
		@RES_SITEWEB,
		@RES_MEL
	)

	SET @CODEERREUR = @@ERROR /*Récupération du numéro d'erreur via la variable d'environnement @@ERROR*/
	
	IF @CODEERREUR<>0
		SET @ID=-1
	ELSE
		BEGIN
			/*Récupération de l'identifiant*/
			SELECT @ID=@@IDENTITY;
		END
END
GO

/*TEST DE LA PROCEDURE EN T-SQL*/

/*
DECLARE @RETOUR int
EXEC SPRestaurant_Insert
	'€€€€', 
	'Mon resto', 
	'Le meilleur resto',
	'200€ - 300€', 
	'10 Avenue Général Frère', 
	null,
	'69008', 
	'Lyon',
	null, 
	64,
	45,
	4.5,
	33,
	'401020304',
	'http://www.monresto.com',
	'monresto@gmail.com',
	@RETOUR OUTPUT
SELECT @RETOUR
*/

CREATE PROCEDURE SPRestaurant_Delete(
	@ID					  int,
	@RESULTAT			  bit OUTPUT
	)
AS
BEGIN	
	DECLARE @CODEERREUR int=0
	DECLARE @RES int=0
	
	DELETE FROM t_e_restaurant_res WHERE res_id=@ID
	SET @RES=@@ROWCOUNT

	SET @CODEERREUR = @@ERROR /*Récupération du numéro d'erreur via la variable d'environnement @@ERROR*/
	
	IF @CODEERREUR<>0
		SET @RES=0
	SELECT @RESULTAT=@RES;
END
GO

/*TEST DE LA PROCEDURE EN T-SQL*/

/*
DECLARE @RETOUR bit
EXEC SPRestaurant_Delete 
	1005,
	@RETOUR OUTPUT
SELECT @RETOUR
*/

CREATE PROCEDURE SPRestaurant_Update(
	@RES_ID               int,
	@PRX_Prix             char(4),
	@RES_NOM	          varchar(80),
	@RES_DESCRIPTION	  varchar(500),
	@RES_CATEGORIEPRIX	  varchar(20),
	@RES_ADRLIGNE1        varchar(100),
	@RES_ADRLIGNE2        varchar(100),
	@RES_CP               varchar(10),
	@RES_VILLE            varchar(50),
	@RES_ETAT             varchar(50),
	@PAY_ID               int,
	@RES_LATITUDE		  float,
	@RES_LONGITUDE		  float,
	@IND_INDICATIF        int,
	@RES_TEL              varchar(15),
	@RES_SITEWEB          varchar(100),
	@RES_MEL              varchar(80),
	@RESULTAT			  bit OUTPUT
	)
AS
BEGIN	
	DECLARE @CODEERREUR int=0
	DECLARE @RES int=0
	
	UPDATE t_e_restaurant_res
	SET
		prx_prix=@PRX_Prix, 
		res_nom= @RES_NOM, 
		res_description=@RES_DESCRIPTION,
		res_categorieprix=@RES_CATEGORIEPRIX,
		res_adrligne1=@RES_ADRLIGNE1, 
		res_adrligne2=@RES_ADRLIGNE2,
		res_cp=@RES_CP, 
		res_ville=@RES_VILLE, 
		res_etat=@RES_ETAT, 
		pay_id=@PAY_ID,
		res_latitude=@RES_LATITUDE,
		res_longitude=@RES_LONGITUDE,
		ind_indicatif=@IND_INDICATIF, 
		res_tel=@RES_TEL,
		res_siteweb=@RES_SITEWEB,
		res_mel=@RES_MEL
	WHERE res_id=@RES_ID

	SET @RES=@@ROWCOUNT

	SET @CODEERREUR = @@ERROR /*Récupération du numéro d'erreur via la variable d'environnement @@ERROR*/
	
	IF @CODEERREUR<>0
		SET @RES=0
	SELECT @RESULTAT=@RES;
END
GO

/*
DECLARE @RETOUR bit
EXEC SPRestaurant_Update
	1013,
	'€€€ ', 
	'Mon resto2', 
	'Le meilleur resto',
	'100€ - 200€', 
	'10 Avenue Général Frère', 
	null,
	'69008', 
	'Lyon',
	null, 
	64,
	45,
	4.5,
	33,
	'401020304',
	'http://www.monresto.com',
	'monresto@gmail.com',
	@RETOUR OUTPUT
SELECT @RETOUR
*/