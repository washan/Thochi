<cfcomponent name="Usuarios"  output="true" hint="Funciones de manteninimiento de Usuarios">
	<cffunction name="get" returntype="query" access="public">
		<cfargument name="Debug" 	type="boolean" required="false" 	default="false"> 
        <cfargument name="Usucodigo"   type="numeric" required="false">


		<cfquery name="rssql" datasource="#Application.Datasorce#">
			SELECT Usucodigo id,Usucodigo, Nombre, Apellido1, Apellido2
				, CONCAT(Nombre ,' ', Coalesce(Apellido1,'') , ' ' , Coalesce(Apellido2,'')) NombreCompleto, Correo
			FROM Usuarios 
			<cfif isdefined('Arguments.MenuId') and len(Arguments.MenuId) and not isdefined('Arguments.Codigo')>
                where Usucodigo = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.MenuId#">
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

	<cffunction access="public" name="set" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu para utilizar">
        <cfargument name="Usucodigo" 	required="false" 	type="any">
        <cfargument name="Cedula" 		required="true" 	type="string">
        <cfargument name="Nombre"   	required="true"     type="string">
        <cfargument name="Apellido1"   	required="true"     type="string">
        <cfargument name="Apellido2"   	required="true"     type="string">
		<cfargument name="Correo"   	required="true"     type="string">
		<cfargument name="Clave"   		required="true"     type="string">
		<cfargument name="Debug" 		required="false" 	type="boolean" 	default="false">     
        <cfargument name="Conexion" 	required="false" 	type="string" 	default="thochi">  

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
						,FechaCambio	= CURRENT_DATE()
                        ,Usucodigo		= <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#session.Usucodigo#">
                  where Usucodigo = #Arguments.Usucodigo#
                </cfquery>
                <cfset Lvar_Iid = Arguments.Usucodigo>
             
            <cfelse>
                <cfquery name="rsInsert" datasource="#Arguments.Conexion#" result="res">
                    insert into menus (	  
							  Cedula
							  , Nombre
							  , Apellido1
							  , Apellido2
							  , Clave
							  , Correo
							  , FechaAlta
							  , Usucodigo
							  , FechaCambio
                            )
                    values(	  
							<cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Cedula#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Nombre#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Apellido1#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Apellido2#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Correo#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Clave#">


							, CURRENT_DATE()
							, <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#session.Usucodigo#">
                            , CURRENT_DATE() 
                            )
                </cfquery>
                
                <cfset Lvar_Iid = 1>
               <!---   <cfset Lvar_Iid = res.getPrefix().generatedkey>--->

               <!--- <cf_dump var="#res#">  --->

                <cfif Arguments.Debug>
                    <cfquery name="rsDebug" datasource="#Arguments.Conexion#">
                        select *
                        from Usuarios
                        where Usucodigo = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Usucodigo#">
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
        <cfargument name="Usucodigo"	required="true" 	type="any">

        <cftransaction>   
			 <cfquery datasource="#arguments.Conexion#">
                delete from Usuarios
                where Usucodigo in  (<cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.Usucodigo#" list="true">)
            </cfquery>	
        </cftransaction>
        <cfreturn>
	</cffunction>
</cfcomponent>