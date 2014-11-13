<?php
define('TheListsProject');
include 'settings.php';

if (!$is_logged) {
	$tpl->load('main.tpl');
	$tpl->compile();
} else {
	header('Location: profile.php');
}
?>
