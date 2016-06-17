<cfcomponent name="Asignatura"  output="true" hint="Funciones de manteninimiento Asignatura">

	<cffunction access="public" name="get" returntype="query">
		<cfargument name="Debug" 	type="boolean" required="false" 	default="false"> 
        <cfargument name="idAsignatura"   type="numeric" required="false">

		<cfquery name="rssql" datasource="#Application.Datasorce#">
			select a.idAsignatura, a.Nombre
			from Asignatura a
			<cfif isdefined('Arguments.idAsignatura') and len(Arguments.idAsignatura) and not isdefined('Arguments.Codigo')>
                where a.idAsignatura = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idAsignatura#">
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
        <cfargument name="idAsignatura" 		required="false" 	type="any">
        <cfargument name="Nombre" 		required="true" 	type="string">
        <!--- <cfargument name="OpSistema"    required="false"     type="any">
 --->
        <cfargument name="Debug" 		required="false" 	type="boolean" 	default="false">     
        <cfargument name="Conexion" 	required="false" 	type="string" 	default="thochi">  

        <cfif not isDefined('session.Usucodigo')>
            <cfset session.Usucodigo = 99999999>
        </cfif>
 
        <cftransaction>   
            <cfif isdefined('Arguments.idAsignatura')>
                <cfquery datasource="#Arguments.Conexion#" result="res">
                	update Asignatura set 
                         Nombre     	= <cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Nombre#">
                  where idAsignatura = #Arguments.idAsignatura#
                </cfquery>
                <cfset Lvar_Iid = Arguments.idAsignatura>

            <cfelse>
                <cfquery name="rsInsert" datasource="#Arguments.Conexion#" result="res">
                    insert into Asignatura (	  
							  Nombre
                            )
                    values(	  
							<cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Nombre#">
							
                            )
                </cfquery>
                
                <cfset Lvar_Iid = 1>

                <cfif Arguments.Debug>
                    <cfquery name="rsDebug" datasource="#Arguments.Conexion#">
                        select *
                        from Asignatura
                        where idAsignatura = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Lvar_Iid#">
                    </cfquery>
                    <cfdump var="#Arguments#">
                    <cfdump var="#rsDebug#">
                    <cfabort>
                </cfif>
        	</cfif>
		</cftransaction>
		<cfreturn Lvar_Iid>
	</cffunction>
   
    <cffunction access="public" name="delete" hint="Elimina la opcion de Asignatura">
        <cfargument name="Conexion" required="false" 	type="string" 	default="thochi">  
        <cfargument name="idAsignatura"	required="true" 	type="any">

        <cftransaction>   
			 <cfquery datasource="#arguments.Conexion#">
                delete from Asignatura
                where idAsignatura in  (<cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.idAsignatura#" list="true">)
            </cfquery>	
        </cftransaction>
        <cfreturn>
	</cffunction>

    <!--- <cffunction access="public" name="setRoll" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu - Roll para utilizar">
        <cfargument name="idAsignatura"      required="false"    type="any">
        <cfargument name="OpSistema"    required="true"     type="Any">
        <cfargument name="Conexion"     required="false"    type="string"   default="thochi"> 
        <cfargument name="Debug"        required="false"    type="boolean"  default="false">     
        <cfargument name="Conexion"     required="false"    type="string"   default="thochi"> 

        <cftransaction>   
            <cfloop index="MenuId" list="#arguments.OpSistema#"> 
                <cfquery name="rsRolMenu" datasource="#Arguments.Conexion#" result="res">
                    insert into rolmenu (idAsignatura, MenuId) 
                        values (<cfqueryparam cfsqltype="cf_sql_numeric"  value="#Arguments.idAsignatura#">
                                , <cfqueryparam cfsqltype="cf_sql_numeric"  value="#MenuId#">)
                </cfquery>
            </cfloop>  
       </cftransaction>
    </cffunction>  --->

</cfcomponent>