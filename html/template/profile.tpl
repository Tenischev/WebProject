<!DOCTYPE html>
<html style="height: 100%">
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
    <table style="height: 95%; width: 100%; border-spacing: 0; border-collapse: collapse">
        <tr style="height: 100%; width: 100%;">
            <td style="height: 100%; width: 25%; padding: 0">
                <div style="height: 100%; padding: 5px 10px; background: #E5E5E5; border-right: solid 1px black; min-width: 300px;">
                    <img src="avatar/{user_avatar}" width="24" height="24">
                    <span style="font-size: 20px;">
                        {user_name}
                    </span>
                    <hr>
                    <span>
                        {lists}
                    </span>
                    {bookmarks}
                </div>
            </td>
            <td style="height: 100%; width: 70%;  min-height: 400px">
                <div style="height: 100%; width: 100%; padding: 5% 0;">
                    <div style="height: 100%; padding: 5px 10px; background: #E5E5E5; border: solid 1px black; min-width: 400px; min-height: 400px; margin: 0 20%">
                        <table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
                            <tr style="width: 100%;">
                                <td style="vertical-align: middle; padding: 0; width: 80%;">
                                    <span style="font-size: 24px;">
                                        {name_list}
                                    </span>
                                </td>
                                <td style="vertical-align: middle; padding: 0; width: 20%;" align="right">
                                    {buttons}
                                </td>
                            </tr>
                        </table>
                        <hr>
                        <span>
                            {text_list}
                        </span>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    {message}
</body>
</html>