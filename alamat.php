<?php
require_once config.php;

function db_alamat_get_id($alamat,$rt,$rw,$kelurahan,$kecamatan,$kota,$kodePos,$statusRmh,$notTlp,$fax,$hp,$email)
{
	$result=mysql_fetch_assoc(mysql_query("select id from nasabah where Alamat=$alamat and RT=$rt and RW=$rw and Kelurahan=$kelurahan and Kecamatan=$kecamatan and Kota=$kota and Kode_Pos=$kodepos and Status_Rumah=$statusRmh and No_Telp=$noTlp and Fax=$fax and No_Hp=$hp and Email=$email"));
	if(!$result) die ("error: ".mysql_error());
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

function db_alamat_insert($alamat,$rt,$rw,$kelurahan,$kecamatan,$kota,$kodePos,$statusRmh,$notTlp,$fax,$hp,$email)
{
	mysql_query("insert into Alamat(Alamat,RT,RW,Kelurahan,Kecamatan,Kota,Kode_Pos,Status_Rumah,No_telp,Fax,No_Hp,Email) values ($alamat,$rt,$rw,$kelurahan,$kecamatan,$kota,$kodePos,$statusRmh,$notTlp,$fax,$hp,$email)");
}
?>
