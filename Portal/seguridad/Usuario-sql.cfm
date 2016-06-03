<cfinvoke component="Componentes.Usuarios" method="set" returnvariable="LvarId">
	<cfinvokeargument name="Cedula" 		value="#form.Cedula#">
	<cfinvokeargument name="Nombre" 		value="#form.Nombre#">
	<cfinvokeargument name="Apellido1" 		value="#form.Apellido1#">
	<cfinvokeargument name="Apellido2" 		value="#form.Apellido2#">
	<cfinvokeargument name="Correo"			value="#form.Correo#">
	<cfinvokeargument name="Clave" 			value="#Hash(form.Clave,'MD5')#">
	<cfif isDefined('form.Usucodigo') and LEN(TRIM(form.Usucodigo))>
		<cfinvokeargument name="Usucodigo" 		value="#form.Usucodigo#">
	</cfif>
</cfinvoke>

<cflocation url="Usuario.cfm">
