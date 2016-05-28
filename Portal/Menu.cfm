<cfinvoke component="Componentes.Menu" method="get" returnvariable="rssql"> </cfinvoke>

<cf_header title="Opciones de Menu del Sistema" Overview="Definición de las opciones de Menu del Sistema" icon="fa fa-users">
	<cfif isdefined('form.Action') and form.Action EQ 'NEW'>
		<cfinclude template="Menu-form.cfm">
	<cfelseif isdefined('form.Action') and form.Action EQ 'Edit'>
		<cfinclude template="Menu-form.cfm">		
	<cfelseif isdefined('form.Action') and form.Action EQ 'Delete'>
		<cfinvoke component="Componentes.Menu" method="delete">
			<cfinvokeargument name="MenuId" value="#form.MenuId#">
		</cfinvoke>
		<cflocation url="Menu.cfm">
	<cfelse>
		<cf_grid Name="cfGridMenu" title="Opciones de Menu del sistema" query="#rssql#" key="MenuId">
			<!--- <cf_gridcolumn name="MenuId" 		header="MenuId"> --->
			<cf_gridcolumn name="Codigo" 		header="Codigo">
			<cf_gridcolumn name="Titulo" 		header="Titulo">
			<cf_gridcolumn name="Nivel" 		header="Nivel">
			<cf_gridcolumn name="URLinicial" 	header="URLinicial">
			<cf_gridcolumn name="CodigoP" 		header="Codigo Padre">
			<cf_gridcolumn name="TituloP" 		header="Titulo Padre">
			<cf_gridcolumn name="Orden" 		header="Orden">
			<cf_gridcolumn name="IconFont" 		header="IconFont">
		</cf_grid>
	</cfif>
<cf_footer>
