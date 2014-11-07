<?php
if ($ANTISPAM != 'superProject'){
	die('Error');
}
if (isset($_POST['login'])){
	$login = $_POST['nick'];
	$password = $_POST['pass'];
	if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $login ) ) $login = "";
	if(preg_match( "/[\||\'|\<|\>|\[|\]|\"|\!|\?|\$|\@|\/|\\\|\&\~\*\{\+]/", $password ) ) $password = "";
	$salt = '$2a$10$'.substr(str_replace('+', '.', base64_encode(pack('N4', mt_rand(), mt_rand(), mt_rand(),mt_rand()))), 0, 22) . '$';
	$hashed_password = crypt($password, $salt);
	$query = mysql_query("SELECT * FROM users WHERE name = '$login' AND password = '$hashed_password';");
	if (mysql_num_rows($query) == 1){
		$_SESSION['logged'] = true;
		$_SESSION['name'] = $login;
		include 'profile.php';
	} else {
		$tpl->load('login.tpl');
		$tpl->set('{message}','Ошибка авторизации, неверный логин\пароль');
		$tpl->compile();
	}
} else {
	$tpl->load('login.tpl');
	$tpl->set('{message}','');
	$tpl->compile();
}
?>
