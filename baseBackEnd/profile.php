<?php
define('TheListsProject', true);
include 'settings.php';

if ($is_logged){
    if (isset($_POST['search'])){
        header('Location: search.php?find='.$_POST['search']);
    } else {
        $user = $user_name;
        $lists = "<a href='/create.php'>Создать</a><br>";
        if (isset($_GET['user'])){ // for looks page another user
            $user = $_GET['user'];
            $link = "&user=".$user;
            $lists = "";
            if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $user ) ) $user = "";
        } else {
            $link = '';
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
            $nameList = "";
            $textList = "";
            if (isset($_GET['list'])){
                if (is_numeric($_GET['list'])){
                    $number = $_GET['list'];
                }
            }
            if (isset($_GET['id'])){
                if (is_numeric($_GET['id'])){
                    $idList = $_GET['id'];
                    $query = mysql_query("SELECT * FROM lists WHERE id = '$idList' AND user = '$user' AND public = '1';");
                    if (mysql_num_rows($query) == 1){
                        $row = mysql_fetch_array($query);
                        $nameList = $row['name'];
                        $textList = nl2br(htmlspecialchars($row['text']));
                        $number = 0;
                    }
                    mysql_free_result($query);
                }
            }
            $query = mysql_query("SELECT * FROM lists WHERE user = '$user';");
            if (mysql_num_rows($query) >= 1){
                $i = 0;
                while ($row = mysql_fetch_array($query)){
                    if (($row['public'] == 1) or ($user == $user_name)){
                        $nameCurList = $row['name'];
                        $teg = getTeg($row['type']);
                        $i += 1;
                        $lists = $lists.'<a href="?list='.$i.$link.'">'.$nameCurList.'</a><br>';
                        if ($number == $i){
                            $nameList = $nameCurList;
                            $textList = "<".$teg."><li>".str_replace("\n", "</li><li>", str_replace("\r\n", "</li><li>", nl2br(htmlspecialchars($row['text']))))."</li></".$teg.">";
                        }
                    }
                }
            }
            mysql_free_result($query);
            $tpl->load('profile.tpl');
            $tpl->set('{lists}', $lists);
            $tpl->set('{name}', $nameList);
            $tpl->set('{text}', $textList);
            $tpl->set('{profile_name}', $user_name);
            $tpl->set('{user_name}', $user);
            $tpl->compile();
        }
    }
} else {
    header('Location: index.php');
}

function getTeg($type){
    if ($type == 1){
        return "ol";
    }
    return "ul";
}
?>