<?php 
require_once config.php;

function db_rekening_update($norek,$saldo,$status)
{
	mysql_query("update rekening set saldo=$saldo where No_Rekening=$norek");
	cls();
}
?>
