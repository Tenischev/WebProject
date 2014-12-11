<?php
define('TheListsProject', true);
include 'settings.php';

if (!$is_logged){
    $form = '
                 <input type="hidden" name="register" value="yes">
                 <input placeholder="Желаемый логин" type="text" name="nick" maxlength="15" autofocus><br>
                 <input placeholder="Ваш email" type="email" name="email" maxlength="30"><br>
                 <input placeholder="Введите пароль" type="password" name="pass" maxlength="15"><br>
                 <input placeholder="Подтвердите пароль" type="password" name="pass_confirm" maxlength="15">
                 <span class="button"><input type="submit" value="Зарегистрироваться" class="super_button"></span>
               ';
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
                            $salt = '$1$kris13ha$';
                            $pass = crypt($pass, $salt);
                            $message = "На вашу почту отправлено письмо с кодом подтверждения";
                            $form = "";
                            $salt = rand(204214, 251352);
                            $code = "http://thelists.megaseven.ru/register.php?name=$login&key=".base64_encode($login.$salt.time().$mail);
                            mysql_query("INSERT INTO list_users (id, name, password, mail, secret_key, premium, icon) VALUES (NULL, '$login', '$pass', '$mail', '$salt', '0', 'default.png');");
                            mail($mail, "Подтверждение регистрации", "Вы получили это письмо, потому что данный почтовый адрес был указан при регистрации на сайте TheLists\n\nДля подтверждения регистрации перейдите по ссылке: $code", "From: no-reply@thelists.megaseven.ru");
                        }
                        mysql_free_result($query);
                    }
                }
            }
        }
    }
    if (isset($_GET['key'])){
        $key = $_GET['key'];
        $login = $_GET['name'];
        $key = base64_decode($key);
        $login_two = substr($key, 0, strlen($login));
        if ($login != $login_two){
            $message = "Неверный код";
            $form = "";
        } else {
            $salt = substr($key, strlen($login), 6);
            if ($salt == 0){
                $message = "Неверный код";
                $form = "";
            } else {
                $query = mysql_query("SELECT * FROM list_users WHERE name = '$login' AND secret_key = '$salt';");
                if (mysql_num_rows($query) == 1){
                    $row = mysql_fetch_array($query);
                    $mail = $row['mail'];
                    $lasttime = substr($key, strlen($login) + 6, 10);
                    $mail_confirm = substr($key, strlen($login) + 16);
                    if ($mail_confirm != $mail){
                        $message = "Неверный код";
                        $form = "";
                    } else {
                        mysql_query("UPDATE list_users SET secret_key = '' WHERE name = '$login' AND mail = '$mail';");
                        $message = 'Регистрация успешно завершена <meta http-equiv="Refresh" content="5;url=http://thelists.megaseven.ru/">';
                        $form = "";
                        $_SESSION['logged'] = true;
                        $_SESSION['id_in_table'] = $row['id'];
                    }
                }
                mysql_free_result($query);
            }
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