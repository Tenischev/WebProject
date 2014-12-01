<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <title>Настройки - The Lists</title>
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
            <li id="profile"><a href="/profile.php"><img src="avatar/{profile_avatar}" width="24" height="24">{profile_name}</a></li>
            <li id="settings"><a class="tools"href="/setting.php"></a></li>
            <li id="logout"><a class="power" href="/unlogin.php"></a></li>
        </ul>
    </div>
    <div>
        <form class="rectangle" method="post">                    
                <span class="text">Смена пароля</span>
            <table align="center">
                <tr>
                    <td>
                    <span class="editText">Старый пароль:</span>
                    </td>
                    <td>
                    <span class="editText"><input type="password" maxlength="20" name="old_pass"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="editText">Новый пароль:</span>
                    </td>
                    <td>
                    <span class="editText"><input type="password" maxlength="20" name="new_pass"></span>
                    </td>
                </tr>
            </table>
        </form>
        
        <form class="rectangle" method="post" enctype="multipart/form-data">
            <span class="text">Загрузить аватар(меньше 5КБ и 512*512)</span>
            <span class="editText"><input type="hidden" name="MAX_FILE_SIZE" value="5120" ></span>
            <span class="editText"><input type="file" maxlength="5" accept="image/jpeg,image/png" name="filename"></span>
            <span class="button"><input type="submit" name="load_icon" value="Загрузить"></span>
        </form>
    {message}
    </div>
</body>
</html>