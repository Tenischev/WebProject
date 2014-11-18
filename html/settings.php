<?php
if (!defined('TheListsProject')){
    die("Hacking fail");
}

@ob_start ();
@ob_implicit_flush ( 0 );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );

$dblocal = "localhost:3306";
$dbname = "the_lists";
$dbuser = "the_lists";
$dbpass = 's6Hy21Zkf32dvbmq0';

$speccon = mysql_connect($dblocal, $dbuser, $dbpass) or die(mysql_error());
mysql_select_db($dbname, $speccon) or die(mysql_error());

session_start();

include 'templateLoader.php';

if (!isset($_SESSION['logged'])) {
	$_SESSION['logged'] = false;
}
if ($_SESSION['logged']){
    $is_logged = true;
    $user_id = $_SESSION['id_in_table'];
    $query = mysql_query("SELECT * FROM list_users WHERE id = '$user_id';");
    $user_row = mysql_fetch_array($query);
    $user_name = $user_row['name'];
    $user_icon = $user_row['icon'];
    $user_perm = $user_row['premium'];
    mysql_free_result($query);
} else {
    $is_logged = false;
}
?>