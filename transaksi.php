<?php 
require_once config.php;

function db_transaksi_insert($rek,$tipe)
{
	$tgl = ;
	mysql_query("insert into transaksi(Rekening_Transaksi, Tipe_Transaksi, Tanggal_Transaksi) values ($rek, $tipe, $tgl)");
	cls();
}
?>
