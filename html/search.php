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
    $users = '';
    $lists = '';
    if ($query_users){
        if (mysql_num_rows($query_users) >= 1){
            while ($row = mysql_fetch_array($query_users)){
                $users .= "<a href='/profile.php?user=".$row['name']."'>".$row['name']."</a><br>";
            }
        }
    }
    if ($query_lists){
        if (mysql_num_rows($query_lists) >= 1){
            while ($row = mysql_fetch_array($query_lists)){
                $lists .= "<a href='/profile.php?user=".$row['user']."&id=".$row['id']."'>".$row['name']."</a><br>";
            }
        }
    }
    $tpl->load('search.tpl');
    $tpl->set('{profile_name}', $user_name);
    $tpl->set('{people}', $users);
    $tpl->set('{lists}', $lists);
    $tpl->set('{profile_avatar}', $user_icon);
    $tpl->compile();
} else {
    header('Location: index.php');
}
?>