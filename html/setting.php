<?php
define('TheListsProject', true);
include 'settings.php';

$popMessage = '<div class="pop_message">
                   <p style="margin: 0;">{message_text}</p>
               </div>';

if ($is_logged){
    $message = '';
    $messageText = '';
    if (isset($_POST['change_pass'])){
        $passwordOld = $_POST['old_pass'];
        $passwordNew = $_POST['new_pass'];
        if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $passwordNew ) ) $passwordNew = "";
        if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $passwordOld ) ) $passwordOld = "";
        if (($passwordOld == "") or ($passwordNew == "")){
            $message = $popMessage;
            $messageText = 'Недопустимые символы';
        } else {
            $salt = '$1$kris13ha$';
            $hashed_password = crypt($passwordOld, $salt);
            $query = mysql_query("SELECT * FROM list_users WHERE name = '$user_name' AND password = '$hashed_password';");
            if ($query){
                if (mysql_num_rows($query) == 1){
                    $pass = crypt($passwordNew, $salt);
                    mysql_query("UPDATE list_users SET password = '$pass' WHERE name = '$user_name';");
                    $message = $popMessage;
                    $messageText = 'Пароль изменен';
                } else {
                    $message = $popMessage;
                    $messageText = 'Наверный пароль';
                }
                mysql_free_result($query);
            }
        }
    } else if (isset($_POST['load_icon'])){
        $max_file_size = 5*1024;
        if ($_FILES['filename']['size'] <= $max_file_size){
            if (($_FILES['filename']['type'] = "image/png") or ($_FILES['filename']['type'] = "image/jpeg")){
                if (is_uploaded_file($_FILES['filename']['tmp_name'])){
                    $nameFile = $user_name.".".substr($_FILES['filename']['type'], 6);
                    move_uploaded_file($_FILES['filename']['tmp_name'], "avatar/".$nameFile);
                    mysql_query("UPDATE list_users SET icon = '$nameFile' WHERE name = '$user_name';");
                    $message = $popMessage;
                    $messageText = 'Аватар успешно загружен';
                } else {
                    $message = $popMessage;
                    $messageText = 'Ошибка при сохранении файла';
                }
            } else {
                $message = $popMessage;
                $messageText = 'Неверный формат файла';
            }
        } else {
            $message = $popMessage;
            $messageText = 'Слишком большой размер файла';
        }
    }
    $tpl->load('setting.tpl');
    $tpl->set('{profile_avatar}', $user_icon);
    $tpl->set('{profile_name}', $user_name);
    $tpl->set('{message}', $message);
    $tpl->set('{message_text}', $messageText);
    $tpl->compile();
} else {
    header('Location: index.php');
}
?>