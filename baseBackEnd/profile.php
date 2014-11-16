<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){
    $user = $user_name;
    if (isset($_GET['user'])){ // for looks page another user
        $user = $_GET['user'];
        if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $user ) ) $user = "";
    }
    $query = mysql_query("SELECT * FROM list_users WHERE name = '$user';");
    if (($user == "") or (mysql_num_rows($query) < 1)){
        mysql_free_result($query);
        $tpl->load('register.tpl');
        $tpl->set('{message}', 'Пользователь не найден');
        $tpl->set('{form}', '');
        $tpl->compile();
    } else {
        mysql_free_result($query);
        $number = 1;
        if (isset($_GET['list'])){
            if (is_number($_GET['list'])){
                $number = $_GET['list'];
            }
        }
        $query = mysql_query("SELECT * FROM lists WHERE user = '$user';");
        $lists = "";
        $nameList = "";
        $textList = "";
        if (mysql_num_rows($query) >= 1){
            $i = 0;
            while ($row = mysql_fetch_array($query)){
                $nameCurList = $row['name'];
                $i += 1;
                $lists = $lists.$nameCurList.'<br>';
                if ($number == $i){
                    $nameList = $nameCurList;
                    $textList = $row['text'];
                }
            }
        }
        $tpl->load('profile.tpl');
        $tpl->set('{lists}', $lists);
        $tpl->set('{name}', $nameList);
        $tpl->set('{text}', $textList);
        $tpl->set('{profile_name}', $user_name);
        $tpl->set('{user_name}', $user);
        $tpl->compile();
    }
} else {
    header('Location: index.php');
}
?>