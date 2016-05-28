<!--- Ejecuta <cfthrow> cuando es un proceso de Interfaz --->
<!--- Ejecuta <cfabort> cuando no es un proceso de Interfaz --->
<cfparam name="Attributes.errorInterfaz" type="string">				<!--- Mensaje de Error cuando es proceso de Interfaz --->
<cfparam name="Attributes.showerror" 	 type="string" default="">	<!--- showerror cuando NO es proceso de Interfaz --->
 
<cfif isdefined("url._soinInterfaz__") AND url._soinInterfaz__ EQ url.ID>
	<cfif Attributes.errorInterfaz EQ "" AND Attributes.showerror NEQ "">
		<cfset Attributes.errorInterfaz = Attributes.showerror>
	<cfelseif Attributes.errorInterfaz EQ "">
		<cfset Attributes.errorInterfaz = "No se permite CFABORT en un proceso de Interfaz">
		<cfthrow message="#Attributes.errorInterfaz#" type="soinInterfaz">
	</cfif>
	<cfthrow message="#Attributes.errorInterfaz#">
</cfif>
<cfif Attributes.showerror NEQ "">
	<cfabort showerror="#Attributes.showerror#">
<cfelse>
	<cfabort>
</cfif>