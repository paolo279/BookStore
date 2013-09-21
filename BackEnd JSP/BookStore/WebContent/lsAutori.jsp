<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- JSP page settings --%>
<%@ 
   page language = "java" 
   import = "it.paolo.*, java.util.*, java.sql.*" 
   session = "true"
%>

<%
		if(session.getAttribute("Username") == null)
		response.sendRedirect("index.jsp");
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/book", "root", "" );

		PreparedStatement titlesQuery = connection.prepareStatement("SELECT * FROM autori ");
		
		ResultSet results = titlesQuery.executeQuery();
		
		%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestione Autori</title>

<link rel = "stylesheet" href = "styles.css" 
        type = "text/css" />
        
</head>
<body>

	<p class = "bigFont">Pannello Amministratore</p>
   
   <table>
  	 <tr> 
   		<td> <a href="lsLibri.jsp">Gestione Libri</a></td>
   		<td> <a href="lsAutori.jsp" style="font-weight: bold;">Gestione Autori</a></td>
   		<td> <a href="lsEditori.jsp">Gestione Editori</a></td>
   		<td> <a href="lsUtenti.jsp">Gestione Utenti</a></td>
   		<td> <a href="lsAdmin.jsp">Gestione Amministratori</a></td>
   
 	 </tr>
	</table>
	<br>
	<br>
	
	<form method="post" action = "add">
		<p style = "font-weight: bold"> Aggiungi un Autore: </p>
		<a> Nome: <input type="text" name="nome" size="20">
	 		<input type="submit" name="tipo" value="Aggiungi Autore" > </a>
	</form>
	
	<br>
	<br>

	<table> 
	
		<tr>	
		
			<td> Id </td>
			<td> Nome </td>
			
		
		</tr>


	<% 
		
		while (results.next()) {
		
			%>
			
		<tr>	
		
			<td> <%= results.getString("autoreID") %> </td>
			<td> <%= results.getString("autoreNome") %> </td>
			<td> <a href="elimina?autore=<%= results.getString("autoreID") %>"> Elimina</a>  </td>
		
		</tr>
		
		<% }
			results.close();
		%>
	</table>
	
	
<% 
	
	if(request.getAttribute("del") != null){
	%>
	
	<p style="color:red;"> Autore <%= request.getAttribute("del") %> eliminato ! </p>

<% 	}
	
	if(request.getAttribute("autore") != null){
	%>
	
	<p style="color:red;"> Autore aggiunto ! </p>

<% } %>


</body>
</html>