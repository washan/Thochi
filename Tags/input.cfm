<cfparam name="valueDefault" 			default="">				 <!---Parametro interno, no enviarlo, se usa para que no se envia el valor--->
<cfparam name="Attributes.type" 		default="text" />		 <!---Tipo de Input--->
<cfparam name="Attributes.name" 		default="input1" />		 <!---Nombre del Input--->
<cfparam name="Attributes.value" 		default="valueDefault" /><!---Valor del Input, enviarlo sin Gatos (#)--->
<cfparam name="Attributes.class" 		default="form-control" /><!---Clase del Input--->
<cfparam name="Attributes.placeholder" 	default="" />			 <!---Clase del Input--->
<cfparam name="Attributes.required" 	default="true"/>		 <!---Indica si el cambio es requerido o No--->
<cfparam name="Attributes.debug" 		default="false"/>        <!---Enviar true para verificar los datos--->

<input placeholder="<cfoutput>#Attributes.placeholder#</cfoutput>" 
			  type="<cfoutput>#Attributes.type#</cfoutput>" 
	          name="<cfoutput>#Attributes.name#</cfoutput>" 
	     	    id="<cfoutput>#Attributes.name#</cfoutput>" 
	  		 class="<cfoutput>#Attributes.class#</cfoutput>" 
	         value="<cfif isdefined('#evaluate("Attributes.value")#')><cfoutput>#evaluate("Attributes.value")#</cfoutput></cfif>"
			 <cfif isdefined('Attributes.required') and Attributes.required NEQ 'false'>
			 required
			 </cfif>
			 >
<cfif Attributes.debug>
	<cfdump var="#form#">
	<cfset Attributes.DefinidoValue= isdefined('#evaluate("Attributes.value")#')>
	<cfdump var="#Attributes#">
</cfif>
