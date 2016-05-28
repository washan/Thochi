<!---
<cfparam name="Attributes.title" 			default="Form" />		<!---Titulo del grid--->
<cfparam name="Attributes.Name" 			default="Form" />		<!---Name grid and form--->
<cfparam name="Attributes.closable" 		default="true" />   	<!---Permite que se cierre el grid--->
<cfparam name="Attributes.collapsible" 		default="true" />
--->

<cf_startBox title="Catálogo Opciones de Sistema">
	<cfinvoke component="Componentes.Menu" method="Get" returnvariable="rsMenuPadre">

	<cfif isDefined('form.MenuId')>
		<cfinvoke component="Componentes.Menu" method="Get" returnvariable="rsMenus">
			<cfinvokeargument name="MenuId" value="#form.MenuId#">	
		</cfinvoke>
	</cfif>

	<form name="fmMenus" id="fmMenus" method="post" action="Menu-sql.cfm"  class="form-horizontal" >
		<cfoutput>
		<cfif isDefined('form.MenuId')>
			<input type="hidden" name="MenuId" value="#form.MenuId#">
		</cfif>		
		<div class="row">
			<div class="col-md-6 ">
				<!-- BEGIN Left Side -->
				<div class="form-group">
					<label for="Codigo" class="col-xs-3 col-lg-2 control-label">Código</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="Codigo" id="Codigo" placeholder="Código opción menu" class="form-control" <cfif isDefined('rsMenus')>value="#rsMenus.Codigo#"</cfif> required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="Titulo" class="col-xs-3 col-lg-2 control-label">Titulo</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="Titulo" id="Titulo" placeholder="Titulo que se desea mostrar como opcion de menu" class="form-control" <cfif isDefined('rsMenus')>value="#rsMenus.Titulo#"</cfif> required>
					</div>
				</div>

				<div class="form-group">
					<label for="Nivel" class="col-xs-3 col-lg-2 control-label">Nivel</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="number" min="0" max="10" step="1"  name="nivel" id="nivel" size="6" <cfif isDefined('rsMenus')>value="#rsMenus.nivel#"<cfelse>value="0" </cfif>> 
					</div>
				</div>

				<div class="form-group">
					<label for="URLinicial" class="col-xs-3 col-lg-2 control-label">URLinicial</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="URLinicial" id="URLinicial" placeholder="Url inicial para la invocación" class="form-control" <cfif isDefined('rsMenus')>value="#rsMenus.URLinicial#"</cfif> required >
					</div>
				</div>
				<!-- END Left Side -->
			</div>

			<div class="col-md-6 ">
				<!--- BEGIN Right Side --->
				  <div class="form-group">
					<label for="MenuIdPadre" class="col-xs-3 col-lg-2 control-label">Menu Padre</label>
					<div class="col-sm-9 col-lg-10 controls">
						<select name="MenuIdPadre" tabindex="1" class="form-control"> 
							<option  title="" value="" >-- No Definido --</option>
							<cfloop query="rsMenuPadre">
								<cfif rsMenus.MenuIdPadre neq -1>
									<option  title="#rsMenuPadre.CodigoP#" value="#rsMenuPadre.MenuId#"
										<cfif rsMenuPadre.MenuId eq rsMenus.MenuIdPadre> selected </cfif>>
										#rsMenuPadre.Titulo#
									</option>
								<cfelse>
									<option  title="#rsMenuPadre.Codigo#" value="#rsMenuPadre.MenuId#" >#rsMenuPadre.Titulo#</option>
								</cfif>
								<!--- <option  title="#rsMenuPadre.Codigo#" value="#rsMenuPadre.MenuId#" >#rsMenuPadre.Titulo#</option> --->
							</cfloop>
						</select>
					</div>
				</div> 

				<div class="form-group">
					<label for="Orden" class="col-xs-3 col-lg-2 control-label">Orden</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input   type="number" min="0" max="10" step="1" name="Orden" id="Orden" size="6" <cfif isDefined('rsMenus')>value="#rsMenus.Orden#"<cfelse> value="0" </cfif>>  
					</div>
				</div>

				<div class="form-group">
					<label for="IconFont" class="col-xs-3 col-lg-2 control-label">IconFont</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="IconFont" id="IconFont" placeholder="Icon Font para mostrar" class="form-control" <cfif isDefined('rsMenus')>value="#rsMenus.IconFont#"</cfif>>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
					   <button name="save" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
					   <button type="button" class="btn" onclick="location.href='Menu.cfm'">Cancel  </button>
					</div>
				</div>
				<!-- END Right Side -->
			</div>  
		</div>
		</cfoutput>
	</form>
<cf_endBox>