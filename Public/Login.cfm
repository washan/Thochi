<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Login - Sistema de Gestion Estudiantil</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <!--base css styles-->
<cfoutput>
			<link rel="stylesheet" href="#Application.RootTemplate#/assets/bootstrap/css/bootstrap.min.css">
			<link rel="stylesheet" href="#Application.RootTemplate#/assets/font-awesome/css/font-awesome.min.css">
	
			<!--page specific css styles-->
	
			<!--flaty css styles-->
			<link rel="stylesheet" href="#Application.RootTemplate#/css/flaty.css">
			<link rel="stylesheet" href="#Application.RootTemplate#/css/flaty-responsive.css">
	
			<link rel="shortcut icon" href="#Application.RootTemplate#/img/favicon.png">
	</cfoutput>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
    <body class="login-page">

        <!-- BEGIN Main Content -->
        <div class="login-wrapper">
            <!-- BEGIN Login Form -->
            <form id="form-login" action="<cfoutput>#CGI.script_name#?#CGI.query_string#</cfoutput>" method="post">
                <h3>Ingrese a su Cuenta</h3>
                <hr/>
                <div class="form-group">
                    <div class="controls">
                        <input type="text" placeholder="Usuario" name="j_username" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <input type="password" placeholder="Clave" name="j_password" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <label class="checkbox">
                            <input type="checkbox" value="remember" /> Recuerdame
						</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <button type="submit" class="btn btn-primary form-control">Ingresar</button>
                    </div>
                </div>
				<cfif isdefined('err') and err EQ 0>
					
				<cfelseif isdefined('err') and err EQ 1>
					<div class="form-group">
						<div class="controls">
							Tu correo no se encuentra registrado en Tochi
						</div>
					</div>
				<cfelseif isdefined('err') and err EQ 2>
					<div class="form-group">
						<div class="controls">
							Tu Clave es incorrecta
						</div>
					</div>
				<cfelse>
					<div class="form-group">
						<div class="controls">
							Error desconociado
						</div>
					</div>

				</cfif>
                <hr/>
                <p class="clearfix">
                    <a href="#" class="goto-forgot pull-left">Olvide mi contraseña</a>
                    <a href="#" class="goto-register pull-right">Inscríbete ahora</a>                
				</p>
            </form>
            <!-- END Login Form -->

            <!-- BEGIN Forgot Password Form -->
            <form id="form-forgot" action="index.html" method="get" style="display:none">
                <h3>Obtener una nueva contraseña</h3>
                <hr/>
                <div class="form-group">
                    <div class="controls">
                        <input type="text" placeholder="Correo Electronico" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <button type="submit" class="btn btn-primary form-control">Recuperar</button>
                    </div>
                </div>
                <hr/>
                <p class="clearfix">
                    <a href="#" class="goto-login pull-left">← Volver a la pagina de login</a>                </p>
            </form>
            <!-- END Forgot Password Form -->

            <!-- BEGIN Register Form -->
            <form id="form-register" action="index.html" method="get" style="display:none">
                <h3>Incripción</h3>
                <hr/>
                <div class="form-group">
                    <div class="controls">
                        <input type="text" placeholder="Correo Electronico" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <input type="text" placeholder="Usuario" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <input type="password" placeholder="Contraseña" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <input type="password" placeholder="Repita la contraseña" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <label class="checkbox">
                            <input type="checkbox" value="remember" /> Yo acepto las <a href="#">Condiciones de Uso</a>                        
						</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <button type="submit" class="btn btn-primary form-control">Sign up</button>
                    </div>
                </div>
                <hr/>
                <p class="clearfix">
                    <a href="#" class="goto-login pull-left">← Volver a la pagina de login</a>                
				</p>
            </form>
            <!-- END Register Form -->
        </div>
        <!-- END Main Content -->
<cfoutput>
        <!--basic scripts-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="#Application.RootTemplate#/assets/jquery/jquery-2.0.3.min.js"><\/script>')</script>
        <script src="#Application.RootTemplate#/assets/bootstrap/js/bootstrap.min.js"></script>
</cfoutput>
        <script type="text/javascript">
            function goToForm(form)
            {
                $('.login-wrapper > form:visible').fadeOut(500, function(){
                    $('#form-' + form).fadeIn(500);
                });
            }
            $(function() {
                $('.goto-login').click(function(){
                    goToForm('login');
                });
                $('.goto-forgot').click(function(){
                    goToForm('forgot');
                });
                $('.goto-register').click(function(){
                    goToForm('register');
                });
            });
        </script>
    </body>
</html>
