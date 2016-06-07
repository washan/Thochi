<cfparam name="attributes.id" 		default=""/>
<cfparam name="attributes.name" 	default="#attributes.id#"/>
<cfparam name="attributes.active"	default="false" />
<cfsilent>
	<cfsetting enablecfoutputonly="true">
		<cfswitch expression="#ThisTag.ExecutionMode#">	
			<cfcase value="start">
				<cfset col.name 	= attributes.name>
				<cfset col.id   	= attributes.id>
				<cfset col.active   = attributes.active>
			</cfcase>
			<cfcase value="end">
				<cfset col.Content  = ThisTag.GeneratedContent>
				<cfset ThisTag.GeneratedContent = ''>
				<cfset ArrayAppend(caller.Tab,col) />
			</cfcase>
		</cfswitch>
	<cfsetting enablecfoutputonly="false">
</cfsilent>