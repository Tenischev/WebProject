<?php
@ob_start ();
@ob_implicit_flush ( 0 );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );

include 'templateLoader.php';


$message = "Тут какаяdsadsadsadasdas-нибудь фигня\r\nsdasdas\r\n";


$tpl->load('test.tpl');
$tpl->set('{message}', $message);
$tpl->set('{info}','Hello world');
$tpl->compile();
?>
