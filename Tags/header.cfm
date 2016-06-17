<cfparam name="Attributes.title" 	default="" />				<!---Title Page--->
<cfparam name="Attributes.Overview" default="" />				<!---Overview Page--->
<cfparam name="Attributes.icon" 	default="fa fa-file-o" />	<!---Class Icon Page--->
<!--------HEADER-------->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Sistema de Gestión Estudiantil</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<cf_includeCSS>
   	 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!-- Google Analytics -->
			<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
			
			ga('create', 'UA-79169821-1', 'auto');
			ga('send', 'pageview');
		</script>
		<!-- End Google Analytics -->
	</head>
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