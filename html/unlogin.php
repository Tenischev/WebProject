<?php
define('TheListsProject', true);
include 'settings.php';

session_destroy();
$is_logged = false;
header('Location: index.php');
?>
