<!DOCTYPE html>
<html>
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
                <input type="text" class="search" maxlength="15" name="find" style="font-size: 16px;  height: 100%" placeholder="Поиск">
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
    <form class="box" method="post">
        <span class="text">{message}</span>
        {form}
    </form>
</body>
</html>
