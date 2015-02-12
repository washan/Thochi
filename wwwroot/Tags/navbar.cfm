<!--- BEGIN Navbar --->
<div id="navbar" class="navbar">
	<button type="button" class="navbar-toggle navbar-btn collapsed" data-toggle="collapse" data-target="#sidebar">
		<span class="fa fa-bars"></span>
	</button>
	<a class="navbar-brand" href="#">
		<small>
			<i class="fa fa-desktop"></i>
			TOCHI
		</small>            
	</a>

	<!--- BEGIN Navbar Buttons --->
	<ul class="nav flaty-nav pull-right">
		<!--- BEGIN Button Tasks --->
		<li class="hidden-xs">
			<a data-toggle="dropdown" class="dropdown-toggle" href="#">
				<i class="fa fa-tasks"></i>
				<span class="badge badge-warning">4</span>                    
			</a>
			<!-- BEGIN Tasks Dropdown -->
			<ul class="dropdown-navbar dropdown-menu">
				<li class="nav-header">
					<i class="fa fa-check"></i>
						4 Tareas por Completar                        
					</li>
				<li>
					<a href="#">
						<div class="clearfix">
							<span class="pull-left">Revición de notas</span>
							<span class="pull-right">75%</span>                                
						</div>

						<div class="progress progress-mini">
							<div style="width:75%" class="progress-bar progress-bar-warning"></div>
						</div>
					</a>                        
				</li>
				<li>
					<a href="#">
						<div class="clearfix">
							<span class="pull-left">Revición extraclases</span>
							<span class="pull-right">45%</span>                                
						</div>

						<div class="progress progress-mini">
							<div style="width:45%" class="progress-bar progress-bar-danger"></div>
						</div>
					</a>                        
				</li>
				<li>
					<a href="#">
						<div class="clearfix">
							<span class="pull-left">Envio de tareas</span>
							<span class="pull-right">20%</span>                                
						</div>
						<div class="progress progress-mini">
							<div style="width:20%" class="progress-bar"></div>
						</div>
					</a>                        
				</li>
				<li>
					<a href="#">
						<div class="clearfix">
							<span class="pull-left">Preparación de clase</span>
							<span class="pull-right">85%</span>                                
						</div>
						<div class="progress progress-mini progress-striped active">
							<div style="width:85%" class="progress-bar progress-bar-success"></div>
						</div>
					</a>                        
				</li>
				<li class="more">
					<a href="#">Ver Detalle</a>                        
				</li>
			</ul>
			<!--- END Tasks Dropdown --->
		</li>
		<!--- END Button Tasks --->

		<!--- BEGIN Button Notifications --->
		<li class="hidden-xs">
			<a data-toggle="dropdown" class="dropdown-toggle" href="#">
				<i class="fa fa-bell"></i>
				<span class="badge badge-important">5</span>                    
			</a>
			<!-- BEGIN Notifications Dropdown -->
			<ul class="dropdown-navbar dropdown-menu">
				<li class="nav-header">
					<i class="fa fa-warning"></i>
						5 Notificaciones                        
					</li>
				<li class="notify">
					<a href="#">
						<i class="fa fa-comment orange"></i>
						<p>Nuevos Comentarios</p>
						<span class="badge badge-warning">4</span>                            
					</a>                        
				</li>
				<li class="notify">
					<a href="#">
						<i class="fa fa-twitter blue"></i>
						<p>Nuevos trabajos enviando</p>
						<span class="badge badge-info">7</span>                            
					</a>                       
				</li>
				<li class="notify">
					<a href="#">
						<img src="<cfoutput>#Application.ROOTTEMPLATE#</cfoutput>/img/demo/avatar/avatar2.jpg" alt="Alex" />
						<p>David envio su trabajo.</p>
					</a>                        
				</li>
				<li class="notify">
					<a href="#">
						<i class="fa fa-bug pink"></i>
						<p>Nuevas Funcionalidades!</p>
					</a>                        </li>

				<li class="notify">
					<a href="#">
						<i class="fa fa-shopping-cart green"></i>
						<p>Su pago esta pendiente</p>
						<span class="badge badge-success">+10</span>                            
					</a>                        
				</li>

				<li class="more">
					<a href="#">Ver todas</a>                        
				</li>
			</ul>
			<!--- END Notifications Dropdown --->
		</li>
		<!--- END Button Notifications --->

		<!---BEGIN Button Messages--->
		<li class="hidden-xs">
			<a data-toggle="dropdown" class="dropdown-toggle" href="#">
				<i class="fa fa-envelope"></i>
				<span class="badge badge-success">3</span>                    
			</a>

			<!---BEGIN Messages Dropdown--->
			<ul class="dropdown-navbar dropdown-menu">
				<li class="nav-header">
					<i class="fa fa-comments"></i>
						3 Mensajes                        
					</li>

				<li class="msg">
					<a href="#">
						<img src="<cfoutput>#Application.ROOTTEMPLATE#</cfoutput>/img/demo/avatar/avatar3.jpg" alt="Sarah's Avatar" />
						<div>
							<span class="msg-title">Ana Maria</span>
							<span class="msg-time">
								<i class="fa fa-clock-o"></i>
								<span>Un momento</span>                                    
								</span>                                
						</div>
						<p>El Grupo Correos, conocido comúnmente como Correos, es una empresa de capital cien por cien público cuyo propietario es el Estado español.</p>
					</a>                        
				</li>
				<li class="msg">
					<a href="#">
						<img src="<cfoutput>#Application.ROOTTEMPLATE#</cfoutput>/img/demo/avatar/avatar4.jpg" alt="Emma's Avatar" />
						<div>
							<span class="msg-title">Lucia Madrigal</span>
							<span class="msg-time">
								<i class="fa fa-clock-o"></i>
								<span>2 Días</span>                                    
							</span>                                
						</div>
						<p>Estamos a tu disposición de lunes a viernes no festivos de 9 am a 5 pm...</p>
					</a>                       
				</li>
				<li class="msg">
					<a href="#">
						<img src="<cfoutput>#Application.ROOTTEMPLATE#</cfoutput>/img/demo/avatar/avatar5.jpg" alt="John's Avatar" />
						<div>
							<span class="msg-title">Pedro Arias</span>
							<span class="msg-time">
								<i class="fa fa-clock-o"></i>
								<span>8:24 PM</span>                                    </span>                                </div>
						<p>Los correos son conocidos desde la antigüedad, ora de jefes y soberanos, ora como institución oficial principalmente para profesionales eminentes...</p>
					</a>                        </li>

				<li class="more">
					<a href="#">Ver todos</a>                        
				</li>
			</ul>
			<!--- END Notifications Dropdown--->
		</li>
		<!--- END Button Messages--->

		<!---BEGIN Button User--->
		<li class="user-profile">
			<a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
				<img class="nav-user-photo" src="<cfoutput>#Application.ROOTTEMPLATE#</cfoutput>/img/demo/avatar/avatar1.jpg" alt="Penny's Photo" />
				<span class="hhh" id="user_info">
					Guadalupe                        
				</span>
				<i class="fa fa-caret-down"></i>                    
			</a>

			<!---BEGIN User Dropdown--->
			<ul class="dropdown-menu dropdown-navbar" id="user_menu">
				<li class="nav-header">
					<i class="fa fa-clock-o"></i>
						En session desde 8:45 am                        
					</li>
				<li>
					<a href="#">
						<i class="fa fa-cog"></i>
						Account Settings                            </a>                        </li>

				<li>
					<a href="#">
						<i class="fa fa-user"></i>
						Edit Profile                            </a>                        </li>

				<li>
					<a href="#">
						<i class="fa fa-question"></i>
						Help                            </a>                        </li>

				<li class="divider visible-xs"></li>

				<li class="visible-xs">
					<a href="#">
						<i class="fa fa-tasks"></i>
						Tasks
						<span class="badge badge-warning">4</span>                            </a>                        </li>
				<li class="visible-xs">
					<a href="#">
						<i class="fa fa-bell"></i>
						Notifications
						<span class="badge badge-important">8</span>                            </a>                        </li>
				<li class="visible-xs">
					<a href="#">
						<i class="fa fa-envelope"></i>
						Messages
						<span class="badge badge-success">5</span>                            </a>                        </li>

				<li class="divider"></li>

				<li>
					<a href="#">
						<i class="fa fa-off"></i>
						Logout                            </a>                        </li>
			</ul>
			<!-- BEGIN User Dropdown -->
		</li>
		<!-- END Button User -->
	</ul>
	<!-- END Navbar Buttons -->
</div>
<!-- END Navbar -->