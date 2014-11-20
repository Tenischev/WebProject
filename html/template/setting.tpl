<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
<div id="header">
    <a class="title link" href="/" title="The Lists">The Lists</a>
        <span class="search">
            <form action="search.php">
                <input class="inputtext" type="search" maxlength="15" name="find" placeholder="Поиск">
            </form>
        </span>
    <ul id="profile_settings">
        <li id="profile"><a href="/profile.php">
            <img src="avatar/{profile_avatar}" width="24" height="24">
            {profile_name}
        </a></li>
        <li id="settings"><a class="tools"href="/setting.php"></a></li>
        <li id="logout"><a class="power" href="/unlogin.php"></a></li>
    </ul>
</div>
<div style="width: 100%; height: 100%; padding: 50px; position: relative; float: center;">
    <form method="post">
        Смена пароля
        Старый пароль:<input type="password" maxlength="20" name="old_pass">
        Новый пароль:<input type="password" maxlength="20" name="new_pass">
        <input type="submit" name="change_pass" value="Сменить">
    </form>
    <form method="post" enctype="multipart/form-data">
        Загрузить аватар(меньше 5КБ и 512*512)
        <input type="hidden" name="MAX_FILE_SIZE" value="5120" >
        <input type="file" accept="image/jpeg,image/png" name="filename">
        <input type="submit" name="load_icon" value="Загрузить">
    </form>
</div>
{message}
</body>
</html>