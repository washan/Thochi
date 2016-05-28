<cfparam name="Attributes.var" type="any" default="">
<cfparam name="Attributes.name" type="any" default="#Attributes.var#">
<cfparam name="Attributes.top" type="any" default="100">
<cfparam name="Attributes.abort" type="boolean" default="true">
<cfparam name="Attributes.label" type="string" default="">
<cfparam name="Attributes.filtro" type="string" default="">
<cfparam name="Attributes.datasource" type="string" default="">
<cfif Len(trim(Attributes.datasource)) EQ 0>
	<cfset Attributes.datasource = Session.Dsn>
</cfif>
<cfquery name="rsDump" datasource="#Attributes.datasource#">
	<cf_dbrowcount1 rows="#Attributes.top#" datasource="#Attributes.datasource#">
	select * from #Attributes.name# where 1 = 1 <cfif Len(trim(Attributes.filtro))>#iif(Ucase(ListGetAt(Attributes.filtro,1," "))EQ"AND",DE(""),DE("AND"))# #Attributes.filtro#</cfif>
	<cf_dbrowcount2 rows="#Attributes.top#" datasource="#Attributes.datasource#">
</cfquery>
<cfdump var="#rsDump#" <!--- label="#Attributes.label#: Primeros #Attributes.top# registros de la tabla #Attributes.name#." --->>
<cfif Attributes.abort>
	<cfabort>
</cfif>