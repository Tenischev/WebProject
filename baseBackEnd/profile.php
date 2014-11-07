<?php
if ($ANTISPAM != 'superProject'){
	die('Error');
}
if ($_SESSION['logged']){
    $tpl->load('profile.tpl');
    $tpl->compile();
} else {
    $tpl->load('autherror.tpl');
    $tpl->compile();
}
?>