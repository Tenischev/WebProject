<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">    
    <title>{profile_name} - The Lists</title>
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
    <table style="height: 95%; width: 100%; border-spacing: 0; border-collapse: collapse">
        <tr style="height: 100%; width: 100%;">
            <td style="height: 100%; width: 25%; padding: 0">
                <div style="height: 100%; padding: 5px 10px; background: #E5E5E5; border-right: solid 1px black; min-width: 300px;">
                    <img src="avatar/{user_avatar}" width="24" height="24">
                   
                    <span style="font-size: 20px;">
                        {user_name}
                       <form method="post">
                        <span class="button"><input type="submit" value="Добавить список"></span>
                        </form>
                        
                    </span>
                    <hr>
                    <div>
                    <a href="javascript:collapsElement('myLists')" rel="nofollow">Мои списки</a>
                        <div id="myLists" style="display:none">
                            <span>
                                {lists}
                            </span>
                        </div>
                    
                    </div>
                    
                    <div>
                    <a href="javascript:collapsElement('bookMark')" rel="nofollow">Закладки</a>
                        <div id="bookMark" style="display:none">
                            <span>
                                {bookmarks}
                            </span>
                        </div>
                    
                    </div>
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

<script>
 function collapsElement(id){
     if (document.getElementById(id).style.display!="none"){
       document.getElementById(id).style.display='none';  
     } else {
      document.getElementById(id).style.display='';   
     }
 }
    
</script>     
    
</html>