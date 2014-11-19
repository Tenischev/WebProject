<!DOCTYPE html>
<html style="height: 100%" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
<div style="height: 100%">
    <div style="background: #DDDDDD; padding: 5px 10px; width: 100%; border-bottom: solid 1px black; margin: 0px; height: 5%; min-height: 26px">
        <span style="font-size: 20px;  margin: 50% 0px; height: 90%">
            The Lists
        </span>
        <span style="font-size: 16px; margin: 5% 0px 5% 22%; border: solid 1px black; border-radius: 10px; background: #E5E5E5; padding: 1px 100px; height: 90%">
            Поиск...
        </span>
            <span style="margin: 0px 0px 0px 22%; border: solid 1px black; background: #E5E5E5; padding: 2px 11px; width: 0px; height: 0px">
            </span>
            <span style="font-size: 16px; margin: 0px 0px 0px 1%; padding: 0px 100px 0px 0px; width: 200px; text-align: left;">
	            {profile_name}
            </span>
    </div>
    <form method="post">
        <div style="height: 80%;  width: 60%; margin: 2% 20%;  min-height: 400px; background: #E5E5E5; border: solid 1px black; padding: 10px">
            <table style="width: 100%; border-spacing: 1;">
                <tr style="width: 100%;">
                    <td style="width: 90%; padding: 0">
                        <input type="text" autofocus required name="name" maxlength="15" placeholder="Название списка" tabindex="1" style="font-size: 22px; width: 95%">
                    </td>
                    <td style="width: 5%; padding: 0; vertical-align: middle;" class="type_list" align="center">
                        <input type="radio" id="fradio" name="type_list" value="mark" hidden checked>
                        <label for="fradio" class="marked_list"></label>
                    </td>
                    <td style="width: 5%; padding: 0; vertical-align: middle;" class="type_list" align="center">
                        <input type="radio" id="sradio" name="type_list" value="number" hidden>
                        <label for="sradio" class="numbered_list"></label>
                    </td>
                </tr>
            </table>
            <hr>
            <textarea name="text" rows="25" cols="10" required placeholder="Поле для ввода списка" tabindex="2" style="height: 100%;  width: 100%; resize: vertical;"></textarea>
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
                        <input type="submit" name="create" tabindex="4" value="Создать" style="margin: 0">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
</body>
</html>