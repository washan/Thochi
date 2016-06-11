
<cfinvoke component="Componentes.Institucion" method="set" returnvariable="LvarId">
		<cfinvokeargument name="Nombre" 		value="#form.Nombre#">
	<cfif isDefined('form.InsId') and LEN(TRIM(form.InsId))>
		<cfinvokeargument name="InsId" 		value="#form.InsId#">
	</cfif>
</cfinvoke>


<cflocation url="Institucion.cfm">
