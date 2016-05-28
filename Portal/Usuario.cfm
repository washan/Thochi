<cfinvoke component="Componentes.Usuarios" method="get" returnvariable="rssql">



<cf_header title="Usuarios del Sistema" Overview="Administra los usuarios del Sistema" icon="fa fa-users">
	<cfif isdefined('form.Action') and form.Action EQ 'NEW'>
		<cfinclude template="Usuario-form.cfm">
	<cfelse>
		<cf_grid Name="cfGridUsuario" title="Usuarios del sistema" query="#rssql#" key="UsuarioId">
			<cf_gridcolumn name="NombreCompleto" header="Usuario">
			<cf_gridcolumn name="Correo" 		 header="Correo">
		</cf_grid>
	</cfif>
<cf_footer>