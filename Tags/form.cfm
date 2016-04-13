<cfparam name="Attributes.title" 			default="Form" />		<!---Titulo del grid--->
<cfparam name="Attributes.Name" 			default="Form" />		<!---Name grid and form--->
<cfparam name="Attributes.closable" 		default="true" />   	<!---Permite que se cierre el grid--->
<cfparam name="Attributes.collapsible" 		default="true" />		<!---Permite que se contraiga o expanda el grid--->

<cfswitch expression="#ThisTag.ExecutionMode#">
	<cfcase value="start">
		<div class="row">
        	<div class="col-md-12">
            	<div class="box box-green">
                	<div class="box-title">
                    	<h3><i class="fa fa-bars"></i> <cfoutput>#Attributes.title#</cfoutput></h3>
                       	<div class="box-tool">
                        	<cfif Attributes.collapsible>
								<a data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
							</cfif>
                            <cfif Attributes.closable>
								<a data-action="close" href="#"><i class="fa fa-times"></i></a>
							</cfif>
						</div>
              		</div>
                    <div class="box-content">
                    	<form name="<cfoutput>#Attributes.Name#</cfoutput>" id="<cfoutput>#Attributes.Name#</cfoutput>" action="#" class="form-horizontal">	
</cfcase>

<cfcase value="end">
	<div class="row">
    	<div class="col-md-6 ">
			  <!-- BEGIN Left Side -->
				<div class="form-group">
					<label for="textfield1" class="col-xs-3 col-lg-2 control-label">Text input</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="textfield1" id="textfield1" placeholder="Text input" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="password1" class="col-xs-3 col-lg-2 control-label">Password</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="password" name="password1" id="password1" placeholder="Password input" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label">Checkboxes</label>
					<div class="col-sm-9 col-lg-10 controls">
						<label class="checkbox">
							<input type="checkbox" name="checkbox"> Checkbox 1                                                    </label>
						<label class="checkbox">
							<input type="checkbox" name="checkbox"> Checkbox 2                                                    </label>
					</div>
				</div>
				<div class="form-group">
					<label for="textarea1" class="col-xs-3 col-lg-2 control-label">Textarea</label>
					<div class="col-sm-9 col-lg-10 controls">
						<textarea name="textarea1" id="textarea1" rows="5" class="form-control"></textarea>
					</div>
				</div>
			  <!-- END Left Side -->
		   </div>
		   <div class="col-md-6 ">
			  <!-- BEGIN Right Side -->
				<div class="form-group">
					<label for="textfield2" class="col-xs-3 col-lg-2 control-label">Text input</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="text" name="textfield2" id="textfield2" placeholder="Text input" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="password2" class="col-xs-3 col-lg-2 control-label">Password</label>
					<div class="col-sm-9 col-lg-10 controls">
						<input type="password" name="password2" id="password2" placeholder="Password input" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label">Checkboxes</label>
					<div class="col-sm-9 col-lg-10 controls">
						<label class="checkbox">
							<input type="checkbox" name="checkbox"> Checkbox 1                                                    </label>
						<label class="checkbox">
							<input type="checkbox" name="checkbox"> Checkbox 2                                                    </label>
					</div>
				</div>
				<div class="form-group">
					<label for="textarea2" class="col-xs-3 col-lg-2 control-label">Textarea</label>
					<div class="col-sm-9 col-lg-10 controls">
						<textarea name="textarea2" id="textarea2" rows="5" class="form-control"></textarea>
					</div>
				</div>
	
				<div class="form-group">
					<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2">
					   <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
					   <button type="button" class="btn">Cancel</button>
					</div>
				</div>
			  <!-- END Right Side -->
		   </div>
		</div>
	 </form>
	</div>
	</div>
	</div>
	</div>
	</cfcase>
</cfswitch>