
<cfif isDefined('form.RolesId') and form.RolesId NEQ 0 and isdefined('form.save')>

	<cfinvoke component="Componentes.UsuarioRoles" method="set">
		<cfinvokeargument name="RolesId" 		value="#form.RolesId#">
		<cfinvokeargument name="InsId" 			value="#form.InsId#">
		
		<cfif isDefined('form.UsuRoll') and LEN(TRIM(form.UsuRoll))>
			<cfinvokeargument name="UsuRoll" 		value="#form.UsuRoll#">
		</cfif>
	</cfinvoke>
</cfif>
<cflocation url="UsuarioRoles.cfm?Rol=#form.RolesId#&Inst=#form.InsId#">




