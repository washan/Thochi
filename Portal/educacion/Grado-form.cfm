<!---Obtiene el Grado seleccionado--->
<cfif isDefined('form.idGrado')>
	<cfinvoke component="Componentes.Grado" method="Get" returnvariable="rsGrado">
		<cfinvokeargument name="idGrado" value="#form.idGrado#">	
	</cfinvoke>
</cfif>

<!---Pintado del Formulario--->
<cf_startBox title="Grados de la Institución">
	<cf_form name="fmGrado" action="Grado-sql.cfm">
		<cfoutput>
			<cfif isDefined('form.idGrado')>
				<input type="hidden" name="idGrado" value="#form.idGrado#">
			</cfif>	
			<div class="row">
			    <div class="col-md-10">
			        <div class="box box-blue">
			            <div class="box-content">
							<div class="form-group">
								<label for="Descripcion" class="col-xs-3 col-lg-2 control-label">Descripcion</label>
								<div class="col-sm-9 col-lg-10 controls">
									<input type="text" name="Descripcion" id="Descripcion" placeholder="Descripcion del Grado" class="form-control" <cfif isDefined('rsGrado')>value="#rsGrado.Descripcion#"</cfif> required>
								</div>
							</div>
				            <div class="form-group" align="center">
								<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
								   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i>Save</button>
								   <button type="button" class="btn" onclick="location.href='Grado.cfm'">Cancel</button>
								</div>
							</div>	
			            </div>
			        </div>
			    </div>
			</div>
		</cfoutput>
	</cf_form> 
<cf_endBox>