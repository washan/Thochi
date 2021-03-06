<cfparam name="Attributes.title" 			default="Listado" />		<!---Titulo del grid--->
<cfparam name="Attributes.Nombre" 			default="Listado" />		<!---Nombre del grid y form--->
<cfparam name="Attributes.closable" 		default="true" />   		<!---Permite que se cierre el grid--->
<cfparam name="Attributes.collapsible" 		default="true" />			<!---Permite que se contraiga o expanda el grid--->
<cfparam name="Attributes.query" 			default="#QueryNew('x')#"/>	<!---Query que se quiere pintar en el grid--->
<cfparam name="Attributes.ButtonAdd" 		default="true" />   		<!---Coloca el boton de Agregar--->
<cfparam name="Attributes.ButtonDelete" 	default="true" />  			<!---Coloca el boton de Delete--->
<cfparam name="Attributes.ButtonEdit"   	default="true" /> 			<!---Coloca el boton de Editar--->
<cfparam name="Attributes.ButtonPrint"  	default="true" /> 			<!---Coloca el boton de Imprimir--->
<cfparam name="Attributes.ButtonPdf"    	default="true" /> 			<!---Coloca el boton de Exportar a PDF--->
<cfparam name="Attributes.ButtonExcel"  	default="true" /> 			<!---Coloca el boton de Exportar a Excel--->
<cfparam name="Attributes.ButtonRefresh"  	default="true" /> 			<!---Coloca el boton de Refrescar--->
<cfparam name="Attributes.checkbox"  		default="true" />			<!---true: Coloca checkbox, false: No coloca checkbox---> 
<cfparam name="Attributes.key"  			default="" />				<!---Campos llave para pasar informacion---> 
<cfparam name="Attributes.NameReport"  		default="Reporte de #Attributes.title#" />				<!---Nombre del reporte---> 
<cfparam name="caller.col" 					default="#ArrayNew(1)#" />

<cfswitch expression="#ThisTag.ExecutionMode#">
	<!--- Start tag processing --->
	<cfcase value="start">
		
		<form name="<cfoutput>#Attributes.Nombre#</cfoutput>" id="<cfoutput>#Attributes.Nombre#</cfoutput>" method="post">
		<div class="row">
			<div class="col-md-12">
            	<div class="box">
					<!---Encabezado del grid--->
                	<div class="box-title">
                    	<h3><i class="fa fa-table"></i><cfoutput>#attributes.title#</cfoutput></h3>
                        <div class="box-tool">
							<cfif attributes.collapsible>
                        		<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
							</cfif>
                            <cfif attributes.closable>
								<a data-action="close" href="#"><i class="fa fa-times"></i></a>                                
							</cfif>
						</div>
                 	</div>
					<!---Botonera del grid--->
					<div class="box-content">
						<div class="btn-toolbar pull-right clearfix">
							<div class="btn-group">
								<cfif Attributes.ButtonAdd>
									<a class="btn btn-circle show-tooltip" title="Agregar nuevo Registro" href="#" onclick="New<cfoutput>#Attributes.Nombre#</cfoutput>()"><i class="fa fa-plus"></i></a>
								</cfif>
								<cfif Attributes.ButtonEdit>
									<a class="btn btn-circle show-tooltip" title="Editar Registro seleccionado" href="#" onclick="Edit<cfoutput>#Attributes.Nombre#</cfoutput>()"><i class="fa fa-edit"></i></a>
								</cfif>
								<cfif Attributes.ButtonDelete>
									<a class="btn btn-circle show-tooltip" title="Delete selected" href="#" onclick="Delete<cfoutput>#Attributes.Nombre#</cfoutput>()"><i class="fa fa-trash-o"></i></a>                                    
								</cfif>
							</div>
							<div class="btn-group">
								<cfif Attributes.ButtonPrint>
									<a class="btn btn-circle show-tooltip" title="Print" data-toggle="modal" data-target="#Modal<cfoutput>#Attributes.Nombre#</cfoutput>" href="#"><i class="fa fa-print"></i></a>
								</cfif>
								<cfif Attributes.ButtonPdf>
									<a class="btn btn-circle show-tooltip" title="Export to PDF" href="#"><i class="fa fa-file-text-o"></i></a>
								</cfif>
								<cfif Attributes.ButtonExcel>
									<a class="btn btn-circle show-tooltip" title="Export to Excel" href="#"><i class="fa fa-table"></i></a>                                    
								</cfif>
							</div>
							<div NOT class="btn-group">
								<cfif Attributes.ButtonRefresh>
									<a class="btn btn-circle show-tooltip" title="Refresh" href="#"><i class="fa fa-repeat"></i></a>      
								</cfif>                              
							</div>
						</div>
						<br/><br/>
						<div class="clearfix"></div>
						
						
	</cfcase>
	<!--- End tag processing --->
	<cfcase value="end">
		<div class="table-responsive" style="border:0">
			<table class="table table-advance" id="table1">
				<thead>
					<tr>
						<cfif Attributes.checkbox>
							<th style="width:18px"><input type="checkbox"/></th>
						</cfif>
						<cfloop array="#caller.col#" index="ArrayCol"> 
							<cfif ArrayCol.List>
								<th class="text-center"><cfoutput>#ArrayCol.header#</cfoutput></th>
							</cfif>
						</cfloop>
					</tr>
				</thead>
				<tbody>
					<cfloop query="Attributes.query">
						<tr class="table-flag-blue">
							<cfif Attributes.checkbox>
								<cfset x= 'Attributes.query.'&#Attributes.key#>
								<td><input type="checkbox" name="<cfoutput>#Attributes.key#</cfoutput>" id="<cfoutput>#Attributes.key#</cfoutput>" 
								value="<cfoutput>#EVALUATE(x)#</cfoutput>"/></td>
							</cfif>
							
								<cfloop array="#caller.col#" index="ArrayCol"> 
									<cfif ArrayCol.List>
										<td class="text-center">
											<cfif not isdefined('Attributes.query.' & ArrayCol.name)>
												No definido
											<cfelse>
												<cfoutput>#Evaluate('Attributes.query.' & ArrayCol.name)#</cfoutput>
											</cfif>
										</td>
									</cfif>
								</cfloop>
						</tr>
					</cfloop>
				</tbody>
			</table>
				</div>
					</div>
				</div>
			</div>
		</div>
		<input name="Action" id="Action" type="hidden" value="New"/>
		</form>
		<!---Reporte--->
		
			<!-- Modal -->
			<div id="Modal<cfoutput>#Attributes.Nombre#</cfoutput>" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			
				<!-- Modal content-->
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-center"><cfoutput>#Attributes.NameReport#</cfoutput></h4>
				  </div>
				  <div class="modal-body">
						<!---Contenido reporte--->
							<table class="table">
                                    <thead>
                                        <tr>
                                           <cfloop array="#caller.col#" index="ArrayCol"> 
										   		<cfif ArrayCol.Report>
													<th><cfoutput>#ArrayCol.header#</cfoutput></th>
												</cfif>
											</cfloop>
                                        </tr>
                                    </thead>
                                    <tbody>
										<cfloop query="Attributes.query">
											<tr>
											  <cfloop array="#caller.col#" index="ArrayCol"> 
											  	<cfif ArrayCol.Report>
													<td>
														<cfif not isdefined('Attributes.query.' & ArrayCol.name)>
															No definido
														<cfelse>
															<cfoutput>#Evaluate('Attributes.query.' & ArrayCol.name)#</cfoutput>
														</cfif>
													</td>
												</cfif>
											</cfloop>
											</tr>
										</cfloop>
                                    </tbody>
                                </table>
						<!------>
				  </div>
				  <div class="modal-footer">
				  	<button type="button" class="btn btn-print" data-dismiss="modal">Imprimir</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				  </div>
				</div>
			
			  </div>
			</div>
		<script language="javascript" type="text/javascript">
			function New<cfoutput>#Attributes.Nombre#</cfoutput>(){
				document.Listado.Action.value = 'New';
				document.Listado.submit();
				return true;
			}
			function Edit<cfoutput>#Attributes.Nombre#</cfoutput>(){
				if (($('input[type=checkbox]:checked').length === 0) || ($('input[type=checkbox]:checked').length != 1)) {
			        alert('Debe seleccionar un Registro para Modificar');
			    }
			    else{
			    	document.Listado.Action.value = 'Edit';
					document.Listado.submit();
					return true;
			    }
			}

			function Delete<cfoutput>#Attributes.Nombre#</cfoutput>(){
				if ($('input[type=checkbox]:checked').length === 0) {
			        alert('Debe seleccionar al menos un Registro');
			    }
			    else{
			    	document.Listado.Action.value = 'Delete';
					document.Listado.submit();
					return true;
			    }
			}

			
		</script>
	</cfcase>
</cfswitch>