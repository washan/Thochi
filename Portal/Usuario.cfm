<cfinvoke component="Componentes.Usuarios" method="get" returnvariable="rssql"> </cfinvoke>

<cf_header title="Usuarios del Sistema" Overview="Administra los usuarios del Sistema" icon="fa fa-users">
	<cfif isdefined('form.Action') and form.Action EQ 'NEW'>
		<cfinclude template="Usuario-form.cfm">
	<cfelseif isdefined('form.Action') and form.Action EQ 'Edit'>
		<cfinclude template="Usuario-form.cfm">	
	<cfelseif isdefined('form.Action') and form.Action EQ 'Delete'>
		<cfinvoke component="Componentes.Usuarios" method="delete">
			<cfinvokeargument name="UsuarioId" value="#form.UsuarioId#">
		</cfinvoke>
		<cflocation url="Usuario.cfm">
	<cfelse>
		<cf_grid Name="cfGridUsuario" title="Usuarios del sistema" query="#rssql#" key="UsuarioId">
			<cf_gridcolumn name="NombreCompleto" header="Usuario">
			<cf_gridcolumn name="Correo" 		 header="Correo">
		</cf_grid>
	</cfif>
<cf_footer>
