<cfcomponent name="Grado"  output="true" hint="Funciones de manteninimiento Grado">

	<cffunction access="public" name="get" returntype="query">
		<cfargument name="Debug" 	type="boolean" required="false" 	default="false"> 
        <cfargument name="idGrado"   type="numeric" required="false">

		<cfquery name="rssql" datasource="#Application.Datasorce#">
			select a.idGrado, a.Descripcion
			from Grado a
			<cfif isdefined('Arguments.idGrado') and len(Arguments.idGrado) and not isdefined('Arguments.Codigo')>
                where a.idGrado = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idGrado#">
            </cfif>
            order by a.Descripcion
		</cfquery>
		<cfif Arguments.Debug>
			<cfdump var="#Arguments#">
			<cfdump var="#rssql#">
			<cfabort>
		</cfif>
		<cfreturn rssql>
	</cffunction>



	<cffunction access="public" name="set" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu para utilizar">
        <cfargument name="idGrado" 		required="false" 	type="any">
        <cfargument name="Descripcion" 		required="true" 	type="string">
        <!--- <cfargument name="OpSistema"    required="false"     type="any">
 --->
        <cfargument name="Debug" 		required="false" 	type="boolean" 	default="false">     
        <cfargument name="Conexion" 	required="false" 	type="string" 	default="thochi">  

        <cfif not isDefined('session.Usucodigo')>
            <cfset session.Usucodigo = 99999999>
        </cfif>
 
        <cftransaction>   
            <cfif isdefined('Arguments.idGrado')>
                <cfquery datasource="#Arguments.Conexion#" result="res">
                	update Grado set 
                         Descripcion     	= <cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Descripcion#">
                  where idGrado = #Arguments.idGrado#
                </cfquery>
                <cfset Lvar_Iid = Arguments.idGrado>

            <cfelse>
                <cfquery name="rsInsert" datasource="#Arguments.Conexion#" result="res">
                    insert into Grado (	  
							  Descripcion
                            )
                    values(	  
							<cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Descripcion#">
							
                            )
                </cfquery>
                
                <cfset Lvar_Iid = 1>

                <cfif Arguments.Debug>
                    <cfquery name="rsDebug" datasource="#Arguments.Conexion#">
                        select *
                        from Grado
                        where idGrado = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Lvar_Iid#">
                    </cfquery>
                    <cfdump var="#Arguments#">
                    <cfdump var="#rsDebug#">
                    <cfabort>
                </cfif>
        	</cfif>
		</cftransaction>
		<cfreturn Lvar_Iid>
	</cffunction>
   
    <cffunction access="public" name="delete" hint="Elimina la opcion de Grado">
        <cfargument name="Conexion" required="false" 	type="string" 	default="thochi">  
        <cfargument name="idGrado"	required="true" 	type="any">

        <cftransaction>   
			 <cfquery datasource="#arguments.Conexion#">
                delete from Grado
                where idGrado in  (<cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.idGrado#" list="true">)
            </cfquery>	
        </cftransaction>
        <cfreturn>
	</cffunction>

</cfcomponent>