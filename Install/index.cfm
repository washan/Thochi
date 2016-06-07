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


<cfdump var="#session#">

Usuario Administrador creado<br />
<cfif isdefined('session.Usucodigo')>
	<!---Creacion de Menús Creados--->
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Codigo,Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'seguridad','Seguridad','/','0',null,'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Codigo = 'seguridad') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Codigo,Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'ayuda','ayuda','/','0',null,'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Codigo = 'ayuda') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Codigo,Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'Usuarios','Usuarios','/Portal/seguridad/Usuario.cfm','1',
			(select Menuid from menus where Codigo = 'seguridad'),
			'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Codigo = 'Usuarios') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Codigo,Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'menus','Menus','/Portal/seguridad/Menu.cfm','1',
			(select Menuid from menus where Codigo = 'seguridad'),
			'',1,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
		from thochi
		where (select Count(1)
				from menus
			   where Codigo = 'menus') = 0
	</cfquery>
	<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
		INSERT INTO menus(Codigo,Titulo,URLinicial,Nivel,MenuIdPadre,IconFont,Orden,Usucodigo,FechaAlta,FechaCambio)
			select 'tags','Custom Tags','/Portal/ayuda/CustomTags.cfm','1',
			(select Menuid from menus where Codigo = 'seguridad'),
			'',0,<cfqueryparam cfsqltype="cf_sql_numeric" value="#session.Usucodigo#">,CURRENT_DATE(),CURRENT_DATE()
			from thochi
		where (select Count(1)
				from menus
			   where Codigo = 'tags') = 0
	</cfquery>
	Menus de Seguridad Creados<br />
<cfelse>
	Para realizar la creación de menus debe estar Logueado<br />
</cfif>