<?php 
require_once config.php;

function db_kewarganegaraan_get_id($kwrgn)
{
	$result=mysql_fetch_assoc(mysql_query("select ID_Kewarganegaraan from Kewarganegaraan where Kewarganegaraan=$kwrgn"));
	if(!$result) die ("error: ".mysql_error());
	$id=$result["ID_Kewarganegaraan"];
	cls();
	return $id;
}
?>
