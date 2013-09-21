<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "style.css" type = "text/css" />
</head>

<?php 
session_start();
       
	if(IsSet($_POST['username']) && IsSet($_POST['password'])) 
	{    
			$user =	mysql_real_escape_string($_POST['username']);
			$password = mysql_real_escape_string($_POST['password']);
			
			$conn = mysql_connect('localhost','root','');
			$db = mysql_select_db('book', $conn);

		
			$query = mysql_query("SELECT * from utenti WHERE (username , password) = ('$user','$password') ");
		
		If($q = mysql_fetch_array($query)){
			
			$_SESSION['user']=$q["username"];
		
		}else  header('Location: login.php?errore');
		
	}
  
  
	if($_SESSION['user'] == null) header('Location: login.php');

?>
<body>
<p class="outset">
	<img src=http://www.parcoincisionigrosio.it/upload/dynamic_/14/testata-pubblicazioni.jpg width="680" height="200">
</p>
<div id="content">

<!--  canvas  -->
	<canvas id="myCanvas" width="300" height="500"></canvas>
<script>
var c=document.getElementById("myCanvas");
var ctx=c.getContext("2d");
ctx.font="30px Arial red";
ctx.strokeStyle = "#800000 ";
ctx.strokeText("   Esegui la ricerca",0,150);

</script>
<!--  canvas  -->

<div id="pippo"; style="float:right; margin-right:450px; margin-top:130px;">
	<form action="ricerca.php" method="post">
		<select name="tipo">
			<option value="titolo">Titolo</option>
			<option value="autore">Autore</option>
			<option value="editore">Editore</option>
		</select>
		<input type="text" name="query" size="30" > <input type="submit" value="Cerca">
	</form>
</div>

</body>

</html>

