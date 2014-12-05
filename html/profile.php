<?php
define('TheListsProject', true);
include 'settings.php';

$editButton = '<form method="post" class="list_buttons">
                   <input type="hidden" name="id_list" value="{id_list}">
                   <input type="submit" name="edit" value=" " class="pencil">
                   <input type="submit" name="delete" value=" " class="del_button">
               </form>';
$bookmarkButton = '<form method="post" class="list_buttons">
                       <input type="hidden" name="id_list" value="{id_list}">
                       <input type="submit" name="bookmark" value=" " class="bookmark">
                   </form>';
$popMessage = '<div class="pop_message">
                   <center><p style="margin: 0;">{message_text}</p></center>
               </div>';
$createButton = '<form action="create.php">
                     <input type="submit" value="Добавить список" class="super_button">
                 </form>';
$bookmarksCollapse = '<dl class="left_menu">
                        <a href="javascript:collapsElement('."'bookMark'".')" rel="nofollow" class="link" style="font-size: 19px"><dt>Закладки</dt></a>
                        <div id="bookMark" style="display:none;">
                             <hr>
                             {bookmarks_list}
                             <hr>
                        </div>
                      </dl>';

if ($is_logged){
    if (isset($_POST['search'])){
        header('Location: search.php?find='.$_POST['search']);
    } else {
        $message = '';
        $messageText = '';
        if (isset($_GET['user'])){ // for looks page another user
            $user = $_GET['user'];
            $link = "&user=".$user;
            $lists = "";
            $button = $bookmarkButton;
            $bookmarks = "";
            if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $user ) ) $user = "";
        } else {
            $user = $user_name;
            $link = '';
            $lists = $createButton;
            $bookmarks = $bookmarksCollapse;//"<span style='font-size: 20px;'>Закладки</span><hr><span>{bookmarks_list}</span>";
            $button = $editButton;
        }
        $query = mysql_query("SELECT * FROM list_users WHERE name = '$user';");
        if (($user == "") or (mysql_num_rows($query) < 1)){
            mysql_free_result($query);
            header('Location: profile.php');
        } else {
            $row = mysql_fetch_array($query);
            $userIcon = $row['icon'];
            mysql_free_result($query);
            $idLookList = -1;
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
                    if ($query){
                        if (mysql_num_rows($query) == 1){
                            $row = mysql_fetch_array($query);
                            $teg = getTeg($row['type']);
                            $nameList = $row['name'];
                            $textList = "<".$teg."><li>".str_replace("\n", "</li><li>", str_replace("\r\n", "</li><li>", nl2br(htmlspecialchars($row['text']))))."</li></".$teg.">";
                            $number = 0;
                            $idLookList = $idList;
                        }
                        mysql_free_result($query);
                    }
                }
            }
            if ((isset($_POST['delete'])) and ($user == $user_name) and (is_numeric($_POST['id_list'])) and ($_POST['id_list'] > 0)){
                mysql_query("DELETE FROM lists WHERE id = '".$_POST['id_list']."' AND user = '$user_name';");
                mysql_query("DELETE FROM bookmarks WHERE id_list = '".$_POST['id_list']."';");
                $message = $popMessage;
                $messageText = 'Список удален!';
            }
            $flagEdit = false;
            if ((isset($_POST['edit'])) and ($user == $user_name) and (is_numeric($_POST['id_list'])) and ($_POST['id_list'] > 0)){
                $query = mysql_query("SELECT * FROM lists WHERE id = '".$_POST['id_list']."' AND user = '$user_name';");
                if ($query){
                    if (mysql_num_rows($query) == 1){
                        header('Location: edit.php?id='.$_POST['id_list']);
                        $flagEdit = true;
                    }
                    mysql_free_result($query);
                }
            }
            if (isset($_POST['bookmark']) and (is_numeric($_POST['id_list'])) and ($_POST['id_list'] > 0)){
                $query = mysql_query("SELECT * FROM lists WHERE id = '".$_POST['id_list']."';");
                if ($query){
                    if (mysql_num_rows($query) == 1){
                        $row = mysql_fetch_array($query);
                        if (!($row['user'] == $user_name)){
                            $query2 = mysql_query("SELECT * FROM bookmarks WHERE id_list = '".$_POST['id_list']."' AND user = '$user_name';");
                            if ($query2){
                                if (mysql_num_rows($query2) == 1){
                                    mysql_query("DELETE FROM bookmarks WHERE id_list = '".$_POST['id_list']."' AND user = '$user_name';");
                                    $message = $popMessage;
                                    $messageText = 'Закладка удалена';
                                } else {
                                    mysql_query("INSERT INTO bookmarks (id, id_list, user) VALUES (NULL, '".$_POST['id_list']."', '$user_name');");
                                    $message = $popMessage;
                                    $messageText = 'Закладка добавлена';
                                }
                                mysql_free_result($query2);
                            }
                        }
                    }
                    mysql_free_result($query);
                }
            }
            if (!$flagEdit){
                $i = 0;
                $query = mysql_query("SELECT * FROM lists WHERE user = '$user';");
                if ($query){
                    if (mysql_num_rows($query) >= 1){
                        while ($row = mysql_fetch_array($query)){
                            if (($row['public'] == 1) or ($user == $user_name)){
                                $nameCurList = $row['name'];
                                $teg = getTeg($row['type']);
                                $i += 1;
                                $lists = $lists.'<a href="?list='.$i.$link.'"><dd>'.$nameCurList.'</dd></a>';
                                if ($number == $i){
                                    $idLookList = $row['id'];
                                    $nameList = $nameCurList;
                                    $textList = "<".$teg."><li>".str_replace("\n", "</li><li>", str_replace("\r\n", "</li><li>", nl2br(htmlspecialchars($row['text']))))."</li></".$teg.">";
                                }
                            }
                        }
                    }
                    mysql_free_result($query);
                }
                $bookmarksList = "";
                if ($user == $user_name){
                    $query = mysql_query("SELECT * FROM bookmarks WHERE user = '$user';");
                    if ($query){
                        if (mysql_num_rows($query) >= 1){
                            while ($row = mysql_fetch_array($query)){
                                $query2 = mysql_query("SELECT * FROM lists WHERE id = '".$row['id_list']."' AND public = '1';");
                                if ($query2){
                                    if (mysql_num_rows($query2) == 1){
                                        $row2 = mysql_fetch_array($query2);
                                        $nameCurList = $row2['name'];
                                        $teg = getTeg($row2['type']);
                                        $i += 1;
                                        $bookmarksList = $bookmarksList.'<a href="?list='.$i.'"><dd>'.$nameCurList.'</dd></a>';
                                        if ($number == $i){
                                            $button = $bookmarkButton;
                                            $idLookList = $row2['id'];
                                            $nameList = $nameCurList;
                                            $textList = "<".$teg."><li>".str_replace("\n", "</li><li>", str_replace("\r\n", "</li><li>", nl2br(htmlspecialchars($row2['text']))))."</li></".$teg.">";
                                        }
                                    }
                                    mysql_free_result($query2);
                                }
                            }
                        }
                        mysql_free_result($query);
                    }
                }
                $tpl->load('profile.tpl');
                $tpl->set('{lists}', $lists);
                $tpl->set('{name_list}', $nameList);
                $tpl->set('{text_list}', $textList);
                $tpl->set('{profile_name}', $user_name);
                $tpl->set('{user_name}', $user);
                $tpl->set('{buttons}', $button);
                $tpl->set('{id_list}', $idLookList);
                $tpl->set('{bookmarks}', $bookmarks);
                $tpl->set('{bookmarks_list}', $bookmarksList);
                $tpl->set('{message}', $message);
                $tpl->set('{message_text}', $messageText);
                $tpl->set('{profile_avatar}', $user_icon);
                $tpl->set('{user_avatar}', $userIcon);
                $tpl->compile();
            }
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