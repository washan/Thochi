<cfparam name="attributes.id" 		default=""/>
<cfparam name="attributes.name" 	default="#attributes.id#"/>
<cfparam name="attributes.active"	default="false" />
<cfsetting enablecfoutputonly="true">
	<cfswitch expression="#ThisTag.ExecutionMode#">	
		<cfcase value="start">
			<cfset col.name = attributes.name>
			<cfset col.id   = attributes.id>
			
			<cfset caller.Tab = listappend(caller.Tab,col) />	
			
		</cfcase>
	</cfswitch>
<cfsetting enablecfoutputonly="false">