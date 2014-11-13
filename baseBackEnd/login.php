<?php
define('TheListsProject');
include 'settings.php';

if (!$is_logged){
	if (isset($_POST['auth'])){
		$login = $_POST['nick'];
		$password = $_POST['pass'];
		if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $login ) ) $login = "";
		if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $password ) ) $password = "";
		$salt = '$2a$10$'.substr(str_replace('+', '.', base64_encode(pack('N4', mt_rand(), mt_rand(), mt_rand(),mt_rand()))), 0, 22) . '$';
		$hashed_password = crypt($password, $salt);
		$query = mysql_query("SELECT * FROM list_users WHERE name = '$login' AND password = '$hashed_password';");
		if (mysql_num_rows($query) == 1){
			$user_row = mysql_fetch_array($query);
			$_SESSION['logged'] = true;
			$_SESSION['id_in_table'] = $user_row['id'];
			mysql_free_result($query);
			header('Location: profile.php');
		} else {
			mysql_free_result($query);
			$tpl->load('login.tpl');
			$tpl->set('{message}','Ошибка авторизации, неверный логин\пароль');
			$tpl->compile();
		}
	} else {
		$tpl->load('login.tpl');
		$tpl->compile();
	}
} else {
	header('Location: profile.php');
}
?>
