<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">
    <title>Настройки - The Lists</title>
</head>
<body>
    <table style="height: 100%; border-spacing: 0; width: 100%; border-collapse: collapse;">
        <tr style="width: 100%; height: 10%;">
            <td style="padding: 0; width: 100%; vertical-align: top;">
                <div id="header">
                    <a class="title link" href="/" title="The Lists">The Lists</a>
                    <span class="search">
                        <form action="search.php">
                            <input class="inputtext" type="search" maxlength="15" name="find" placeholder="Поиск">
                        </form>
                    </span>
                    <ul id="profile_settings">
                        <li class="semi-header">
                            <a href="/profile.php">
                                <img src="avatar/{profile_avatar}" width="24" height="24">
                                {profile_name}
                            </a>
                        </li>
                        <li id="settings"><a class="tools" href="/setting.php"></a></li>
                        <li id="logout"><a class="power" href="/unlogin.php"></a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr style="width: 100%; height: 90%;">
            <td style="padding: 0; width: 100%; vertical-align: top;">
                <form class="rectangle login_form" method="post">
                    <span class="text">Смена пароля</span>
                    <table align="center">
                        <tr>
                            <td>
                                <input placeholder="Старый пароль" type="password" maxlength="15" name="old_pass">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input placeholder="Новый пароль" type="password" maxlength="15" name="new_pass">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 100%">
                                <input type="submit" name="change_pass" value="Сменить" class="super_button">
                            </td>
                        </tr>
                    </table>
                </form>

                <form class="rectangle login_form" method="post" enctype="multipart/form-data">
                    <span class="text">Загрузить аватар(меньше 5КБ и 512*512)</span>
                    <input type="hidden" name="MAX_FILE_SIZE" value="5120" >
                    <span class="button" style="padding: 0 0 5px 0"><input type="file" maxlength="5" accept="image/jpeg,image/png" name="filename" class="file_loader">
                    <input type="submit" name="load_icon" value="Загрузить" class="super_button"></span>
                </form>
            </td>
        </tr>
        <tr style="width: 100%;">
            <td style="padding: 0; vertical-align: bottom;">
                <footer>
                    <center>Все права наши</center>
                </footer>
            </td>
        </tr>
    </table>
    {message}
</body>
</html>