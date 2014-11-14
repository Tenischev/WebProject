<?php
define('TheListsProject', true);
include 'settings.php';

if (!$is_logged){
    $form = "<form method="post">
                 <input type="hidden" name="register" value="yes">
                 Логин: <input type="text" name="nick" maxlength="15"><br>
                 Почта: <input type="text" name="email" maxlength="15"><br>
                 Пароль: <input type="password" name="pass" maxlength="15"><br>
                 Подтверждение: <input type="password" name="pass_confirm" maxlength="15"><br>
                 <input type="submit" style="border: solid 1px #5F5F5F; background: #E5E5E5; padding: 5px; border-radius: 5px" value="Зарегистрироваться">
               </form>";
    $message = "";
    if (isset($_POST['register'])){
        $login = $_POST['nick'];
        $pass = $_POST['pass'];
        $mail = $_POST['email'];
        $pass_confirm = $_POST['pass_confirm'];
        if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $login ) ) $login = "";
        if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $pass ) ) $pass = "";
        if ($login == "" or $pass == ""){
            $message = "Введен недопустимый логин или пароль";
        } else {
            if (preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\/|\\\|\&\~\*\{\+]/", $mail )) $mail = "";
            if ($mail == ""){
                $message = "Введен недопустимый email";
            } else {
                if ($pass != $pass_confirm){
                    $message = "Пароли не совпадают";
                } else {
                    $query = mysql_query("SELECT * FROM list_users WHERE name = '$login';");
                    if (mysql_num_rows($query) >= 1){
                        $message = "Пользователь с таким логином, уже существует";
                    } else {
                        $query = mysql_query("SELECT * FROM list_users WHERE mail = '$mail';");
                        if (mysql_num_rows($query) >= 1){
                            $message = "Данная почта уже используется";
                        } else {
                            $message = "На вашу почту отправлено письмо с кодом подтверждения";
                            $form = "";
                            $salt = rand(204214, 251352);
                            $code = "192.168.1.37/register.php?name=$login&key=".base64_encode($login.$salt.$pass.time().$mail);
                            mysql_query("INSERT INTO list_users (id, name, password, mail, key, premium, icon) VALUES (NULL, '$login', '$pass', '$mail', '$salt', '0', 'default.png');");
                            mail($mail, "Подтверждение регистрации", "Вы получили это письмо, потому что данный почтовый адрес был указан при регистрации на сайте TheLists\n\nДля подтверждения регистрации перейдите по ссылке: $code");
                        }
                        mysql_free_result($query);
                    }
                }
            }
        }
    }
    if (isset($_GET['key'])){
        $key = $_GET['key'];
        $login = $_GET['login'];
        $key = base64_decode($key);
        $login_two = substr($key, 0, strlen($login));
        if ($login != $login_two){
            $message = "Неверный код";
            $form = "";
        } else {
            $salt = substr($key, strlen($login), 6);
            $query = mysql_query("SELECT * FROM list_users WHERE name = '$login' AND key = '$salt';");
            if (mysql_num_rows($query) == 1){
                $row = mysql_fetch_array($query);
                $pass = $row['password'];
                $mail = $row['mail'];
                $pass_confirm = substr($key, strlen($login) + 6, strlen($pass));
                $lasttime = substr($key, strlen($login) + 6 + strlen($pass), 10);
                $mail_confirm = substr($key, strlen($login) + 16 + strlen($pass));
                if ($pass_confirm != $pass or $mail_confirm != $mail){
                    $message = "Неверный код";
                    $form = "";
                } else {
                    mysql_query("UPDATE list_users SET key = '' WHERE name = '$login' AND password = '$pass' AND mail = '$mail';");
                    $message = "Регистрация успешно завершена";
                    $_SESSION['logged'] = true;
                    $_SESSION['id_in_table'] = $row['id'];
                }
            }
            mysql_free_result($query);
        }
    }
    $tpl->load('register.tpl');
    $tpl->set('{message}', $message);
    $tpl->set('{form}', $form);
    $tpl->compile();

} else {
    header('Location: profile.php');
}
?>