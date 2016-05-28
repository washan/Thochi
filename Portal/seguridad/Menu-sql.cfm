<cfinvoke component="Componentes.Menu" method="set" returnvariable="LvarId">
		<cfinvokeargument name="Codigo" 		value="#form.Codigo#">
		<cfinvokeargument name="Titulo" 		value="#form.Titulo#">
		<cfinvokeargument name="Nivel" 			value="#form.Nivel#">
		<cfinvokeargument name="URLinicial" 	value="#form.URLinicial#">
		<cfinvokeargument name="MenuIdPadre"	value="#form.MenuIdPadre#">
		<cfinvokeargument name="Orden" 			value="#form.Orden#">
		<cfinvokeargument name="IconFont" 		value="#form.IconFont#">
	<cfif isDefined('form.MenuId') and LEN(TRIM(form.MenuId))>
		<cfinvokeargument name="MenuId" 		value="#form.MenuId#">
	</cfif>
</cfinvoke>

<cflocation url="Menu.cfm">
