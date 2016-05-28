<cfparam name="Attributes.var" type="any" default=""> 
<cfparam name="Attributes.name" type="string" default="">
<cfparam name="Attributes.select" type="string" default="">
<cfparam name="Attributes.query" type="string" default="">
<cfparam name="Attributes.datasource" type="string" default="">
<cfparam name="Attributes.abort" type="boolean" default="yes">
<cfparam name="Attributes.user" type="string" default="">

<cfif Attributes.user EQ "">
    <cfif Attributes.name NEQ "">
        <cfset LvarVar = caller[Attributes.name]>
        <cfdump var="#LvarVar#">
    <cfelseif Attributes.select NEQ "" OR Attributes.query NEQ "">
        <cfif Attributes.datasource EQ "">
            <cfset Attributes.datasource = #Application.Datasorce#>
        </cfif>
        <cfset LvarVar = fnSelect(Attributes.select, Attributes.query, Attributes.datasource)>
    <cfelse>
        <cfdump var="#Attributes.var#">
    </cfif>
    <cfif Attributes.abort>
        <cf_abort errorInterfaz="">
    </cfif>
<cfelse>
	<cfif #session.Usulogin# EQ #Attributes.user#>
    	<cfif Attributes.name NEQ "">
			<cfset LvarVar = caller[Attributes.name]>
            <cfdump var="#LvarVar#">
        <cfelseif Attributes.select NEQ "" OR Attributes.query NEQ "">
            <cfif Attributes.datasource EQ "">
                <cfset Attributes.datasource = #Application.Datasorce#>
            </cfif>
            <cfset LvarVar = fnSelect(Attributes.select, Attributes.query, Attributes.datasource)>
        <cfelse>
            <cfdump var="#Attributes.var#">
        </cfif>
		<cfif Attributes.abort>
            <cf_abort errorInterfaz="">
        </cfif>
    </cfif>
</cfif>



<cfexit>


<cffunction name="fnSelect" output="true" returntype="void">
	<cfargument name="sql">
	<cfargument name="query">
	<cfargument name="dsn">
	
	<cfif arguments.query NEQ "">
		<cfset LvarQuery = caller[arguments.query]>
	<cfelse>
		<cfquery name="LvarQuery" datasource="#Arguments.dsn#">
			#preserveSingleQuotes(Arguments.SQL)#
		</cfquery>
	</cfif>
	<cfset LvarCols = LvarQuery.getColumnNames()>
	<cfset LvarFileType = arrayNew(1)>
	<cfloop index="i" from="1" to="#arrayLen(LvarCols)#">
		<cfset LvarJavaType = evaluate("LvarQuery.#LvarCols[i]#").getClass().getName()>
		<cfif findNoCase("Integer",LvarJavaType) GT 0>
			<cfset LvarFileType[i] = "N">
		<cfelseif findNoCase("BigDecimal",LvarJavaType) GT 0>
			<cfset LvarFileType[i] = "N">
		<cfelseif findNoCase("Double",LvarJavaType) GT 0>
			<cfset LvarFileType[i] = "N">
		<cfelseif findNoCase("Float",LvarJavaType) GT 0>
			<cfset LvarFileType[i] = "N">
		<cfelseif findNoCase("Time",LvarJavaType) GT 0>
			<cfset LvarFileType[i] = "T">
		<cfelseif findNoCase("Date",LvarJavaType) GT 0>
			<cfset LvarFileType[i] = "D">
		<cfelseif findNoCase("[B",LvarJavaType) GT 0>
			<cfset LvarFileType[i] = "B">
		<cfelse>
			<cfset LvarFileType[i] = "S">
		</cfif>
	</cfloop>
	
	<cf_templatecss>
	<cfsetting enablecfoutputonly="yes">
	<cfoutput><table class="PlistaTable" cellpadding="2" cellspacing="0"><tr></cfoutput>
	<cfloop index="i" from="1" to="#arrayLen(LvarCols)#">
		<cfif LvarFileType[i] EQ "N">
			<cfoutput><td class="tituloListas" align="right"><b>#LvarCols[i]#</b></td></cfoutput>
		<cfelseif LvarFileType[i] EQ "T">
			<cfoutput><td class="tituloListas" align="center"><b>#LvarCols[i]#</b></td></cfoutput>
		<cfelseif LvarFileType[i] EQ "D">
			<cfoutput><td class="tituloListas" align="center"><b>#LvarCols[i]#</b></td></cfoutput>
		<cfelse>
			<cfoutput><td class="tituloListas" align="left"><b>#LvarCols[i]#</b></td></cfoutput>
		</cfif>
	</cfloop>
	<cfoutput></tr></cfoutput>
	
	<cfset listapar="listaPar">
	<cfloop query="LvarQuery">
		<cfoutput><tr></cfoutput>
		<cfloop index="i" from="1" to="#arrayLen(LvarCols)#">
			<cfset LvarDato = evaluate("LvarQuery.#LvarCols[i]#")>
			<cfif Not IsDefined('LvarDato')>
				<cfset LvarDato = ''>
			</cfif>
			<cfif LvarFileType[i] EQ "N">
				<cfoutput><td class="#listapar#" align="right" x:num># HTMLEditFormat( Trim(LvarDato) )#</td></cfoutput>
			<cfelseif LvarFileType[i] EQ "T" And Len(LvarDato)>
				<cfoutput><td class="#listapar#" align="center" x:date>#DateFormat(LvarDato,"YYYY-MM-DD")# #TimeFormat(LvarDato,"HH:MM:SS")#</td></cfoutput>
			<cfelseif LvarFileType[i] EQ "D" And Len(LvarDato)>
				<cfoutput><td class="#listapar#" align="center" x:date>#DateFormat(LvarDato,"YYYY-MM-DD")#</td></cfoutput>
			<cfelseif LvarFileType[i] EQ "B">
				<cfoutput><td class="#listapar#" align="center"><b>[BINARIO]</b></td></cfoutput>
			<cfelse>
				<cfif LvarFileType[i] EQ "S">
					<cfset LvarDato = replace(LvarDato,"&aacute;","á","ALL")>
					<cfset LvarDato = replace(LvarDato,"&eacute;","é","ALL")>
					<cfset LvarDato = replace(LvarDato,"&iacute;","í","ALL")>
					<cfset LvarDato = replace(LvarDato,"&oacute;","ó","ALL")>
					<cfset LvarDato = replace(LvarDato,"&uacute;","ú","ALL")>
					<cfset LvarDato = replace(LvarDato,"&nacute;","ñ","ALL")>
				</cfif>
				<cfoutput><td class="#listapar#" align="left" x:str>#HTMLEditFormat(Trim(LvarDato))#</td></cfoutput>
			</cfif>
		</cfloop>
		<cfoutput></tr></cfoutput>
		<cfif listapar EQ "listaPar">
			<cfset listapar="listaNon">
		<cfelse>
			<cfset listapar="listaPar">
		</cfif>
	</cfloop>
	<cfoutput></table></cfoutput>
</cffunction>