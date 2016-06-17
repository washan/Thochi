
<cfinvoke component="Componentes.Asignatura" method="set" returnvariable="LvarId">
		<cfinvokeargument name="Nombre" 		value="#form.Nombre#">
	<cfif isDefined('form.idAsignatura') and LEN(TRIM(form.idAsignatura))>
		<cfinvokeargument name="idAsignatura" 		value="#form.idAsignatura#">
	</cfif>
</cfinvoke>


<cflocation url="Asignatura.cfm">
