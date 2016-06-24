<cf_header title="Mensajes" Overview="Lista de todos los mensajes" icon="fa fa-envelope">
		<div class="row">
			<div class="col-md-12">
				<div class="mail-page">
					<div class="mail-nav">
						<cfinclude template="Mail-nav.cfm">
					</div>

					<div class="mail-content" id="mail-content">
						
					</div>
				</div>
			</div>
		</div>
<cf_footer>
<!---Funcciones javascript--->
<script>
	function ShowListMail(tipo){
		$( "#mail-content" ).load( "Mail-list.cfm",function(){}).hide().fadeIn();
	}
	function ShowComposeMail(){
		$( "#mail-content" ).load( "Mail-compose.cfm",function(){}).hide().fadeIn();
	}
	ShowListMail('R');
</script>