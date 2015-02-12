<cfparam name="Attributes.title" 			default="Form" />		<!---Titulo del grid--->
<cfparam name="Attributes.Name" 			default="Form" />		<!---Name grid and form--->
<cfparam name="Attributes.closable" 		default="true" />   	<!---Permite que se cierre el grid--->
<cfparam name="Attributes.collapsible" 		default="true" />		<!---Permite que se contraiga o expanda el grid--->

<div class="row">
	<div class="col-md-12">
    	<div class="box box-green">
        	<div class="box-title">
            	<h3><i class="fa fa-users"></i> <cfoutput>#Attributes.title#</cfoutput></h3>
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