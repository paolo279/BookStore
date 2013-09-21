<html>
<head>
<link rel = "stylesheet" href = "style.css" type = "text/css" />
</head>

<?php 
	session_start();
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
ctx.strokeText("   Risultati della ricerca",0,150);

</script>
<!--  canvas  -->

	<!--  tabella  -->
<table border="2" style="float:right; margin-right:250px; margin-top:130px;" color="#800000;">
	<tr>
		<td> <a style="margin-left:20px; margin-right:20px;"> <i> Titolo </i> </a> </td>
		<td> <a style="margin-left:20px; margin-right:20px;"> <i> Autore </i> </a> </td>
		<td> <a style="margin-left:20px; margin-right:20px;"> <i> Editore </i> </a> </td>
		<td> <a style="margin-left:20px; margin-right:20px;"> <i> ISBN </i> </a> </td>
	</tr>
	
	<?php 
	
	$conn = mysql_connect('localhost','root','');
	
	$db = mysql_select_db('book', $conn);
	
        	
      
	if($_POST["tipo"]=="autore"){
	
		$autore = $_POST['query'];
	
		$query = mysql_query("SELECT * FROM autori WHERE autoreNome = '$autore' ");
	
	
		while($q = mysql_fetch_array($query))
		{
            
            $id= $q["autoreID"];
            $query2 = mysql_query("SELECT * FROM libri WHERE autore = '$id' ");
            
            while($q = mysql_fetch_array($query2)){
              
			  $autore1;
			  $editore1;
			  
			 $query3 = mysql_query("SELECT * FROM autori WHERE autoreID = '".$q["autore"]."' ");
			while($q3 = mysql_fetch_array($query3)){
			$autore1= $q3["autoreNome"];
			}
			
			$query4 = mysql_query("SELECT * FROM editori WHERE editoreID = '".$q["editore"]."' ");
			while($q4 = mysql_fetch_array($query4)){
			$editore1= $q4["editoreNome"];
			}
                echo"<tr>
		<td> <a href='libro.php?isbn=".$q["isbn"]."' style='margin-left:20px; margin-right:20px;'>  ".$q['titolo']."  </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'> ".$autore1." </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'>  ".$editore1."  </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'> ".$q['isbn']." </a> </td>
	</tr>";
            
            
			}
	
        
		}
		
	}	
	
	if($_POST["tipo"]=="titolo"){
	
		$titolo = $_POST['query'];
	
		$query = mysql_query("SELECT * FROM libri WHERE titolo = '$titolo' ");
	
	
		while($q = mysql_fetch_array($query))
		{ 
			
			$autore1;
			  $editore1;
			  
			 $query3 = mysql_query("SELECT * FROM autori WHERE autoreID = '".$q["autore"]."' ");
			while($q3 = mysql_fetch_array($query3)){
			$autore1= $q3["autoreNome"];
			}
			
			$query4 = mysql_query("SELECT * FROM editori WHERE editoreID = '".$q["editore"]."' ");
			while($q4 = mysql_fetch_array($query4)){
			$editore1= $q4["editoreNome"];
			}
                echo"<tr>
		<td> <a href='libro.php?isbn=".$q["isbn"]."' style='margin-left:20px; margin-right:20px;'>  ".$q['titolo']."  </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'> ".$autore1." </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'>  ".$editore1."  </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'> ".$q['isbn']." </a> </td>
		</tr>";
		
		}
            
            
	}
	
	if($_POST["tipo"]=="editore"){
	
		$editore = $_POST['query'];
	
		$query = mysql_query("SELECT * FROM editori WHERE editoreNome = '$editore' ");
	
	
		while($q = mysql_fetch_array($query))
		{
            
            $id= $q["editoreID"];
            $query2 = mysql_query("SELECT * FROM libri WHERE editore = '$id' ");
            
            while($q = mysql_fetch_array($query2)){
              
               $autore1;
			  $editore1;
			  
			 $query3 = mysql_query("SELECT * FROM autori WHERE autoreID = '".$q["autore"]."' ");
			while($q3 = mysql_fetch_array($query3)){
			$autore1= $q3["autoreNome"];
			}
			
			$query4 = mysql_query("SELECT * FROM editori WHERE editoreID = '".$q["editore"]."' ");
			while($q4 = mysql_fetch_array($query4)){
			$editore1= $q4["editoreNome"];
			}
                echo"<tr>
		<td> <a href='libro.php?isbn=".$q["isbn"]."' style='margin-left:20px; margin-right:20px;'>  ".$q['titolo']."  </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'> ".$autore1." </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'>  ".$editore1."  </a> </td>
		<td> <a style='margin-left:20px; margin-right:20px;'> ".$q['isbn']." </a> </td>
	</tr>";
            
            
			}
	
        
		}
	}
	
	echo "</table>";
	
  mysql_close($conn);

 ?> 

	<!--  tabella  -->
	
</div>

</body>

</html>