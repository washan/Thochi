<cfcomponent displayname="Application" output="false" hint="Menejo de la aplicación">
 
    <!--- Configuracion de la aplicacion--->
    <cfset This.Name 			    = "Tochi" />
    <cfset This.ApplicationTimeout  = CreateTimeSpan( 0, 10, 0, 0 ) />
    <cfset This.SessionManagement   = true />
    <cfset This.SetClientCookies    = false />
 
    <!--- Definicion de las propiedades de la solicitud de paginas--->
    <cfsetting requesttimeout="20" showdebugoutput="false" enablecfoutputonly="false"/>
 
    <cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false" hint="Se activa cuando se crea la primera aplicación.">
		<cfset Application.RootTemplate = '/FLATY/code'/>
		<cfset Application.Context      = '/'/>
		<cfset Application.Datasorce    = 'Thochi'/>
        <cfreturn true />
    </cffunction>
 
 
    <cffunction name="OnSessionStart" access="public" returntype="void" output="false" hint="Fires when the session is first created.">
 				
        <!--- Return out. --->
        <cfreturn />
    </cffunction>
 
 
    <cffunction name="OnRequestStart" access="public" returntype="boolean" output="true" hint="Fires at first part of page processing.">
        <cfargument name="TargetPage" type="string" required="true" hint="Pagina solicitada"/>
		
		<!---Funcion para resetear las variables de Application--->
		<cfif isdefined('URL.ResetApplication')>
			<cfset OnApplicationStart()>
		</cfif>

 		<cflogin>
			<cfif NOT IsDefined("cflogin")>
				<cfset err = 0>
				<cfinclude template="/#application.Context#/Public/login.cfm">
				<cfabort>
			<cfelse>
				<cfquery name="rsUsuario" datasource="#Application.Datasorce#">
					select Clave 
						from Usuarios
					where Correo = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.J_USERNAME#">
				</cfquery>
				<cfif NOT rsUsuario.RecordCount>
					<cfset err = 1>
					<cfinclude template="Public/login.cfm"/>
					<cfabort>
				<cfelseif rsUsuario.Clave NEQ  Hash(form.j_password,'MD5')>
					<cfset err = 2>
					<cfinclude template="Public/login.cfm"/>					
					<cfabort>
				</cfif>
				
				<cfif cflogin.name eq "admin">
					<cfset roles = "user,admin">
				<cfelse>
					<cfset roles = "user">
				</cfif>
				<cfloginuser name = "#cflogin.name#" password = "#cflogin.password#" roles = "#roles#"/>
			</cfif>
		</cflogin>
		<cfif isdefined('URL.Logout')>
			<cflogout>
			<cflocation url="#application.Context#/Public/login.cfm" addtoken="no">
			<cfabort>
			
		</cfif>
		
        <!--- Return out. --->
        <cfreturn true />
    </cffunction>
 
 
    <cffunction name="OnRequest" access="public" returntype="void" output="true" hint="Se Activa cuando el pre-procesamiento de páginas se ha completado.">
        <cfargument name="TargetPage" type="string" required="true" hint="Pagina Solicitada"/>
        <!---Se incluye la pagina Solicitada --->
		<cfif TargetPage CONTAINS "login.cfm">
			<cflocation url="#application.Context#/Index.cfm" addtoken="no"> 
		<cfelse>
        	<cfinclude template="#ARGUMENTS.TargetPage#" />
		</cfif>
        <!--- Return out. --->
        <cfreturn />
    </cffunction>
 
 
    <cffunction name="OnRequestEnd" access="public" returntype="void" output="true" hint="Se Activa cuando el procesamiento de la página se ha completado.">
        <!--- Return out. --->
        <cfreturn />
    </cffunction>
 
 
    <cffunction
        name="OnSessionEnd"
        access="public"
        returntype="void"
        output="false"
        hint="Fires when the session is terminated.">
 
        <!--- Define arguments. --->
        <cfargument
            name="SessionScope"
            type="struct"
            required="true"
            />
 
        <cfargument
            name="ApplicationScope"
            type="struct"
            required="false"
            default="#StructNew()#"
            />
 
        <!--- Return out. --->
        <cfreturn />
    </cffunction>
 
 
    <cffunction
        name="OnApplicationEnd"
        access="public"
        returntype="void"
        output="false"
        hint="Fires when the application is terminated.">
 
        <!--- Define arguments. --->
        <cfargument
            name="ApplicationScope"
            type="struct"
            required="false"
            default="#StructNew()#"
            />
 
        <!--- Return out. --->
        <cfreturn />
    </cffunction>
 
 
    <cffunction
        name="OnError"
        access="public"
        returntype="void"
        output="true"
        hint="Fires when an exception occures that is not caught by a try/catch.">
 
        <!--- Define arguments. --->
        <cfargument
            name="Exception"
            type="any"
            required="true"
            />
 
        <cfargument
            name="EventName"
            type="string"
            required="false"
            default=""
            />
 		<cfdump var="Upps que pena, un Error">
		<cfdump var="#Exception#">
		<cfdump var="#EventName#">
        <!--- Return out. --->
        <cfreturn />
    </cffunction>
	<!--- Handle 404 errors --->
	<cffunction name="onMissingTemplate" returnType="boolean">
		<cfargument type="string" name="targetPage" required=true/>
	
		<cfdump var="Fuente no encontrado"><cfabort>
		<cfreturn false>
	</cffunction>
 
</cfcomponent>