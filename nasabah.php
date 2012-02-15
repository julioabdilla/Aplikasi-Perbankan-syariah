<?php
require_once config.php;

function db_nasabah_select_all()
{
	//$result=mysql_query("select * from nasabah",$connect);
	//return $result;
}

function db_nasabah_select_by_full_name($nama)
{
	//$result=mysql_fetch_assoc(mysql_query("select * from nasabah where Nama_Lengkap=$nama",$connect));
	//return $result;
}

/*function db_nasabah_insert($nama,$jenisKartuIdentitas,$nomorKartuIdentitas,$masaBerlakuKartuIdentitas,$agama,$kewarganegaraan,$alamatId,$rtId,$rwId,$kelurahanId,$kecamatanId,$kotaId,$kodeposId,$statusRmhId,$noTlpId,$faxId,$noHpId,$emailId,$alamatDom,$rtDom,$rwDom,$kelurahanDom,$kecamatanDom,$kotaDom,$kodeposDom,$statusRmhDom,$noTlpDom,$faxDom,$noHpDom,$emailDom,$ibuKandung,$namaHub,$hubunganHub,$alamatHub,$kotaHub,$kodeposHub,$notlpHub,$hpHub,$faxHub)
{
	
}*/

function db_nasabah_insert($nama, $nmr_kartu_id,$alamat,$agama,$kewarganegaraan,$ibu_kandung,$hub_darurat)
{
	mysql_query("insert into nasabah (Nama_Lengkap, Nomor_Kartu_Identitas, Alamat, Agama, Kewarganegaraan, Nama_Ibu_Kandung, Hubungan_Darurat) values ($nama, $nmr_kartu_id,$alamat,$agama,$kewarganegaraan,$ibu_kandung,$hub_darurat)");
	cls();
}
?>
