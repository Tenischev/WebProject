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
            <li class="semi-header"><a href="/profile.php">
                <img src="avatar/{profile_avatar}" width="24" height="24">
                {profile_name}
            </a></li>
            <li id="settings"><a class="tools" href="/setting.php"></a></li>
            <li id="logout"><a class="power" href="/unlogin.php"></a></li>
        </ul>
    </div>
    <table style="height: 100%; border-spacing: 0; width: 100%; border-collapse: collapse;">
        <tr style="width: 100%; height: 100%;">
            <td style="padding: 0;">
                <table id="profile_table" style="width: 100%;">
                    <tr>
                        <td id="td_list_of_lists">
                            <div class="list_of_lists">
                                <img src="avatar/{user_avatar}" width="24" height="24">
                                <span class="semi-header">{user_name}</span>
                                <hr>
                                <div>
                                    <dl class="left_menu">
                                        <a {href_lists} class="link" style="font-size: 19px">
                                            <dt>
                                                Списки
                                            </dt>
                                        </a>
                                        <div id="myLists" {trigger_lists}>
                                            <hr>
                                            <form action="create.php" {guest_access}>
                                                <input type="submit" value="Добавить список" class="super_button">
                                            </form>
                                            {lists}
                                            <hr>
                                        </div>
                                    </dl>
                                </div>
                                <div>
                                    <dl class="left_menu" {guest_access}>
                                        <a href="?change=bookmarks" class="link" style="font-size: 19px"><dt>Закладки</dt></a>
                                        <div id="bookMark" {trigger_bookmarks}>
                                             <hr>
                                             {bookmarks_list}
                                             <hr>
                                        </div>
                                    </dl>
                                </div>
                            </div>
                        </td>
                        <td style="height: 100%; width: 100%;  min-height: 400px">
                            <div style="height: 100%; width: 100%; padding: 5% 0;">
                                <div  id="list_view">
                                    <table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
                                        <tr style="width: 100%;">
                                            <td style="vertical-align: bottom; padding: 0; width: 80%;">
                                                <span style="font-size: 21px; color: white;">
                                                    {name_list}
                                                </span>
                                            </td>
                                            <td style="vertical-align: middle; padding: 0; width: 20%;" align="right">
                                                {buttons}
                                            </td>
                                        </tr>
                                    </table>
                                    <hr style="border-top-radius: 1em;">
                                    <span style="color: white;">
                                        {text_list}
                                    </span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding: 0;">
                <footer>
                    <center>Все права наши</center>
                </footer>
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