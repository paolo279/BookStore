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
<title>Gestione Libri</title>

<link rel = "stylesheet" href = "styles.css" 
        type = "text/css" />
        
</head>
<body>

	<p class = "bigFont">Pannello Amministratore</p>
   
   <table>
  	 <tr> 
   		<td> <a href="lsLibri.jsp" style="font-weight: bold;">Gestione Libri</a></td>
   		<td> <a href="lsAutori.jsp">Gestione Autori</a></td>
   		<td> <a href="lsEditori.jsp">Gestione Editori</a></td>
   		<td> <a href="lsUtenti.jsp">Gestione Utenti</a></td>
   		<td> <a href="lsAdmin.jsp">Gestione Amministratori</a></td>
   
 	 </tr>
	</table>
	<br>
	<br>
	
	
	<form method="post" action = "add">
	<p style = "font-weight: bold"> Aggiungi un Libro: </p>
	<p> Titolo: <input type="text" name="nome" size="20">
	 <select name="autore"> 
	<% 
	
		while (results.next()) {
			%>
		<option value="<%= results.getString("autoreID") %>"> <%= results.getString("autoreNome") %> </option>
			
		<% } %>
		</select> 
		
		<select name="editore"> 
		
	<% results.close();
	
	titlesQuery = connection.prepareStatement("SELECT * FROM editori ");
	
	results = titlesQuery.executeQuery();
	
	
	while (results.next()) {
		%>
		<option value="<%= results.getString("editoreID")  %>"> <%= results.getString("editoreNome") %> </option>
			
		<% } %>
		</select> 
		
	Isbn: <input type="text" name="isbn">  
	Prezzo: <input type="text" name="prezzo" size="6"> <br>
	Foto:  <input type="text" name="fotoUrl"> <br>
	Anteprima: <input type="text" name="anteprimaUrl">
	<a> <input type="submit" name="tipo" value="Aggiungi Libro" > </a></p>
	</form>
	
	<br>
	<br>
	


	<table> 
	
		<tr>	
		
			<td> Id </td>
			<td> Isbn </td>
			<td> Titolo  </td>
			<td> Prezzo </td>
		
		</tr>


	<% 
		titlesQuery = connection.prepareStatement("SELECT * FROM libri ");
	
		results = titlesQuery.executeQuery();
		
		while (results.next()) {
		
			%>
			
		<tr>	
		
			<td> <%= results.getString("libroID") %> </td>
			<td> <%= results.getString("isbn") %> </td>
			<td> <%= results.getString("titolo") %> </td>
			<td> <%= results.getString("prezzo") %> </td>
			<td> <a href="elimina?isbn=<%= results.getString("isbn") %>"> Elimina</a>  </td>
		
		</tr>
		
		<% }
			results.close();
		%>
	</table>
	
	
<% 
	
	if(request.getAttribute("del") != null){
	%>
	
	<p style="color:red;"> Isbn: <%= request.getAttribute("del") %> eliminato ! </p>

<% }
	
	if(request.getAttribute("libro") != null){
	%>
	
	<p style="color:red;"> Libro aggiunto ! </p>

<% } %>


</body>
</html>