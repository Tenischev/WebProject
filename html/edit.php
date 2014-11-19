<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){
    if (isset($_POST['edit'])){
        if (is_numeric($_POST['id'])){
            $idList = $_POST['id'];
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
            } else {
                mysql_query("DELETE FROM bookmarks WHERE id_list = '$idList';");
            }
            mysql_query("UPDATE lists SET text = '$textList', name = '$nameList', public = '$publicList', type = '$typeList' WHERE id = '$idList' AND user = '$user_name';");
            header('Location: profile.php');
        } else {
            header('Location: index.php');
        }
    } else if (isset($_GET['id'])){
        if (is_numeric($_GET['id'])){
            $idList = $_GET['id'];
            $query = mysql_query("SELECT * FROM lists WHERE id = '$idList' AND user = '$user_name';");
            if (mysql_num_rows($query) == 1){
                $list = mysql_fetch_array($query);
                if ($list['public'] == 1){
                    $listChecked = "checked";
                } else {
                    $listChecked = "";
                }
                if ($list['type'] == 0){
                    $check_m = "checked";
                    $check_n = "";
                } else {
                    $check_n = "checked";
                    $check_m = "";
                }
                $tpl->load('edit.tpl');
                $tpl->set('{profile_name}', $user_name);
                $tpl->set('{id_list}', $idList);
                $tpl->set('{name_list}', $list['name']);
                $tpl->set('{text_list}', (htmlspecialchars($list['text'])));
                $tpl->set('{checked}', $listChecked);
                $tpl->set('{checked_mark}', $check_m);
                $tpl->set('{checked_number}', $check_n);
                $tpl->compile();
            } else {
                header('Location: index.php');
            }
        } else {
            header('Location: index.php');
        }
    } else {
        header('Location: index.php');
    }
} else {
    header('Location: index.php');
}
?>