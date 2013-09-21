<html>
<head>
<link rel = "stylesheet" href = "style.css" type = "text/css" />
</head>

<?php 
	session_start();
	if($_SESSION['user'] == null) header('Location: login.php');
	?>

<body>
	<p class="outset">  <!-- IMMAGINE ALTEZZA MIN 400 -->
		<img src=http://www.parcoincisionigrosio.it/upload/dynamic_/14/testata-pubblicazioni.jpg width="680" height="200">
	</p>

<div id="content">
	
	<div>
			
			 <?php
       
				$conn = mysql_connect('localhost','root','');
				$db = mysql_select_db('book', $conn);
       
				$isbn = $_GET["isbn"];

		
				$query = mysql_query("SELECT * FROM libri WHERE isbn = '$isbn' ");

		while($q = mysql_fetch_array($query)){
	
			$titolo= $q["titolo"];
			$img= $q["fotoUrl"];
			
			$autore;
			$editore;
			
			
			$query2 = mysql_query("SELECT * FROM autori WHERE autoreID = '".$q["autore"]."' ");
			while($q2 = mysql_fetch_array($query2)){
			$autore= $q2["autoreNome"];
			}
			
			$query3 = mysql_query("SELECT * FROM editori WHERE editoreID = '".$q["editore"]."' ");
			while($q3 = mysql_fetch_array($query3)){
			$editore= $q3["editoreNome"];
			}
			//width='270' height='400'
			
			echo "<img src='".$q["fotoUrl"]."' alt='copertina'  style='margin-left:370; margin-right:100; margin-bottom:100' ALIGN=LEFT>
		
				<font face='Arial red' size='5' color='#800000'><b><i> Dettagli prodotto: </i></b></font>";
				
				
            echo "<p><b><br> Titolo: </b> ".$q["titolo"]." </br></p>";
            echo "<p><b> Autore: </b> ".$autore."</p>";
			echo "<p><b> Editore: </b> ".$editore." </p>";
			echo "<p><b> ISBN: </b> ".$q["isbn"]." </p>";
			echo "<p><b> Prezzo: </b> ".$q["prezzo"]." &#8364</p>";
            echo "<font face='Arial red' size='5' color='#800000'><b><i><br> Leggi l'anteprima: </br></i></b></font>
				<br><a href='".$q["anteprimaUrl"]."' target='_blank'> Clicca qui </a></br>";

	
	}
            
			
        ?>
			
			
	</div>
</div>
</body>

</html>