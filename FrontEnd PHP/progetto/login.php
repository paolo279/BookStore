<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "style.css" type = "text/css" />
</head>

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
ctx.strokeText("   Esegui il Login",0,150);

</script>
<!--  canvas  -->


<div id="pippo"; style="float:right; margin-right:450px; margin-top:130px;">
	<form action="index.php" method="post">
		Username: <input type="text" name="username" size="15" > </br>
		Password: <input type="password" name="password" size="15"> </br>
		<input type="submit" value="Entra">
	</form>
	
	<?php 

		if(IsSet($_GET["errore"])) echo"<p> Hai sbagliato password!!</p>";
	?>
	
</div>

</body>

</html>

