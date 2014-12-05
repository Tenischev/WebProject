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
    <form class="box" method="post">
        <span class="text">{message}</span>
        <input type="hidden" name="auth" value="yes">
        <span class="editText">Логин: <input type="text" name="nick" maxlength="15"></span>
        <span class="editText">Пароль: <input type="password" name="pass" maxlength="15"></span>
        <span class="button"><input type="submit" value="Вход" class="super_button"></span>
    </form>
</body>
</html>
