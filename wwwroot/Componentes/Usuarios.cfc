<cfcomponent>
	<cffunction name="get" returntype="query" access="public">
		<cfquery name="rssql" datasource="#Application.Datasorce#">
			SELECT UsuarioId id,UsuarioId, Nombre, Apellido1, Apellido2, CONCAT(Nombre ,' ', Coalesce(Apellido1,'') , ' ' , Coalesce(Apellido2,'')) NombreCompleto
				FROM Usuarios
				
				UNION ALL
			SELECT UsuarioId id,UsuarioId, Nombre, Apellido1, Apellido2, CONCAT(Nombre ,' ', Coalesce(Apellido1,'') , ' ' , Coalesce(Apellido2,'')) NombreCompleto
				FROM Usuarios
		</cfquery>
		<cfreturn rssql>
	</cffunction>
</cfcomponent>