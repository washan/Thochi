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
			<cf_gridcolumn name="TituloP" 		report="true"	list="true"		header="Titulo Padre">
			<cf_gridcolumn name="Codigo"	 	report="false"	list="true"		header="Codigo">
			<cf_gridcolumn name="Titulo" 		report="true"	list="true"		header="Titulo">
			<cf_gridcolumn name="Nivel" 		report="false"	list="false"	header="Nivel">
			<cf_gridcolumn name="URLinicial" 	report="false"	list="true"		header="URLinicial">
			<cf_gridcolumn name="CodigoP" 		report="false"	list="true"		header="Codigo Padre">
			<cf_gridcolumn name="Orden" 		report="false"	list="true"		header="Orden">
			<cf_gridcolumn name="IconFont" 		report="false"	list="false"	header="IconFont">
		</cf_grid>
	</cfif>
<cf_footer>