<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
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
</body>
</html>