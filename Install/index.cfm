
<cfif isDefined('Application.Datasorce')>
	<cfquery datasource="#Application.Datasorce#">
		delete from thochi 
	</cfquery>
	<cfquery datasource="#Application.Datasorce#">
		insert into thochi (version) select  1
	</cfquery>
	<cfflush interval="5">
	<cfquery datasource="#Application.Datasorce#">
		Insert into Usuarios (Nombre, Apellido1, Apellido2, Cedula, Clave, Correo,BMUsucodigo,FechaCambio,FechaAlta)
		select 'Thochi','Admin','Portal','123456',<cfoutput>'#Hash('thochi','MD5')#'</cfoutput>,'admin@thochi.com',-1,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from Usuarios
			   where Cedula = '123456') = 0
	</cfquery>
<cfelse>
	<cfquery datasource="thochi">
		delete from thochi 
	</cfquery>
	<cfquery datasource="thochi">
		insert into thochi (version) select  1
	</cfquery>

	<!---Creacion de Usuarios--->
	<cfflush interval="5">
	<cfquery datasource="thochi">
		Insert into Usuarios (Nombre, Apellido1, Apellido2, Cedula, Clave, Correo,BMUsucodigo,FechaCambio,FechaAlta)
		select 'Thochi','Admin','Portal','123456',<cfoutput>'#Hash('thochi','MD5')#'</cfoutput>,'admin@thochi.com',-1,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from Usuarios
			   where Cedula = '123456') = 0
	</cfquery>
</cfif>

Usuario Administrador creado<br />
	<!---Creacion de Menús Creados--->
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'Seguridad','/','0',null,'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Titulo = 'Seguridad') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'ayuda','/','0',null,'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Titulo = 'ayuda') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'Usuarios','/Portal/seguridad/Usuario.cfm','1',
			(select Menuid from menus where Titulo = 'Seguridad'),
			'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Titulo = 'Usuarios') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'Menus','/Portal/seguridad/Menu.cfm','1',
			(select Menuid from menus where Titulo = 'Seguridad'),
			'',1,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Titulo = 'Menus') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'Custom Tags','/Portal/ayuda/CustomTags.cfm','1',
			(select Menuid from menus where Titulo = 'Seguridad'),
			'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
			from thochi
		where (select Count(1)
				from menus
			   where Titulo = 'Custom Tags') = 0
	</cfquery>
	Menus de Seguridad Creados<br />