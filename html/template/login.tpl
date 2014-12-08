<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">
    <title>Вход - The Lists</title>
</head>
<body>
    <div id="header">
        <a class="title link" href="/" title="The Lists">The Lists</a>  
    </div>
    <form class="box login_form" method="post">
        <span class="text">{message}</span>
        <input type="hidden" name="auth" value="yes">
        <input placeholder="Логин" type="text" name="nick" maxlength="15" autofocus><br>
        <input placeholder="Пароль" type="password" name="pass" maxlength="15">
        <span class="button"><input type="submit" value="Вход" class="super_button"></span>
    </form>
</body>
</html>
