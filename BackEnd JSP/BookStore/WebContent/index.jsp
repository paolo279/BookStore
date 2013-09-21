<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
   <title>Home Page</title>

   <link rel = "stylesheet" href = "styles.css" 
      type = "text/css" />
</head>

<body>
   <p class = "bigFont">BookStore Administration</p>


   
   <!-- form per effettuare il login di amministratore -->
   	<p>Effettua il login:</p>
   	<form method="post" action="Login">
	<p>Username: <input type="text" name="UserName" size="10"> </p>
  	<p>Password: <input type="password" name="Password" size="10"></input> </p>
  	<input type="submit" value="Entra" name="Entra">
	</form>
	
	<% if(request.getAttribute("Errore") != null){
		
		session.setAttribute("Username",null); %>
		
		<p> Login Fallito ! </p>
		
	<% } %>

</body>
</html>