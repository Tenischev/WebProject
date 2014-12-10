<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">
    <title>Поиск - The Lists</title>
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
                <div class="rectangle" style="height: 80%; width: 60%; margin: 2% 20%;  min-height: 400px; padding: 10px;">
                    <table style="height: 100%; width: 100%; border-spacing: 0;">
                        <thead>
                            <tr>
                                <td class="semi-header white" style="border-bottom: 1px solid white;">
                                    Люди
                                </td>
                                <td class="semi-header white" style="border-bottom: 1px solid white;">
                                    Списки
                                </td>
                            </tr>
                        </thead>
                        <tbody style="height: 100%; width: 100%; vertical-align: top;">
                            <tr style="height: 100%; width: 100%;">
                                <td style="height: 100%; width: 50%; padding: 0 5px; border-right: 1px solid white;">
                                    <dl style="margin: 0;">{people}</dl>
                                </td>
                                <td style="height: 100%; width: 50%; padding: 0 5px;">
                                    <dl style="margin: 0;">{lists}</dl>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td style="padding: 0;">
                <footer>
                    <center>Все права наши</center>
                </footer>
            </td>
        </tr>
    </table>
</body>
</html>