<cf_header title="Customs Tags Thochi" Overview="Tutoria de Programación en Thochi" icon="fa fa-users">
	<cf_startBox title="Customs Tags del Thochi">
		<div class="row">
        	<div class="col-md-12">
				<cf_tabs>
					<cf_tab id="A" name="A" active="true"><cfset SinTags()></cf_tab>
					<cf_tab id="B" name="B"><cfset TagsB()></cf_tab>
					<cf_tab id="C" name="C"><cfset SinTags()></cf_tab>
					<cf_tab id="D" name="D"><cfset TagsD()></cf_tab>
					<cf_tab id="E" name="E"><cfset SinTags()></cf_tab>
					<cf_tab id="F" name="F"><cfset SinTags()></cf_tab>
					<cf_tab id="G" name="G"><cfset SinTags()></cf_tab>
					<cf_tab id="H" name="H"><cfset SinTags()></cf_tab>
					<cf_tab id="I" name="I"><cfset SinTags()></cf_tab>
					<cf_tab id="J" name="J"><cfset SinTags()></cf_tab>
					<cf_tab id="K" name="K"><cfset SinTags()></cf_tab>
					<cf_tab id="L" name="L"><cfset SinTags()></cf_tab>
					<cf_tab id="M" name="M"><cfset SinTags()></cf_tab>
					<cf_tab id="N" name="N"><cfset SinTags()></cf_tab>
					<cf_tab id="O" name="O"><cfset SinTags()></cf_tab>
					<cf_tab id="P" name="P"><cfset SinTags()></cf_tab>
					<cf_tab id="Q" name="Q"><cfset SinTags()></cf_tab>
					<cf_tab id="R" name="R"><cfset SinTags()></cf_tab>
					<cf_tab id="S" name="S"><cfset SinTags()></cf_tab>
					<cf_tab id="T" name="T"><cfset SinTags()></cf_tab>
					<cf_tab id="U" name="U"><cfset SinTags()></cf_tab>
					<cf_tab id="V" name="V"><cfset SinTags()></cf_tab>
					<cf_tab id="W" name="W"><cfset SinTags()></cf_tab>
					<cf_tab id="X" name="X"><cfset SinTags()></cf_tab>
					<cf_tab id="Y" name="Y"><cfset SinTags()></cf_tab>
					<cf_tab id="Z" name="Z"><cfset SinTags()></cf_tab>
				</cf_tabs>	
			</div>
		</div>
	<cf_endBox>
<cf_footer>
<cffunction name="SinTags">
	<div class="panel-group" id="accordion1">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#TagA1">Sin Tags </a>
				</h4>
			</div>
			<div id="TagA1" class="panel-collapse in" style="height: auto;">
				<div class="panel-body">
					No hay Tags que mostrar
				</div>
			</div>
		</div>			
	</div>
</cffunction>
<cffunction name="TagsB">
	<div class="panel-group" id="accordion1">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#breadcrumb">breadcrumb</a>
				</h4>
			</div>
			<div id="breadcrumb" class="panel-collapse in" style="height: auto;">
				<div class="panel-body">
					Descripcion del Tag breadcrumb
				</div>
			</div>
		</div>			
		</div>
	</cffunction>
<cffunction name="TagsD">
	<div class="panel-group" id="accordion1">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#dump">dump</a>
				</h4>
			</div>
			<div id="dump" class="panel-collapse collapse in" style="height: auto;">
				<div class="panel-body">
					Descripcion del Tag dump
				</div>
			</div>
			<div class="panel-heading">
				<h4 class="panel-title">
					<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" href="#dumpJava">dumpJava</a>
				</h4>
			</div>
			<div id="dumpJava" class="panel-collapse collapse">
				<div class="panel-body">
					Descripcion del Tag dumpJava
				</div>
			</div>
		</div>			
	</div>
</cffunction>