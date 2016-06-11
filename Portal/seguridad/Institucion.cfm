<cfinvoke component="Componentes.Institucion" method="get" returnvariable="rssql"> </cfinvoke>

<cf_header title="Instituciones del Sistema" Overview="Definición de Instituciones del Sistema" icon="fa fa-users">
	<cfif isdefined('form.Action') and form.Action EQ 'NEW'>
		<cfinclude template="Institucion-form.cfm">
	<cfelseif isdefined('form.Action') and form.Action EQ 'Edit'>
		<cfinclude template="Institucion-form.cfm">		
	<cfelseif isdefined('form.Action') and form.Action EQ 'Delete'>
		<cfinvoke component="Componentes.Institucion" method="delete">
			<cfinvokeargument name="InsId" value="#form.InsId#">
		</cfinvoke>
		<cflocation url="Institucion.cfm">
	<cfelse>
		<cf_grid Name="cfGridInstitucion" title="Institucion del sistema" query="#rssql#" key="InsId">
			<cf_gridcolumn name="Nombre"  report="true" list="true"	header="Nombre">
		</cf_grid>
	</cfif>
<cf_footer>