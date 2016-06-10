<cfinvoke component="Componentes.Usuarios" method="get" returnvariable="rssql"> </cfinvoke>

<cf_header title="Permisos - Usuario" Overview="Administración de roles asignados a usarios del sistema" icon="fa fa-users">
	<cfinclude template="UsuarioRoles-form.cfm">	
<cf_footer>
