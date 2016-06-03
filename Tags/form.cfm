<cfparam name="Attributes.Name" 			default="form1"/>			<!---Nombre del Formulario--->
<cfparam name="Attributes.method" 			default="post" />			<!---Metodo de envio de la información: post=FORM, Get=URL--->
<cfparam name="Attributes.action" 			default="" />				<!---Pagina a donde se enviará la información--->
<cfparam name="Attributes.class" 			default="form-horizontal" /><!---Estilo CSS del Formulario--->

<cfswitch expression="#ThisTag.ExecutionMode#">
	<cfcase value="start">
		<form name="<cfoutput>#Attributes.Name#</cfoutput>" 
				id="<cfoutput>#Attributes.Name#</cfoutput>" 
			action="<cfoutput>#Attributes.action#</cfoutput>" 
			 class="<cfoutput>#Attributes.class#</cfoutput>"
			 method="<cfoutput>#Attributes.method#</cfoutput>">		

</cfcase>

<cfcase value="end">
	 </form>
	</cfcase>
</cfswitch>