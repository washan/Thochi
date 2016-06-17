<cfinvoke component="Componentes.Grado" method="get" returnvariable="rssql"> </cfinvoke>

<cf_header title="Gradoes del Sistema" Overview="Definición de Gradoes del Sistema" icon="fa fa-users">
	<cfif isdefined('form.Action') and form.Action EQ 'NEW'>
		<cfinclude template="Grado-form.cfm">
	<cfelseif isdefined('form.Action') and form.Action EQ 'Edit'>
		<cfinclude template="Grado-form.cfm">		
	<cfelseif isdefined('form.Action') and form.Action EQ 'Delete'>
		<cfinvoke component="Componentes.Grado" method="delete">
			<cfinvokeargument name="idGrado" value="#form.idGrado#">
		</cfinvoke>
		<cflocation url="Grado.cfm">
	<cfelse>
		<cf_grid Name="cfGridGrado" title="Grado de la Institucion" query="#rssql#" key="idGrado">
			<cf_gridcolumn name="Descripcion"  report="true" list="true"	header="Descripcion">
		</cf_grid>
	</cfif>
<cf_footer>