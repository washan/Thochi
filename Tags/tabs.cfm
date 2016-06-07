<cfparam name="Attributes.id" 			default="Tabs" />		<!---Nombre de los Tabs--->
<cfparam name="caller.Tab" 				default="#ArrayNew(1)#" />

<cfswitch expression="#ThisTag.ExecutionMode#">
	<!--- Start tag processing --->
	<cfcase value="start">
		<div class="tabbable">
	</cfcase>
	<!--- End tag processing --->
	<cfcase value="end">
			<ul id="<cfoutput>#Attributes.id#</cfoutput>" class="nav nav-tabs">			
				<cfloop array="#caller.Tab#" index="ArrayTab"> 
					 <li <cfif ArrayTab.active>class="active"</cfif>><a href="#<cfoutput>#ArrayTab.id#</cfoutput>" data-toggle="tab"><cfoutput>#ArrayTab.name#</cfoutput></a></li>
				</cfloop>
			</ul>
			<!---Contenido del Menu Horizontal--->
			<div id="TabContent<cfoutput>#Attributes.id#</cfoutput>" class="tab-content">
				<cfloop array="#caller.Tab#" index="ArrayTab"> 
					<div class="tab-pane fade in <cfif ArrayTab.active>active</cfif>" id="<cfoutput>#ArrayTab.id#</cfoutput>">
						<cfoutput>#ArrayTab.Content#</cfoutput>           
					</div>
				</cfloop>
			</div>
		</div>					
	</cfcase>
</cfswitch>