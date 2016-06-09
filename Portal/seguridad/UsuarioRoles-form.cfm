<!---Obtiene los Roless padres--->
<!--- <cfinvoke component="Componentes.Roles" method="Get" returnvariable="rsRolesPadre"> --->
<!---Obtiene el Roles seleccionado--->

	<cfinvoke component="Componentes.Roles" method="Get" returnvariable="rsRoles">
	<cfinvoke component="Componentes.Usuarios" method="Get" returnvariable="rsUsuarios">	
	
	<cfquery name="rsOpSistema" datasource="thochi">
		select a.MenuId, a.Titulo, coalesce(b.MenuId,-1) as selected
		from Menus a
		left  join rolmenu b
		on a.MenuId = b.MenuId
		and b.RolesId = #form.RolesId#
		order by a.Titulo
	</cfquery>
 

<!---Pintado del Formulario--->
<cf_startBox title="Asiganacion de Roles a Usuario">
	<cf_form name="fmUsuarioRoles" action="UsuarioRoles-sql.cfm">
		<cfoutput>
			<div class="row">
			    <div class="col-md-12">
			        <div class="box box-blue">
			            <div class="box-content">
			                <cfif isDefined('rsRoles')>
				                <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">Opciones del Sistema</label>
									<div class="col-sm-9 col-lg-10 controls">
				                        <select class="form-control col-md-12" data-action="duallistbox" multiple="multiple" name="RolesSistema" id="RolesSistema">
				                            <cfloop query="rsRoles">
				                            	<option value="#rsRoles.RolesId#" <cfif rsRoles.selected NEQ -1>
				                            		selected="selected"
				                            	</cfif> >#rsRoles.Titulo#</option>
				                            </cfloop>
				                        </select>
				                    </div>
				                </div>
			                </cfif>
				            <div class="form-group" align="center">
								<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
								   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
								   <button type="button" class="btn" onclick="location.href='Roles.cfm'">Cancel  </button>
								</div>
							</div>	
			            </div>
			        </div>
			    </div>
			</div>
		</cfoutput>
	</cf_form> 
<cf_endBox>