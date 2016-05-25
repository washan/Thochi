<cfcomponent name="Menu"  output="true" hint="Funciones de manteninimiento de opciones de menues">

	<cffunction access="public" name="get" returntype="query">
		<cfargument name="Debug" 	type="boolean" required="false" 	default="false"> 
		<cfargument name="Codigo" 	type="string"  required="false">

		<cfquery name="rssql" datasource="#Application.Datasorce#">
			select a.MenuId, a.Codigo, a.Titulo,a.Nivel, a.URLinicial, a.MenuIdPadre, a.Orden, a.IconFont
				,b.Codigo as CodigoP, b.Titulo as TituloP
			from menus a
			left join menus b 
				on b.MenuId = a.MenuIdPadre
			<cfif isdefined('Arguments.Codigo') and len(Arguments.Codigo)>
				where a.Codigo = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Codigo#">
			</cfif>
            order by a.Codigo
		</cfquery>
		<cfif Arguments.Debug>
			<cfdump var="#Arguments#">
			<cfdump var="#rssql#">
			<cfabort>
		</cfif>
		<cfreturn rssql>
	</cffunction>

    

    
	<cffunction access="public" name="set" returntype="numeric"  hint="Funcion para Insertar o Actualizar las opciones de Menu para utilizar">
        <cfargument name="MenuId" 		required="false" 	type="numeric">
        <cfargument name="Codigo" 		required="true" 	type="string">
        <cfargument name="Titulo"   	required="true"     type="string">
        <cfargument name="Nivel" 		required="true" 	type="numeric" default="-1">
        <cfargument name="URLinicial" 	required="true" 	type="string">
        <cfargument name="MenuIdPadre" 	required="false" 	type="any">
        <cfargument name="Orden" 		required="true" 	type="string">

        <cfargument name="Debug" 		required="false" 	type="boolean" 	default="false">     
        <cfargument name="Conexion" 	required="false" 	type="string" 	default="thochi">  

        <cfif not isDefined('session.Usucodigo')>
            <cfset session.Usucodigo = 99999999>
        </cfif>






<!--- MenuId
, Codigo
, Titulo
, Nivel
, URLinicial
, MenuIdPadre
, Orden
, IconFont --->
 
        <cftransaction>   
            <cfif isdefined('Arguments.MenuId')>
             <cfquery datasource="#Arguments.Conexion#" result="res">
            	update menus
                     Codigo     	= <cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Codigo#">
                    ,Titulo 		= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Titulo#">
                    ,Nivel 			= <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#Arguments.Nivel#">
                    ,URLinicial		= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.URLinicial#">
                    <cfif isDefined('arguments.MenuIdPadre') and len(arguments.MenuIdPadre)>
                        ,MenuIdPadre    = <cfqueryparam cfsqltype="cf_sql_numeric"  value="#Arguments.MenuIdPadre#">    
                    <cfelse>
                        , null
                    </cfif>
                    ,Orden			= <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#Arguments.Orden#">
                    ,IconFont		= <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.IconFont#">
                    ,FechaCambio	= <cfqueryparam cfsqltype="cf_sql_date"		value="#now()#">
                    ,Usucodigo		= <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#session.Usucodigo#">
                    
              where MenuId = #Arguments.MenuId#
            </cfquery>
            <cfset Lvar_Iid = Arguments.MenuId>
             
            <cfelse>
                <cfquery name="rsInsert" datasource="#Arguments.Conexion#" result="res">
                    insert into menus (	  
							  Codigo
							, Titulo
							, Nivel
							, URLinicial
							, MenuIdPadre
							, Orden
							, IconFont
							, FechaAlta
							, Usucodigo
							, FechaCambio
                            )
                    values(	  
							<cfqueryparam cfsqltype="cf_sql_varchar"  value="#Arguments.Codigo#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.Titulo#">
							, <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#Arguments.Nivel#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.URLinicial#">
                            <cfif isDefined('arguments.MenuIdPadre') and len(arguments.MenuIdPadre)>
							 , <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#Arguments.MenuIdPadre#">
                            <cfelse>
                             , null
							</cfif>
                            , <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#Arguments.Orden#">
							, <cfqueryparam cfsqltype="cf_sql_varchar" 	value="#Arguments.IconFont#">
							, <cfqueryparam cfsqltype="cf_sql_date"		value="#Now()#">
							, <cfqueryparam cfsqltype="cf_sql_numeric" 	value="#session.Usucodigo#">
                            , <cfqueryparam cfsqltype="cf_sql_date"     value="#Now()#">
                            )
                </cfquery>
                
                <cfset Lvar_Iid = 1>
               <!---   <cfset Lvar_Iid = res.getPrefix().generatedkey>

               <cf_dump var="#Lvar_Iid#"> --->

                <cfif Arguments.Debug>
                    <cfquery name="rsDebug" datasource="#Arguments.Conexion#">
                        select *
                        from menus
                        where MenuId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Lvar_Iid#">
                    </cfquery>
                    <cfdump var="#Arguments#">
                    <cfdump var="#rsDebug#">
                    <cfabort>
                </cfif>
        	</cfif>
		</cftransaction>
		<cfreturn Lvar_Iid>
	</cffunction>
    
    <cffunction access="public" name="delete" hint="Elimina la opcion de menus">
        <cfargument name="Conexion" required="false" 	type="string" 	default="thochi">  
        <cfargument name="MenuId"	required="true" 	type="numeric">
        <cftransaction>   
			 <cfquery datasource="#arguments.Conexion#">
                delete from menus
                where MenuId = <cfqueryparam cfsqltype="cf_sql_numeric" value="#Arguments.MenuId#">
            </cfquery>	
        </cftransaction>
        <cfreturn>
	</cffunction>
</cfcomponent>