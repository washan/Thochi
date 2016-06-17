<cfinvoke component="Componentes.Asignatura" method="get" returnvariable="rssql"> </cfinvoke>

<cf_header title="Asignaturas" Overview="Definición de Asignaturas" icon="fa fa-users">
	<cfif isdefined('form.Action') and form.Action EQ 'NEW'>
		<cfinclude template="Asignatura-form.cfm">
	<cfelseif isdefined('form.Action') and form.Action EQ 'Edit'>
		<cfinclude template="Asignatura-form.cfm">		
	<cfelseif isdefined('form.Action') and form.Action EQ 'Delete'>
		<cfinvoke component="Componentes.Asignatura" method="delete">
			<cfinvokeargument name="idAsignatura" value="#form.idAsignatura#">
		</cfinvoke>
		<cflocation url="Asignatura.cfm">
	<cfelse>
		<cf_grid Name="cfGridAsignatura" title="Asignatura del sistema" query="#rssql#" key="idAsignatura">
			<cf_gridcolumn name="Nombre"  report="true" list="true"	header="Nombre">
		</cf_grid>
	</cfif>
<cf_footer>