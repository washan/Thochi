<!--- NOTE: all attributes required --->
<cfsetting enablecfoutputonly="true" />
<cfsetting showdebugoutput="false" />
<cfswitch expression="#ThisTag.ExecutionMode#">
	<!--- Start tag processing --->
	<cfcase value="start">
		<cfparam name="attributes.query" default="querynew('id');" />
		<cfparam name="attributes.columns" default="id" />
		<cfparam name="attributes.page" default="1" />
		<cfparam name="attributes.resultsper" default="10" />
		<!--- Function for converting the cfquery to the JSON format needed by Flexigrid --->
		<cffunction name="querytoflexigrid">
			<cfargument name="thequery" />
			<cfargument name="displayCols" />
			<cfargument name="page" default="1" required="false" />
			<cfargument name="rowsper" default="10" required="false" />
			<cfset var jsonresult = "" />
			<cfset var rows = "" />
			<cfif arguments.displaycols IS ""><cfset arguments.displayCols = arguments.thequery.columnlist /></cfif>
			<cfset jsonresult = "{
		page: #arguments.page#,
		total: #arguments.thequery.recordcount#,
		rows:[" />
			<cfsavecontent variable="rows"><cfoutput query="arguments.thequery" startrow="#arguments.page*arguments.rowsper+1-arguments.rowsper#" maxrows="#arguments.rowsper#">
		{id:'#arguments.thequery.id#',cell:[<cfloop list="#displaycols#" index="curcol">'#jsStringformat(arguments.thequery[curcol][currentrow])#'<cfif curcol NEq listlast(arguments.displaycols)>,</cfif></cfloop>]}<cfif currentrow NEQ arguments.page*arguments.rowsper>,</cfif></cfoutput>
			</cfsavecontent>
			<cfset jsonresult = jsonresult & rows & "]
		}" />
			<cfreturn jsonresult />
		</cffunction>
		<cfoutput>#querytoflexigrid(attributes.query,attributes.columns,attributes.page,attributes.resultsper)#</cfoutput>
	</cfcase>
</cfswitch>

