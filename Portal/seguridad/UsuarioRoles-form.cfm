<cfif isDefined('url.Rol') and len(url.Rol) >
	<cfset form.RolesId = url.Rol>
<cfelse>
	<cfparam name="form.RolesId" default="0" />
</cfif>
<cfif isDefined('url.Inst') and len(url.Inst) >
	<cfset form.InsId = url.Inst>
<cfelse>
	<cfparam name="form.RolesId" default="0" />
	<cfparam name="form.InsId"   default="0" />
</cfif>


<cfinvoke component="Componentes.Roles" method="Get" returnvariable="rsRoles">
<cfinvoke component="Componentes.Usuarios" method="Get" returnvariable="rsUsuarios">	
<cfinvoke component="Componentes.Institucion" method="Get" returnvariable="rsInstituciones">	

<cfinvoke component="Componentes.UsuarioRoles" method="get" returnvariable="rsUsuRol">
    <cfinvokeargument name="RolesId"        value="#form.RolesId#">
</cfinvoke>

<!---Pintado del Formulario--->
<cf_startBox title="Asiganacion de Roles a Usuario">
	<cf_form name="fmUsuarioRoles" action="UsuarioRoles-sql.cfm">
		<cfoutput>
			<!--- <input name="lvarRol" type="hidden" value="#form.RolesId#"> --->
			<div class="row">
			    <div class="col-md-12">
			        <div class="box box-blue">
			            <div class="box-content">
			                <div class="form-group">
								<label for="Institucion" class="col-xs-3 col-lg-2 control-label">Institución</label>
								<div class="col-sm-9 col-lg-10 controls">
									<select name="InsId" id="InsId" tabindex="1" class="form-control"> 
										<option  title="" value="" >-- Seleccione Institución --</option>
										<cfloop query="rsInstituciones">
											<cfif isdefined('rsInstituciones.InsId') and rsInstituciones.InsId neq 0>
												<option  title="#rsInstituciones.Nombre#" value="#rsInstituciones.InsId#" 
												<cfif rsInstituciones.InsId eq form.InsId> selected </cfif>>
													#rsInstituciones.Nombre#
												</option>
											</cfif>
										</cfloop>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="Rol" class="col-xs-3 col-lg-2 control-label">Roles:</label>
								<div class="col-sm-9 col-lg-10 controls">
									<select name="RolesId" id="RolesId" tabindex="1" class="form-control" onchange="refresca(this.value);"> 
										<option  title="" value="" >-- Seleccione Roll --</option>
										<cfloop query="rsRoles">
											<cfif isdefined('rsRoles.RolesId') and rsRoles.RolesId neq 0>
												<option  title="#rsRoles.Nombre#" value="#rsRoles.RolesId#" 
												<cfif rsRoles.RolesId eq form.RolesId> selected </cfif>>
													#rsRoles.Nombre#
												</option>
											</cfif>
										</cfloop>
									</select>
								</div>
							</div>

							<cfif isDefined('rsUsuRol')>
								<div class="form-group">
									<label class="col-sm-3 col-lg-5 control-label" align="center">Usuarios</label>
									<label class="col-sm-3 col-lg-5 control-label" align="center">Usuarios asociados al roll</label>
								</div>

								<div class="form-group" align="center">
									<!--- <label class="col-sm-3 col-lg-2 control-label">Opciones del Sistema</label> --->
									<div class=" col-lg-1 controls" ></div>
									<div class="col-sm-8 col-lg-10 controls" >
								        <select class="form-control col-md-12" data-action="duallistbox" multiple="multiple" name="UsuRoll" id="UsuRoll">
								            <cfloop query="rsUsuRol">
								            	<option value="#rsUsuRol.Usucodigo#" <cfif rsUsuRol.selected NEQ -1>
								            		selected="selected"
								            	</cfif> >#rsUsuRol.NombreCompleto#</option>
								            </cfloop>
								        </select>
								    </div>
								</div>
							</cfif>

				            <div class="form-group" align="center">
								<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
								   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
								   <button type="button" class="btn" onclick="location.href='UsuarioRoles.cfm'">Cancel  </button>
								</div>
							</div>	
			            </div>
			        </div>
			    </div>
			</div>
		</cfoutput>
	</cf_form> 

	<script language="JavaScript1.2" type="text/javascript">
		function refresca(RolesId){ 
				$('form[name=fmUsuarioRoles]').submit();


				<!---
				var roll = RolesId
				var dataP = {
					method: "get",
					 RolesId:  roll,
					}

                    try {
                        $.ajax ({
                            type: "post",
                            url: "/Componentes/UsuarioRoles.cfc",
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
                     $('form[name=fmUsuarioRoles]').submit();  
                     --->    
			}

<!---			
		$(document).ready(function() {
		    $('#element').click(function() {
		        //Get data to be sent to server
		        //var sFamily = $("#family_search").text();
		        //var sFamily = $(this).text();
		        var sFamily = "family";
		        $.ajax({
		            type: 'POST',
		            url: 'thegamer.php',
		            data: {family: sFamily },
		            success: function(response){
		                //Use response
		                //alert("Server echo: "+response);
		                $("#output_element").html(response);
		            },
		            error: function(msg){
		                alert("Error: "+msg);
		            }
		        });
		    });
		});
--->
	</script>
<cf_endBox>