<cfcomponent displayname="Application" output="false" hint="Menejo de la aplicación">
    <cfset This.Name 			    = "Tochi" />
    <cfset This.ApplicationTimeout  = CreateTimeSpan( 0, 10, 0, 0 ) />
    <cfset This.SessionManagement   = true />
    <cfset This.SetClientCookies    = false />
    
    <cfset Application.Datasorce = 'Thochi'/>
    <cfset session.Usucodigo = 1>

</cfcomponent>