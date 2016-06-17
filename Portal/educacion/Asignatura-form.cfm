<!---Obtiene el Asignatura seleccionado--->
<cfif isDefined('form.idAsignatura')>
	<cfinvoke component="Componentes.Asignatura" method="Get" returnvariable="rsAsignatura">
		<cfinvokeargument name="idAsignatura" value="#form.idAsignatura#">	
	</cfinvoke>
</cfif>

<!---Pintado del Formulario--->
<cf_startBox title="Catálogo Asignaturas">
	<cf_form name="fmAsignatura" action="Asignatura-sql.cfm">
		<cfoutput>
			<cfif isDefined('form.idAsignatura')>
				<input type="hidden" name="idAsignatura" value="#form.idAsignatura#">
			</cfif>	
			<div class="row">
			    <div class="col-md-10">
			        <div class="box box-blue">
			            <div class="box-content">
							<div class="form-group">
								<label for="Nombre" class="col-xs-3 col-lg-2 control-label">Nombre</label>
								<div class="col-sm-9 col-lg-10 controls">
									<input type="text" name="Nombre" id="Nombre" placeholder="Nombre de la Asignatura" class="form-control" <cfif isDefined('rsAsignatura')>value="#rsAsignatura.Nombre#"</cfif> required>
								</div>
							</div>
				            <div class="form-group" align="center">
								<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
								   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
								   <button type="button" class="btn" onclick="location.href='Asignatura.cfm'">Cancel  </button>
								</div>
							</div>	
			            </div>
			        </div>
			    </div>
			</div>
		</cfoutput>
	</cf_form> 
<cf_endBox>