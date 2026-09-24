<?php
include 'connection1.php'; 
		
		
		if(isset($_GET['id'])){
			$aid = $_GET['id'];
			$sql = "update legel_acts set status=0 where id = $aid";
			$result = $conn->query($sql);
			if($result == true){
				/* echo "record updated successfully"; */
				header("location:view_act.php");
			}
			else{
					echo"sql error".$conn->error;
			}
		}
		$conn->close();
?>