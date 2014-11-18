<?php
define('TheListsProject', true);
include 'settings.php';

if (!$is_logged) {
	$tpl->load('main.tpl');
	$tpl->compile();
} else {
	header('Location: profile.php');
}
?>
