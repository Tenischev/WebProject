<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){

} else {
    header('Location: index.php');
}
?>