<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Kids"%>
<%
		List<Kids> niños = (List<Kids>) request.getAttribute("niños");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar Tarea</title>
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
    </div><br><br>

      <form method="post" action="/comunicados/add">
      
        <h1>Comunicados</h1>
        <fieldset>
        	<label>Tutores</label>
       		<textarea rows="4" cols="50" readonly>
			<%
			if (niños.size() > 0) {
				for (int i = 0; i < niños.size(); i++) {
				Kids p = (Kids) niños.get(i);
				%>
				<h6><%=p.getTutor() %></h6><br>
				<%
			
				}}else{
					%>
					<h6>No hay tutores en este grado</h6><br>
					<%
				}
			%>
			</textarea>
        
          <label>Asunto</label>
		  <input type="text" name="asunto" placeholder="Asunto" required >
		  
		  <label>Comunicado</label>
		  <input type="textarea" name="mensaje" placeholder="Mensaje" required>
          
    
        </fieldset>
        <button type="submit">Enviar</button>
      </form>
    </body>
</html>