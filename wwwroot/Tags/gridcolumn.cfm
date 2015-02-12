<cfparam name="attributes.name" 	default=""/>
<cfparam name="attributes.header" 	default="#attributes.name#" />
<cfparam name="attributes.hide"	 	default="false" />
<cfsetting enablecfoutputonly="true">
	<cfswitch expression="#ThisTag.ExecutionMode#">	
		<cfcase value="start">
			<cfset caller.namecols   = listappend(caller.namecols,attributes.name) />	
			<cfset caller.headercols = listappend(caller.headercols,attributes.header) />	
		</cfcase>
	</cfswitch>
<cfsetting enablecfoutputonly="false">