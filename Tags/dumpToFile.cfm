<cfparam name="Attributes.var"				type="any" default=""> 
<cfparam name="Attributes.name"				type="string" default="">
<cfparam name="Attributes.select"			type="string" default="">
<cfparam name="Attributes.query"			type="string" default="">
<cfparam name="Attributes.datasource"		type="string" default="">
<cfparam name="Attributes.returnvariable"	type="string" default="">
<cfparam name="Attributes.abort"			type="boolean" default="true">

<cfset LvarFile = expandPath("/sif/TagsSIF/dumpToFile.htm")>
<cfsavecontent variable="XX">
	<cf_dump var="#Attributes.var#" name="#Attributes.name#" select="#Attributes.select#" query="#Attributes.query#" datasource="#Attributes.datasource#" abort="no">
</cfsavecontent>
<cfparam name="request.dumpToFileAction" default="write">
<cffile file="#LvarFile#" action="#request.dumpToFileAction#" output="#XX#">

<cfif Attributes.abort>
	<cfset LvarMSG="cf_dumpToFile generó el archivo: http://#cgi.SERVER_NAME#:#cgi.SERVER_PORT#/cfmx/sif/TagsSIF/dumpToFile.htm <a href='/cfmx/sif/TagsSIF/dumpToFile.htm?ts=#getTickCount()#'><strong>(Ver Archivo)</strong></a>">
	<cfif Attributes.returnvariable NEQ "">
		<cfset Caller[Attributes.returnvariable] = LvarMSG>
	<cfelse>
		<cfthrow message="#LvarMSG#">
	</cfif>
<cfelse>
	<cfset request.dumpToFileAction = "append">
	<cffile file="#LvarFile#" action="#request.dumpToFileAction#" output="=====================================================================" fixnewline="yes">
</cfif>	
