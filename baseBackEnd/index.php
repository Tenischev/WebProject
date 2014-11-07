<?php
@ob_start ();
@ob_implicit_flush ( 0 );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );

$ANTISPAM = 'superProject';
session_start();
if (!isset($_SESSION['logged'])) {
	$_SESSION['logged'] = false;
}

include 'templateLoader.php';

if (isset($_POST['login'])){
	include 'login.php';
} else if (isset($_POST['register'])) {
	include 'register.php';
} else {
	$message = "Тут какаяdsadsadsadasdas-нибудь фигня\r\nsdasdas\r\n";
	$tpl->load('test.tpl');
	$tpl->set('{message}', $message);
	$tpl->set('{info}','Hello world');
	$tpl->compile();
}
?>
