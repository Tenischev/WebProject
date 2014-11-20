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
    <form method="post">
        <div style="height: 80%;  width: 60%; margin: 2% 20%;  min-height: 400px; background: #E5E5E5; border: solid 1px black; padding: 10px">
            <input type="hidden" name="id" value="{id_list}">
            <table style="width: 100%; border-spacing: 1;">
                <tr style="width: 100%;">
                    <td style="width: 90%; padding: 0">
                        <input type="text" autofocus required name="name" maxlength="15" placeholder="Название списка" value="{name_list}" tabindex="1" style="font-size: 22px; width: 95%">
                    </td>
                    <td style="width: 5%; padding: 0; vertical-align: middle;" class="type_list" align="center">
                        <input type="radio" id="fradio" name="type_list" value="mark" hidden {checked_mark}>
                        <label for="fradio" class="marked_list"></label>
                    </td>
                    <td style="width: 5%; padding: 0; vertical-align: middle;" class="type_list" align="center">
                        <input type="radio" id="sradio" name="type_list" value="number" hidden {checked_number}>
                        <label for="sradio" class="numbered_list"></label>
                    </td>
                </tr>
            </table>
            <hr>
            <textarea name="text" rows="25" cols="10" required placeholder="Поле для ввода списка" tabindex="2" style="height: 100%;  width: 100%; resize: vertical;">{text_list}</textarea>
            <hr>
            <table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
                <tr style="width: 100%;">
                    <td style="width: 50%; padding: 0">
                        <label>
                            <input type="checkbox" tabindex="3" name="public" {checked}>
                            Сделать публичным
                        </label>
                    </td>
                    <td style="width: 50%; padding: 0" align="right">
                        <input type="submit" name="edit" tabindex="4" value="Сохранить" style="margin: 0">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
</body>
</html>