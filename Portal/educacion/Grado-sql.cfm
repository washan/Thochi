
<cfinvoke component="Componentes.Grado" method="set" returnvariable="LvarId">
		<cfinvokeargument name="Descripcion" 		value="#form.Descripcion#">
	<cfif isDefined('form.idGrado') and LEN(TRIM(form.idGrado))>
		<cfinvokeargument name="idGrado" value="#form.idGrado#">
	</cfif>
</cfinvoke>


<cflocation url="Grado.cfm">
