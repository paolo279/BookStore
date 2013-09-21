<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- books.jsp -->

<%-- JSP page settings --%>
<%@ 
   page language = "java" 
   import = "it.paolo.*, java.util.*, java.sql.*" 
   session = "true"
%>


<%
		
		if(request.getAttribute("UserName") == null)
			response.sendRedirect("index.html");


		session.setAttribute("Username", request.getAttribute("UserName"));

		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/book", "root", "" );

		PreparedStatement titlesQuery = connection.prepareStatement("SELECT * FROM autori ");
		
		ResultSet results = titlesQuery.executeQuery();
		
		%>
<!-- begin document -->
<html xmlns = "http://www.w3.org/1999/xhtml">

<head>
   <title>Book List</title>

   <link rel = "stylesheet" href = "styles.css" 
      type = "text/css" />
</head>

<body>
   <p class = "bigFont">Pannello Amministratore</p>
   
   	<p class = "bold">Benvenuto, <%= (String) session.getAttribute("Username") %></p>
   	
	<p class = "bold">Gestisci il tuo BookStore !!! </p>
   
   <table>
  	 <tr> 
   		<td> <a href="lsLibri.jsp">Gestione Libri</a></td>
   		<td> <a href="lsAutori.jsp">Gestione Autori</a></td>
   		<td> <a href="lsEditori.jsp">Gestione Editori</a></td>
   		<td> <a href="lsUtenti.jsp">Gestione Utenti</a></td>
   		<td> <a href="lsAdmin.jsp">Gestione Amministratori</a></td>
   
 	 </tr>
   
   
   
   </table>
   
</body> 

</html>

