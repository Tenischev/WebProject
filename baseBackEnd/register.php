<?php
define('TheListsProject');
include 'settings.php';

if (!$is_logged){

} else {
    header('Location: profile.php');
}
?>