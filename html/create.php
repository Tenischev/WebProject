<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){
    if ((isset($_POST['create'])) and ($_POST['csrf_token'] == $_SESSION['csrf_token'])){
        $nameList = htmlspecialchars($_POST['name']);
        $textList = mysql_real_escape_string(htmlspecialchars($_POST['text']));
        if ($_POST['type_list'] == "mark"){
            $typeList = 0;
        } else {
            $typeList = 1;
        }
        $publicList = 0;
        if (isset($_POST['public'])){
            $publicList = 1;
        }
        mysql_query("INSERT INTO lists (id, user, name, text, public, type) VALUES (NULL, '$user_name', '$nameList', '$textList', '$publicList', '$typeList');");
        header('Location: profile.php');
    } else {
        $tpl->load('create.tpl');
        $tpl->set('{profile_name}', $user_name);
        $tpl->set('{profile_avatar}', $user_icon);
        $tpl->set('{csrf}', $_SESSION['csrf_token']);
        $tpl->compile();
    }
} else {
    header('Location: index.php');
}
?>