<cfparam name="Attributes.title" 	default="" />				<!---Title Page--->
<cfparam name="Attributes.Overview" default="" />				<!---Overview Page--->
<cfparam name="Attributes.icon" 	default="fa fa-file-o" />	<!---Class Icon Page--->
<!--------HEADER-------->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Sistema de Gestion Estudiantil</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<cf_includeCSS>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
    <body>
<!--------Setting-------->
	<cf_Setting>
<!--------NavBar-------->	
	<cf_navbar>
<!-- BEGIN Container -->
<div class="container" id="main-container">
	<cf_sidebar>
		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			<div class="page-title">
				<div>
					<h1><i class="<cfoutput>#Attributes.icon#</cfoutput>"></i> <cfoutput>#Attributes.title#</cfoutput></h1>
					<h4><cfoutput>#Attributes.Overview#</cfoutput></h4>
				</div>
			</div>
			<!-- END Page Title -->
		   <cf_Breadcrumb>            