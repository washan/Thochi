<!---Obtiene los Roless padres--->
<cfinvoke component="Componentes.Roles" method="Get" returnvariable="rsRolesPadre">
<!---Obtiene el Roles seleccionado--->
<cfif isDefined('form.RolesId')>
	<cfinvoke component="Componentes.Roles" method="Get" returnvariable="rsRoles">
		<cfinvokeargument name="RolesId" value="#form.RolesId#">	
	</cfinvoke>
	<cfquery name="rsOpSistema" datasource="thochi">
		select a.MenuId, a.Titulo, coalesce(b.MenuId,-1) as selected
		from Menus a
		left  join rolmenu b
		on a.MenuId = b.MenuId
		and b.RolesId = #form.RolesId#
		order by a.Titulo
	</cfquery>
</cfif>

<!---Pintado del Formulario--->
<cf_startBox title="Catálogo Opciones de Sistema">
	<cf_form name="fmRoles" action="Roles-sql.cfm">
		<cfoutput>
			<cfif isDefined('form.RolesId')>
				<input type="hidden" name="RolesId" value="#form.RolesId#">
			</cfif>	
			<div class="row">
			    <div class="col-md-10">
			        <div class="box box-blue">
			            <div class="box-content">
							<div class="form-group">
								<label for="Nombre" class="col-xs-3 col-lg-2 control-label">Nombre</label>
								<div class="col-sm-9 col-lg-10 controls">
									<input type="text" name="Nombre" id="Nombre" placeholder="Nombre del Roles" class="form-control" <cfif isDefined('rsRoles')>value="#rsRoles.Nombre#"</cfif> required>
								</div>
							</div>
			                <cfif isDefined('rsOpSistema')>
				                <div class="form-group">
									<label class="col-sm-3 col-lg-5 control-label" align="center">Opciones del Sistema</label>
									<label class="col-sm-3 col-lg-5 control-label" align="center">Opciones del Sistema Seleccionadas</label>
								</div>

				                <div class="form-group" align="center">
									<!--- <label class="col-sm-3 col-lg-2 control-label">Opciones del Sistema</label> --->
									<div class=" col-lg-1 controls" ></div>
									<div class="col-sm-8 col-lg-10 controls" >
				                        <select class="form-control col-md-12" data-action="duallistbox" multiple="multiple" name="OpSistema" id="OpSistema">
				                            <cfloop query="rsOpSistema">
				                            	<option value="#rsOpSistema.MenuId#" <cfif rsOpSistema.selected NEQ -1>
				                            		selected="selected"
				                            	</cfif> >#rsOpSistema.Titulo#</option>
				                            </cfloop>
				                        </select>
				                    </div>
				                </div>
			                </cfif>
				            <div class="form-group" align="center">
								<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
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

    <script language="JavaScript1.2" type="text/javascript">
		function Aprueba(PCid){ 
			var Aprueba = 1
			var dataP = {
				method: "EnviarTramite",
				 PCid:  PCid,
				 Aprueba:  Aprueba     
				}

                try {
                    $.ajax ({
                        type: "post",
                        url: "/cfmx/ftec/Componentes/FTTramitesContratacion.cfc",
                        data: dataP,
                        dataType: "xml",
                        async: false,
                        cache: false,
                        
                        error:  function( objRequest, strError ){
                            Status = 1; 
                        }
                    });
                } catch(ss){
                    alert('FALLO Inesperado');
                }
                $('form[name=fmContratacion]').submit();                
		}
    </script>
<cf_endBox>