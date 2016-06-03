Usucodigo, Cedula, Nombre, Apellido1, Apellido2, Clave, Correo


<cfif isDefined('form.Usucodigo')>
	<cfinvoke component="Componentes.Usuarios" method="Get" returnvariable="rsUsuario">
		<cfinvokeargument name="Usucodigo" value="#form.Usucodigo#">	
	</cfinvoke>
</cfif>
<cf_startBox title="Usuarios de Sistema">
	<cf_form name="fmUsuarios" action="Usuario-sql.cfm">
		<cfoutput>
		<cfif isDefined('form.Usucodigo')>
			<input type="hidden" name="Usucodigo" value="#form.Usucodigo#">
		</cfif>	
		<div class="row">
    		<div class="col-md-6 ">
			  <!-- BEGIN Left Side -->
				<div class="form-group">
					<label for="Cedula" class="col-xs-3 col-lg-2 control-label">Cédula</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="Cedula" id="Cedula" placeholder="Cédula" class="form-control" <cfif isDefined('rsUsuario')>value="#rsUsuario.Cedula#"</cfif> required>
					</div>
				</div>

				<div class="form-group">
					<label for="Nombre" class="col-xs-3 col-lg-2 control-label">Nombre</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="Nombre" id="Nombre" placeholder="Nombre" class="form-control" <cfif isDefined('rsUsuario')>value="#rsUsuario.Nombre#"</cfif> required>
					</div>
				</div>

				<div class="form-group">
					<label for="Apellido1" class="col-xs-3 col-lg-2 control-label">Apellido1</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="Apellido1" id="Apellido1" placeholder="Apellido1" class="form-control" <cfif isDefined('rsUsuario')>value="#rsUsuario.Apellido1#"</cfif> required>
					</div>
				</div>

				<div class="form-group">
					<label for="Apellido2" class="col-xs-3 col-lg-2 control-label">Apellido2</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="Apellido2" id="Apellido2" placeholder="Apellido2" class="form-control" <cfif isDefined('rsUsuario')>value="#rsUsuario.Apellido2#"</cfif> required>
					</div>
				</div>

				<div class="form-group">
					<label for="Correo" class="col-xs-3 col-lg-2 control-label">Correo</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="email" name="Correo" id="Correo" class="form-control" data-rule-required="true" data-rule-email="true" <cfif isDefined('rsUsuario')>value="#rsUsuario.Correo#"</cfif>>
					</div>
				</div>

				<!--- ...
				<p>Username: <input type="text" required pattern="\w+" name="username"></p>
				<p>Password: <input type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pwd1" onchange="fmUsuarios.pwd2.pattern = this.value;"></p>
				<p>Confirm Password: <input type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pwd2"></p>
				... --->
 
				 <div class="form-group">
					<label for="Clave" class="col-xs-3 col-lg-2 control-label">Contraseña</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input class="form-control"  type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" id="Clave"  name="Clave" onchange="fmUsuarios.Clave2.pattern = this.value;">
						<!--- <input type="password" name="Clave" id="Clave" class="form-control" data-rule-required="true" data-rule-minlength="6"> --->
					</div>
				</div> 

				<div class="form-group">
					<label class="col-xs-3 col-lg-2 control-label" for="confirm-password">Confirme Contraseña:</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input class="form-control" type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="Clave2" id="Clave2">
						<!--- <input type="password" name="confirm-password" id="confirm-password" class="form-control" data-rule-required="true" data-rule-minlength="6" data-rule-equalto="##Clave"> --->
					</div>
				</div><!--- --->

				<div class="form-group">
					<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
					   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
					   <button type="button" class="btn" onclick="location.href='Usuario.cfm'">Cancel  </button>
					</div>
				</div>
				
			  <!-- END Left Side -->
		   </div>
		</div>
		</cfoutput>
	</cf_form>
<cf_endBox>