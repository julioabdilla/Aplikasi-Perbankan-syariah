<?php 
require_once config.php;

function db_hubungan_darurat_get_id($nama,$hub,$alamat)
{
	$result=mysql_fetch_assoc(mysql_query("select ID_Hubungan_Darurat from Hubungan_Darurat where Nama=$nama and Hubungan=$hub and Alamat=$alamat"));
	if(!$result) die ("error: ".mysql_error());
	$id=$result("ID_Hubungan_Darurat");
	if(mysql_num_rows($result)>0)
	{
		$id=$result["ID_Alamat"];
		cls();
		return $id;
	}
	else
	{
		cls();
		return null;
	}
}

function db_alamat_insert($nama,$hub,$alamat)
{
	mysql_query("insert into Hubungan_Darurat(Nama, Hubungan, Alamat) values ($nama,$hub,$alamat)");
}
?>
