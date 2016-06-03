<!---Obtiene los Roless padres--->
<cfinvoke component="Componentes.Roles" method="Get" returnvariable="rsRolesPadre">
<!---Obtiene el Roles seleccionado--->
<cfif isDefined('form.RolesId')>
	<cfinvoke component="Componentes.Roles" method="Get" returnvariable="rsRoles">
		<cfinvokeargument name="RolesId" value="#form.RolesId#">	
	</cfinvoke>
</cfif>
<!---Pintado del Formulario--->
<cf_startBox title="Catálogo Opciones de Sistema">
	<cf_form name="fmRoles" action="Roles-sql.cfm">
		<cfoutput>
		<cfif isDefined('form.RolesId')>
			<input type="hidden" name="RolesId" value="#form.RolesId#">
		</cfif>		
		<div class="row" align="center">
			<div class="col-md-10">
				<!--- BEGIN Left Side --->
				<div class="form-group">
					<label for="Nombre" class="col-xs-3 col-lg-2 control-label">Nombre</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="Nombre" id="Nombre" placeholder="Nombre del Roles" class="form-control" <cfif isDefined('rsRoles')>value="#rsRoles.Nombre#"</cfif> required>
					</div>
				</div>
			
				<div class="form-group">
					<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
					   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
					   <button type="button" class="btn" onclick="location.href='Roles.cfm'">Cancel  </button>
					</div>
				</div>
				<!--- END Right Side --->
			</div>  
		</div>
		</cfoutput>
	</cf_form>
<cf_endBox>