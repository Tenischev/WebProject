<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">
    <title>Вход - The Lists</title>
</head>
<body>
    <table style="height: 100%; border-spacing: 0; width: 100%; border-collapse: collapse;">
        <tr style="width: 100%; height: 10%;">
            <td style="padding: 0; width: 100%; vertical-align: top;">
                <div id="header">
                    <a class="title link" href="/" title="The Lists">The Lists</a>
                </div>
            </td>
        </tr>
        <tr style="width: 100%;">
            <td style="padding: 0; vertical-align: bottom;">
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
    <form class="box login_form" method="post">
        <span class="text">{message}</span>
        <input type="hidden" name="auth" value="yes">
        <input placeholder="Логин" type="text" name="nick" maxlength="15" autofocus><br>
        <input placeholder="Пароль" type="password" name="pass" maxlength="15">
        <span class="button"><input type="submit" value="Вход" class="super_button"></span>
    </form>
</body>
</html>
