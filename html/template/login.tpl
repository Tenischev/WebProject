<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
    <div id="header">
        <ul>
            <li class="title"><a class="link" href="/" title="The Lists">The Lists</a></li>
        </ul>    
    </div>
    <form class="box" method="post">
        <span class="text">{message}</span>
        <input type="hidden" name="auth" value="yes">
        <span class="editText">Логин: <input type="text" name="nick" maxlength="15"></span>
        <span class="editText">Пароль: <input type="password" name="pass" maxlength="15"></span>
        <span class="button"><input type="submit" value="Вход"></span>
    </form>
</body>
</html>
