<cfparam name="attributes.name" 	default=""/>
<cfparam name="attributes.header" 	default="#attributes.name#" />
<cfparam name="attributes.list"	 	default="true" />
<cfparam name="attributes.report"	default="#attributes.list#" />
<cfsetting enablecfoutputonly="true">
	<cfswitch expression="#ThisTag.ExecutionMode#">	
		<cfcase value="start">
				<cfset col.name 	= attributes.name>
				<cfset col.header   = attributes.header>
				<cfset col.list     = attributes.list>
				<cfset col.report   = attributes.report>
				<cfset ArrayAppend(caller.col,col) />
		</cfcase>
	</cfswitch>
<cfsetting enablecfoutputonly="false">