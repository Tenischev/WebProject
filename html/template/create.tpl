<!DOCTYPE html>
<html style="height: 100%" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
    <div id="header">
        <ul>
            <li class="title"><a class="link" href="/" title="The Lists">The Lists</a></li>
            <li class="empty"></li>            
            <li><form action="search.php" style="width: 100%;">
                <input type="text" class="search" maxlength="15" name="find" placeholder="Поиск">
            </form></li>
            <li class="empty"></li> 
            <li><a href="/profile.php">
                <img src="avatar/{profile_avatar}" width="24" height="24">
                <span >{profile_name}</span>
            </a></li>                
            <li><a href="/setting.php"><div class="tools"></div></a></li>
            <li><a href="/unlogin.php"><div class="power"></div></a></li>
        </ul>    
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
</body>
</html>