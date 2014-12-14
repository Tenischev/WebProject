<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <title>Создание нового списка - The Lists</title>
</head>
<body>
    <table style="height: 100%; border-spacing: 0; width: 100%; border-collapse: collapse;">
        <tr style="width: 100%; height: 100%;">
            <td style="padding: 0; vertical-align: top;">
                <div id="header">
                    <a class="title link" href="/" title="The Lists">The Lists</a>
                    <span class="search"><form action="search.php">
                        <input class="inputtext" type="search" maxlength="15" name="find" placeholder="Поиск">
                    </form></span>
                    <ul id="profile_settings">
                        <li class="semi-header"><a href="/profile.php">
                            <img src="avatar/{profile_avatar}" width="24" height="24">
                            {profile_name}
                        </a></li>
                        <li id="settings"><a class="tools" href="/setting.php"></a></li>
                        <li id="logout"><a class="power" href="/unlogin.php"></a></li>
                    </ul>
                </div>
                <form method="post">
                    <div class="edit_box">
                        <table style="width: 100%; border-spacing: 1;">
                            <tr style="width: 100%;">
                                <td style="width: 90%; padding: 0">
                                    <input type="text" autofocus required name="name" maxlength="15" placeholder="Название списка" tabindex="1" style="font-size: 22px; width: 95%">
                                </td>
                                <td style="width: 5%; padding: 0; vertical-align: baseline;" class="type_list" align="center">
                                    <input type="radio" id="fradio" name="type_list" value="mark" hidden checked>
                                    <label for="fradio" class="marked_list"></label>
                                </td>
                                <td style="width: 5%; padding: 0; vertical-align: baseline;" class="type_list" align="center">
                                    <input type="radio" id="sradio" name="type_list" value="number" hidden>
                                    <label for="sradio" class="numbered_list"></label>
                                </td>
                            </tr>
                        </table>
                        <hr>
                        <textarea name="text" rows="25" cols="10" required placeholder="Поле для ввода списка" tabindex="2"></textarea>
                        <hr>
                        <table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
                            <tr style="width: 100%;">
                                <td style="width: 50%; padding: 0">
                                    <label>
                                        <input type="checkbox" tabindex="3" name="public">
                                        Сделать публичным
                                    </label>
                                </td>
                                <td style="width: 50%; padding: 0" align="right">
                                    <input type="submit" name="create" tabindex="4" value="Создать" style="margin: 0" class="super_button">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </td>
        </tr>
        <tr>
            <td style="padding: 0;">
                <footer>
                    <center>
                        <ul>
                            <li><a href="sitemap.xml">Карта сайта</a></li>
                            <li><a href="about.html">О нас</a></li>
                            <li>Все права наши © 2014</li>
                        </ul>
                    </center>
                </footer>
            </td>
        </tr>
    </table>
</body>
</html>