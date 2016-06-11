<cfcomponent name="UsuarioRoles"  output="true" hint="Funciones de manteninimiento de Agignar Roles a Usuario">

	<cffunction access="remote" name="get" returntype="query">
    
    <!--- <cffunction access="remote" name="get" access="remote" output="false" returntype="struct"> --->
        <cfset datos['Status'] = 1>

        <!--- <cffunction access="remote" name="get" access="remote" output="false" returntype="struct"> --->
		<cfargument name="Debug" 	type="boolean" required="false" 	default="false"> 
        <cfargument name="RolesId"   type="numeric" required="false">

 <!---        <cf_dump var="#Arguments#">
 --->
        <cfquery name="rssql" datasource="#Application.Datasorce#">
            select a.Usucodigo, CONCAT(a.Apellido1 ,' ', Coalesce(a.Apellido2,'') , ' ' , Coalesce(a.Nombre,'')) as NombreCompleto
                , coalesce(b.Usucodigo,-1) as selected
            from Usuarios a
            left join UsuarioRoles b
                on a.Usucodigo = b.Usucodigo
                and b.RolesId = #form.RolesId#
            order by  CONCAT(a.Apellido1 ,' ', Coalesce(a.Apellido2,'') , ' ' , Coalesce(a.Nombre,''))
        </cfquery>

		<cfif Arguments.Debug>
			<cfdump var="#Arguments#">
			<cfdump var="#rssql#">
			<cfabort>
		</cfif>


		<cfreturn rssql>
	</cffunction>



	<cffunction access="public" name="set" hint="Funcion Actualizar los roles asociados al usuario">
        <cfargument name="RolesId" 	required="true" 	type="any">
        <cfargument name="InsId"    required="true"     type="any">
        <cfargument name="UsuRoll"  required="false"    type="any">

        <cfargument name="Debug" 	required="false" 	type="boolean" 	default="false">     
        <cfargument name="Conexion" required="false" 	type="string" 	default="thochi">  

        <cfif not isDefined('session.Usucodigo')>
            <cfset session.Usucodigo = 99999999>
        </cfif>

        <cftransaction>  
            <cfif isdefined('Arguments.RolesId')>
                <cfinvoke component="Componentes.UsuarioRoles" method="delete">
                    <cfinvokeargument name="RolesId"        value="#arguments.RolesId#">
                    <cfinvokeargument name="InsId"          value="#arguments.RolesId#">
                </cfinvoke>
            
                <cfif isDefined('Arguments.UsuRoll') and LEN(TRIM(Arguments.UsuRoll))>
                    <cfinvoke component="Componentes.UsuarioRoles" method="setRoll">
                        <cfinvokeargument name="RolesId"      value="#arguments.RolesId#">
                        <cfinvokeargument name="InsId"        value="#arguments.InsId#">
                        <cfinvokeargument name="UsuRoll"      value="#arguments.UsuRoll#">
                    </cfinvoke>
                </cfif>       
        	</cfif>
		</cftransaction>
		<cfreturn>
	</cffunction>
   
    <cffunction access="public" name="delete" hint="Elimina la opcion de roles">
        <cfargument name="Conexion" required="false" 	type="string" 	default="thochi">  
        <cfargument name="RolesId"	required="true" 	type="any">

        <cftransaction>   
			 <cfquery datasource="#arguments.Conexion#">
                delete from Usuarioroles
                where RolesId in  (<cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.RolesId#" list="true">)
                    and InsId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.InsId#">
            </cfquery>	
        </cftransaction>
        <cfreturn>
	</cffunction>

    <cffunction access="public" name="setRoll" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu - Roll para utilizar">
        <cfargument name="RolesId"      required="false"    type="any">
        <cfargument name="UsuRoll"      required="true"     type="Any">
        <cfargument name="InsId"        required="true"     type="Any">
        <cfargument name="Conexion"     required="false"    type="string"   default="thochi"> 
        <cfargument name="Debug"        required="false"    type="boolean"  default="false">     
        <cfargument name="Conexion"     required="false"    type="string"   default="thochi"> 

        <cftransaction>   
            <cfloop index="Usucodigo" list="#arguments.UsuRoll#"> 
                <cfquery name="rsRolMenu" datasource="#Arguments.Conexion#" result="res">
                    insert into Usuarioroles (RolesId, InsId, Usucodigo) 
                        values (<cfqueryparam cfsqltype="cf_sql_numeric"  value="#Arguments.RolesId#">
                                , <cfqueryparam cfsqltype="cf_sql_numeric"  value="#InsId#">
                                , <cfqueryparam cfsqltype="cf_sql_numeric"  value="#Usucodigo#">)
                </cfquery>
            </cfloop>  
       </cftransaction>
    </cffunction> 

</cfcomponent>