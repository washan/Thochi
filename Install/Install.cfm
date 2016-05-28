<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
	Insert into Usuarios (Nombre, Apellido1, Apellido2, Cedula, Clave, Correo)
	select 'Thochi','Admin','Portal','123456',<cfoutput>'#Hash('thochi','MD5')#'</cfoutput>,'admin@thochi.com'
	from dual
	where (select Count(1)
			from Usuarios
		   where Correo = 'admin@thochi.com') = 0
</cfquery>
<cfflush interval="5">
Usuarios genericos creados<br />