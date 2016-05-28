<cfcomponent name="Usuarios"  output="true" hint="Funciones de manteninimiento de Usuarios">
	<cffunction name="get" returntype="query" access="public">
		<cfargument name="Debug" 	type="boolean" required="false" 	default="false"> 
        <cfargument name="UsuarioId"   type="numeric" required="false">


		<cfquery name="rssql" datasource="#Application.Datasorce#">
			SELECT UsuarioId id,UsuarioId, Nombre, Apellido1, Apellido2
				, CONCAT(Nombre ,' ', Coalesce(Apellido1,'') , ' ' , Coalesce(Apellido2,'')) NombreCompleto, Correo
			FROM Usuarios 
			<cfif isdefined('Arguments.MenuId') and len(Arguments.MenuId) and not isdefined('Arguments.Codigo')>
                where UsuarioId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.MenuId#">
            </cfif>
            order by Correo
		</cfquery>
		<cfif Arguments.Debug>
			<cfdump var="#Arguments#">
			<cfdump var="#rssql#">
			<cfabort>
		</cfif>
		<cfreturn rssql>
	</cffunction>

<!--- UsuarioId, Cedula, Nombre, Apellido1, Apellido2, Clave, Correo --->

	<cffunction access="public" name="set" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu para utilizar">
        <cfargument name="UsuarioId" 	required="false" 	type="any">
        <cfargument name="Cedula" 		required="true" 	type="string">
        <cfargument name="Nombre"   	required="true"     type="string">
        <cfargument name="Apellido1"   	required="true"     type="string">
        <cfargument name="Apellido2"   	required="true"     type="string">
		<cfargument name="Correo"   	required="true"     type="string">
		<cfargument name="Clave"   		required="true"     type="string">
		<cfargument name="Debug" 		required="false" 	type="boolean" 	default="false">     
        <cfargument name="Conexion" 	required="false" 	type="string" 	default="thochi">  

        <cfif not isDefined('session.Usucodigo')>
            <cfset session.Usucodigo = 99999999>
        </cfif>
 
        <cftransaction>   
            <cfif isdefined('Arguments.UsuarioId')>
                <cfquery datasource="#Arguments.Conexion#" result="res">
                	update Usuarios set 
                         Cedula     	= <cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Cedula#">
                        ,Nombre 		= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Nombre#">
                        ,Apellido1 		= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Apellido1#">
                        ,Apellido2 		= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Apellido2#">
                        ,Correo 		= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Correo#">
                        ,Clave			= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Clave#">


                        <!---,FechaCambio	= <cfqueryparam cfsqltype="cf_sql_date"		value="#now()#">
                        ,Usucodigo		= <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#session.Usucodigo#">--->
                  where UsuarioId = #Arguments.UsuarioId#
                </cfquery>
                <cfset Lvar_Iid = Arguments.UsuarioId>
             
            <cfelse>
                <cfquery name="rsInsert" datasource="#Arguments.Conexion#" result="res">
                    insert into menus (	  
							  Cedula
							  , Nombre
							  , Apellido1
							  , Apellido2
							  , Clave
							  , Correo
							<!---, FechaAlta
							, Usucodigo
							, FechaCambio--->
                            )
                    values(	  
							<cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Cedula#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Nombre#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Apellido1#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Apellido2#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Correo#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Clave#">


							<!---, <cfqueryparam cfsqltype="cf_sql_date"		value="#Now()#">
							, <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#session.Usucodigo#">
                            , <cfqueryparam cfsqltype="cf_sql_date"     value="#Now()#"> --->
                            )
                </cfquery>
                
                <cfset Lvar_Iid = 1>
               <!---   <cfset Lvar_Iid = res.getPrefix().generatedkey>--->

               <!--- <cf_dump var="#res#">  --->

                <cfif Arguments.Debug>
                    <cfquery name="rsDebug" datasource="#Arguments.Conexion#">
                        select *
                        from Usuarios
                        where UsuarioId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Lvar_Iid#">
                    </cfquery>
                    <cfdump var="#Arguments#">
                    <cfdump var="#rsDebug#">
                    <cfabort>
                </cfif>
        	</cfif>
		</cftransaction>
		<cfreturn Lvar_Iid>
	</cffunction>
    
    <cffunction access="public" name="delete" hint="Elimina Usuarios">
        <cfargument name="Conexion" required="false" 	type="string" 	default="thochi">  
        <cfargument name="UsuarioId"	required="true" 	type="any">

        <cftransaction>   
			 <cfquery datasource="#arguments.Conexion#">
                delete from Usuarios
                where UsuarioId in  (<cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.UsuarioId#" list="true">)
            </cfquery>	
        </cftransaction>
        <cfreturn>
	</cffunction>
</cfcomponent>