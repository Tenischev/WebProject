<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){
    if (isset($_POST['change_pass'])){

    } else if (isset($_POST['load_icon'])){

    } else if (isset($_POST['change_email'])){

    }
    $tpl->load('setting.tpl');
    $tpl->set('{profile_avatar}', $user_icon);
    $tpl->set('{profile_name}', $user_name);
    $tpl->compile();
} else {
    header('Location: index.php');
}
?>