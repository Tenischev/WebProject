<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){
    $find = '';
    if (isset($_GET['find'])){
        $find = htmlspecialchars($_GET['find']);
    }
    $query_users = mysql_query("SELECT * FROM list_users WHERE name LIKE '%$find%';");
    $query_lists = mysql_query("SELECT * FROM lists WHERE name LIKE '%$find%' AND public = '1';");

} else {
    header('Location: index.php');
}
?>