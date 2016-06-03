<cfinvoke component="Componentes.Roles" method="get" returnvariable="rssql"> </cfinvoke>

<cf_header title="Roles del Sistema" Overview="Definición de Roles del Sistema" icon="fa fa-users">
	<cfif isdefined('form.Action') and form.Action EQ 'NEW'>
		<cfinclude template="Roles-form.cfm">
	<cfelseif isdefined('form.Action') and form.Action EQ 'Edit'>
		<cfinclude template="Roles-form.cfm">		
	<cfelseif isdefined('form.Action') and form.Action EQ 'Delete'>
		<cfinvoke component="Componentes.Roles" method="delete">
			<cfinvokeargument name="RolesId" value="#form.RolesId#">
		</cfinvoke>
		<cflocation url="Roles.cfm">
	<cfelse>
		<cf_grid Name="cfGridRoles" title="Roles del sistema" query="#rssql#" key="RolesId">
			<cf_gridcolumn name="Nombre" 		header="Nombre">
		</cf_grid>
	</cfif>
<cf_footer>