<?php
//$user=$_SESSION["user"];
//$password=$_SESSION["password"];
$user="root";
$password="aaa";
$connect=mysql_connect("localhost",$user,$password);
if(!$connect) die ("error: ".mysql_error());
$db=mysql_select_db("aplikasi_perbankan_syariah",$connect);
if(!$db) die ("error: ".mysql_error());

function cls()
{
	mysql_close($connect);
}
?>
