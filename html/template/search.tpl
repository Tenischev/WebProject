<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">
    <title>Поиск - The Lists</title>
</head>
<body>
    <div id="header">        
        <a class="title link" href="/" title="The Lists">The Lists</a>
        <span class="search"><form action="search.php">
            <input class="inputtext" type="search" maxlength="15" name="find" placeholder="Поиск">
        </form></span>
        <ul id="profile_settings">
            <li id="profile"><a href="/profile.php">
                <img src="avatar/{profile_avatar}" width="24" height="24">
                {profile_name}
            </a></li>                
            <li id="settings"><a class="tools"href="/setting.php"></a></li>
            <li id="logout"><a class="power" href="/unlogin.php"></a></li>
        </ul>    
    </div>
    <div style="height: 80%; width: 60%; margin: 2% 20%;  min-height: 400px; background: white; padding: 10px; border-radius: 20px;">
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