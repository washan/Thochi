<cf_header title="Error 500" Overview="Error Inesperado" icon="fa fa-frown-o">
	<cf_startBox title="Descripción de Error">
		<cfdump var="#request.Error.Exception.Additional#" 	  label="Explicacion">
		<cfdump var="#request.Error.Exception.Cause.Message#" label="Error">
		<cfdump var="#request.Error.Exception.Cause.TagContext#" label="Lugar">
	<cf_endBox>
<cf_footer>