<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.User"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="model.entity.Role"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%
	User u = (User) request.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Actualizar Usuario</title>
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
	<form method="post" action="/users/update">
		<h1>Usuario</h1>

		<fieldset>
			<input type="text" name="id" value="<%=u.getId()%>" hidden> <label>Correo
				del usuario</label> <input type="email" name="email"
				value="<%=u.getEmail()%>" placeholder="Email " required> <label>Fecha
				de creacion</label> <input type="date"
				value="<%=sdf.format(u.getCreated())%>" name="created" required>

			<label>Fecha de nacimiento</label> <input type="date"
				value="<%=sdf.format(u.getBirth())%>" name="birth" required>

			<%
				if (u.isStatus() == true) {
			%>
			<input type="radio" name="status" value="true" checked>Activo<br>
			<input type="radio" name="status" value="false">Inactivo<br>
			<%
				} else {
			%>
			<input type="radio" name="status" value="true">Activo<br>
			<input type="radio" name="status" value="false" checked>Inactivo<br>
			<%
				}
			%>

			<%
				if (u.isGender() == true) {
			%>
			<input type="radio" name="gender" value="true" checked>Hombre<br>
			<input type="radio" name="gender" value="false">Mujer<br>
			<%
				} else {
			%>
			<input type="radio" name="gender" value="true">Hombre<br>
			<input type="radio" name="gender" value="false" checked>Mujer<br>
			<%
				}
			%>

			<%
				List<Role> roles = (List<Role>) request.getAttribute("roles");
			%>
			<%
				if (roles.size() > 0) {
			%>
			<select name="IdRole">
				<%
					for (int i = 0; i < roles.size(); i++) {
				%>
				<%
					Role r = (Role) roles.get(i);
				%>
				<option value="<%=String.valueOf(r.getId())%>">
					<%=r.getName()%>
				</option>
				<%
					}
				%>
			</select>
			<%
				} else {
			%>
			<label>IdRole:</label> <input type="text" name="IdRole"
				placeholder="aun no hay rol" readonly required><br>
			<%
				}
			%>
		</fieldset>
		<button type="submit">Registrar usuario</button>
	</form>
	</body>
</html>
