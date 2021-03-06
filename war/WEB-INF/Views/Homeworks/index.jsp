<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Homework"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de Tareas</title>
<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  		<link type="text/css" href="../menu.css" rel="stylesheet" />
    <link type="text/css" href="../menu2.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="../slide.js" type="text/javascript"></script>
    <script src="../nav.js" type="text/javascript"></script>
    </head>
    <body>
	  <div class="grid-container">
            <div class="logo">
                <a href="../"><img id="circa" src="../circalogo.png"><h4>Santo Tomas de Aquino</h4></a>
            </div>

            <div class="login">
                <h6>
                <a href="/users/login">Log in</a>
                <a href="/users/logout">Log out</a>
                </h6>
            </div>
    </div>
    <div id="menu">
        <ul class="menu">
            <li><a href="#" class="parent"><span>Menu</span></a>
                <ul>
                    <li><a href="/kids"><span>Niños</span></a></li>
                    <li><a href="/homeworks"><span>Tareas</span></a></li>
                    <li><a href="/users"><span>Usuarios</span></a></li>
                    <li><a href="/access"><span>Accesos</span></a></li>
                    <li><a href="/resources"><span>Recursos</span></a></li>
                    <li><a href="/roles"><span>Roles</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="parent"><span>Galeria</span></a>
                <ul>
                    <li><a href="../galeriaNiños.html"><span>Misión España</span></a></li>
                    <li><a href="../galeriaNiños.html"><span>Albergue</span></a></li>
                    <li><a href="../galeriaNiños.html"><span>Niños</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
	<br>
	<br>
	<%
		List<Homework> homeworks = (List<Homework>)request.getAttribute("homeworks");
	%>
	
	
	<div class="container" style="background-color: #FFFFFF;">
		<h4>Tareas</h4>
		<%
			if (homeworks.size() > 0) {
		%>
		<ul class="list-group" id="myList">
			<%
				for (int i = 0; i < homeworks.size(); i++) {
			%>
			<%
				Homework p = (Homework) homeworks.get(i);
			%>
			<li class="list-group-item"><%=p.getTema()%> <a
				href="/homeworks/delete?id=<%=p.getId()%>"
				class="btn btn-outline-danger btn-sm RbtnMargin float-right">Delete
					</button>
			</a> <a href="/homeworks/view?id=<%=p.getId()%>"
				class="btn btn-outline-secondary btn-sm RbtnMargin float-right">View
					</button>
			</a> <a href="/homeworks/update?id=<%=p.getId()%>"
				class="btn btn-outline-info btn-sm RbtnMargin float-right">Edit
					</button>
			</a></li>
			<%
				}
			%>
			
		</ul>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myList li")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>


	<%
		}
			else{%>
				<h3>No hay tareas registradas</h3>
				<%}
	%>

</body>
</html>