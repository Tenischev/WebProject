<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){
    if (isset($_POST['create'])){
        $nameList = htmlspecialchars($_POST['name']);
        $textList = mysql_real_escape_string(htmlspecialchars($_POST['text']));
        $publicList = 0;
        if (isset($_POST['public'])){
            $publicList = 1;
        }
        mysql_query("INSERT INTO lists (id, user, name, text, public) VALUES (NULL, '$user_name', '$nameList', '$textList', '$publicList');");
        header('Location: profile.php');
    } else {
        $tpl->load('create.tpl');
        $tpl->set('{profile_name}', $user_name);
        $tpl->compile();
    }
} else {
    header('Location: index.php');
}
?>