<cfcomponent name="Roles"  output="true" hint="Funciones de manteninimiento de opciones de Roles">

	<cffunction access="public" name="get" returntype="query">
		<cfargument name="Debug" 	type="boolean" required="false" 	default="false"> 
        <cfargument name="RolesId"   type="numeric" required="false">

		<cfquery name="rssql" datasource="#Application.Datasorce#">
			select a.RolesId, a.Nombre
			from roles a
			<cfif isdefined('Arguments.RolesId') and len(Arguments.RolesId) and not isdefined('Arguments.Codigo')>
                where a.RolesId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.RolesId#">
            </cfif>
            order by a.Nombre
		</cfquery>
		<cfif Arguments.Debug>
			<cfdump var="#Arguments#">
			<cfdump var="#rssql#">
			<cfabort>
		</cfif>
		<cfreturn rssql>
	</cffunction>



	<cffunction access="public" name="set" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu para utilizar">
        <cfargument name="RolesId" 		required="false" 	type="any">
        <cfargument name="Nombre" 		required="true" 	type="string">
        <cfargument name="OpSistema"    required="false"     type="any">

        <cfargument name="Debug" 		required="false" 	type="boolean" 	default="false">     
        <cfargument name="Conexion" 	required="false" 	type="string" 	default="thochi">  

        <cfif not isDefined('session.Usucodigo')>
            <cfset session.Usucodigo = 99999999>
        </cfif>
 
        <cftransaction>   
            <cfif isdefined('Arguments.RolesId')>
                <cfquery datasource="#Arguments.Conexion#" result="res">
                	update roles set 
                         Nombre     	= <cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Nombre#">
                  where RolesId = #Arguments.RolesId#
                </cfquery>
                <cfset Lvar_Iid = Arguments.RolesId>

                <cfquery datasource="#arguments.Conexion#">
                    delete from rolmenu
                    where RolesId in  (<cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.RolesId#" list="true">)
                </cfquery>
                
                <cfif isDefined('Arguments.OpSistema') and LEN(TRIM(Arguments.OpSistema))>
                    <cfinvoke component="Componentes.Roles" method="setRoll">
                        <cfinvokeargument name="RolesId"        value="#arguments.RolesId#">
                        <cfinvokeargument name="OpSistema"      value="#arguments.OpSistema#">
                    </cfinvoke>
                </cfif>
            <cfelse>
                <cfquery name="rsInsert" datasource="#Arguments.Conexion#" result="res">
                    insert into roles (	  
							  Nombre
                            )
                    values(	  
							<cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Nombre#">
							
                            )
                </cfquery>
                
                <cfset Lvar_Iid = 1>
               <!---   <cfset Lvar_Iid = res.getPrefix().generatedkey>--->

               <!--- <cf_dump var="#res#">  --->

                <cfif Arguments.Debug>
                    <cfquery name="rsDebug" datasource="#Arguments.Conexion#">
                        select *
                        from roles
                        where RolesId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Lvar_Iid#">
                    </cfquery>
                    <cfdump var="#Arguments#">
                    <cfdump var="#rsDebug#">
                    <cfabort>
                </cfif>
        	</cfif>
		</cftransaction>
		<cfreturn Lvar_Iid>
	</cffunction>
   
    <cffunction access="public" name="delete" hint="Elimina la opcion de roles">
        <cfargument name="Conexion" required="false" 	type="string" 	default="thochi">  
        <cfargument name="RolesId"	required="true" 	type="any">

        <cftransaction>   
			 <cfquery datasource="#arguments.Conexion#">
                delete from roles
                where RolesId in  (<cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.RolesId#" list="true">)
            </cfquery>	
        </cftransaction>
        <cfreturn>
	</cffunction>

    <cffunction access="public" name="setRoll" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu - Roll para utilizar">
        <cfargument name="RolesId"      required="false"    type="any">
        <cfargument name="OpSistema"    required="true"     type="Any">
        <cfargument name="Conexion"     required="false"    type="string"   default="thochi"> 
        <cfargument name="Debug"        required="false"    type="boolean"  default="false">     
        <cfargument name="Conexion"     required="false"    type="string"   default="thochi"> 

        <cftransaction>   
            <cfloop index="MenuId" list="#arguments.OpSistema#"> 
                <cfquery name="rsRolMenu" datasource="#Arguments.Conexion#" result="res">
                    insert into rolmenu (RolesId, MenuId) 
                        values (<cfqueryparam cfsqltype="cf_sql_numeric"  value="#Arguments.RolesId#">
                                , <cfqueryparam cfsqltype="cf_sql_numeric"  value="#MenuId#">)
                </cfquery>
            </cfloop>  
       </cftransaction>
    </cffunction> 

</cfcomponent>