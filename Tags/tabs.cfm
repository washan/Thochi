<cfparam name="Attributes.id" 			default="Tabs" />		<!---Nombre de los Tabs--->

<cfswitch expression="#ThisTag.ExecutionMode#">
	<!--- Start tag processing --->
	<cfcase value="start">
		<div class="tabbable">
        	<ul id="<cfoutput>#Attributes.id#</cfoutput>" class="nav nav-tabs">						
	</cfcase>
	<!--- End tag processing --->
	<cfcase value="end">
		
						<!---<cfloop list="#caller.headercols#" index="ccol">
							
						</cfloop>--->
		</div>						
	</cfcase>
</cfswitch>