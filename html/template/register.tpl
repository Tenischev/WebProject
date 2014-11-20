<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">
    <title>Регистрация - The Lists</title>
</head>
<body>
    <div id="header">        
        <a class="title link" href="/" title="The Lists">The Lists</a>
        <span class="search"><form action="search.php">
            <input class="inputtext" type="text" maxlength="15" name="find" placeholder="Поиск">
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
    <form class="box" method="post">
        <span class="text">{message}</span>
        {form}
    </form>
</body>
</html>
