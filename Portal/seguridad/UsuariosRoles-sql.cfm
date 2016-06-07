
<cfinvoke component="Componentes.Roles" method="set" returnvariable="LvarId">
		<cfinvokeargument name="Nombre" 		value="#form.Nombre#">
	<cfif isDefined('form.RolesId') and LEN(TRIM(form.RolesId))>
		<cfinvokeargument name="RolesId" 		value="#form.RolesId#">
	</cfif>
	<cfif isDefined('form.OpSistema') and LEN(TRIM(form.OpSistema))>
		<cfinvokeargument name="OpSistema" 		value="#form.OpSistema#">
	</cfif>
</cfinvoke>


<cflocation url="Roles.cfm">
