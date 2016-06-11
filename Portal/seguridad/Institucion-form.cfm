<!---Obtiene el Institucion seleccionado--->
<cfif isDefined('form.InsId')>
	<cfinvoke component="Componentes.Institucion" method="Get" returnvariable="rsInstitucion">
		<cfinvokeargument name="InsId" value="#form.InsId#">	
	</cfinvoke>
</cfif>

<!---Pintado del Formulario--->
<cf_startBox title="Catálogo Opciones de Sistema">
	<cf_form name="fmInstitucion" action="Institucion-sql.cfm">
		<cfoutput>
			<cfif isDefined('form.InsId')>
				<input type="hidden" name="InsId" value="#form.InsId#">
			</cfif>	
			<div class="row">
			    <div class="col-md-10">
			        <div class="box box-blue">
			            <div class="box-content">
							<div class="form-group">
								<label for="Nombre" class="col-xs-3 col-lg-2 control-label">Nombre</label>
								<div class="col-sm-9 col-lg-10 controls">
									<input type="text" name="Nombre" id="Nombre" placeholder="Nombre del Institucion" class="form-control" <cfif isDefined('rsInstitucion')>value="#rsInstitucion.Nombre#"</cfif> required>
								</div>
							</div>
				            <div class="form-group" align="center">
								<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
								   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
								   <button type="button" class="btn" onclick="location.href='Institucion.cfm'">Cancel  </button>
								</div>
							</div>	
			            </div>
			        </div>
			    </div>
			</div>
		</cfoutput>
	</cf_form> 
<cf_endBox>