<?php
define('TheListsProject', true);
include 'settings.php';

if (!$is_logged)){
    $tpl->load('profile.tpl');
    $tpl->compile();
} else {
    header('Location: index.php');
}
?>