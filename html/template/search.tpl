<!DOCTYPE html>
<html style="height: 100%" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
<div style="height: 100%">
    <div style="background: #DDDDDD; padding: 5px 10px; width: 100%; border-bottom: solid 1px black; margin: 0px; height: 5%; min-height: 26px">
        <table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
            <tr style="width: 100%;">
                <td style="vertical-align: middle; padding: 0; width: 20%;">
                    <a class="link" href="/" title="The Lists" style="font-size: 16px">The Lists</a>
                </td>
                <td style="vertical-align: middle; padding: 0; width: 40%;">
                    <form action="search.php" style="width: 100%;">
                        <input type="text" maxlength="15" name="find" style="font-size: 16px; margin: 0; border: solid 1px black; border-radius: 10px; background: #E5E5E5; padding: 1px 10px; height: 100%" placeholder="Поиск">
                    </form>
                </td>
                <td style="vertical-align: middle; padding: 0; width: 20%;">
                    <a href="/profile.php">
                        <img src="avatar/{profile_avatar}" width="24" height="24">
                        <span style="font-size: 22px; margin: 0px 0px 0px 1%; padding: 0px 100px 0px 0px; width: 200px; text-align: left;">
                            {profile_name}
                        </span>
                    </a>
                </td>
                <td style="vertical-align: middle; padding: 0; width: 10%;">
                    <a href="/setting.php">
                        <div class="gear">
                        </div>
                    </a>
                </td>
                <td style="vertical-align: middle; padding: 0; width: 10%;">
                    <a href="/unlogin.php">
                        <div class="power"></div>
                    </a>
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 80%; width: 60%; margin: 2% 20%;  min-height: 400px; background: #E5E5E5; border: solid 1px black; padding: 10px">
        <table style="height: 100%; width: 100%;">
            <thead>
                <tr>
                    <td>
                        Люди
                    </td>
                    <td>
                        Списки
                    </td>
                </tr>
            </thead>
            <tbody style="height: 100%; width: 100%; vertical-align: top;">
                <tr style="height: 100%; width: 100%;">
                    <td style="height: 100%; width: 50%; padding: 0">
                        {people}
                    </td>
                    <td style="height: 100%; width: 50%; padding: 0">
                        {lists}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>