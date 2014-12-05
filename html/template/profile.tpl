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
    <table id="profile_table">
        <tr>
            <td id="td_list_of_lists">
                <div class="list_of_lists">
                    <img src="avatar/{user_avatar}" width="24" height="24">
                    <span class="semi-header">{user_name}</span>
                    <hr>
                    <div>
                        <dl class="left_menu">
                            <a href="javascript:collapsElement('myLists')" rel="nofollow" class="link" style="font-size: 19px"><dt>Списки</dt></a>
                            <div id="myLists" style="display: none;">
                                <hr>
                                {lists}
                                <hr>
                            </div>
                        </dl>
                    </div>
                    <div>
                        {bookmarks}
                    </div>
                </div>
            </td>
            <td style="height: 100%; width: 100%;  min-height: 400px">
                <div style="height: 100%; width: 100%; padding: 5% 0;">
                    <div style="height: 100%; padding: 5px 10px; background: #9999E7; border: solid 1px black; min-width: 400px; min-height: 400px; margin: 0 20%; border-top-right-radius: 1.5em; box-shadow: 0px 0px 15px 5px #888888;">
                        <table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
                            <tr style="width: 100%;">
                                <td style="vertical-align: bottom; padding: 0; width: 80%;">
                                    <span style="font-size: 21px;">
                                        {name_list}
                                    </span>
                                </td>
                                <td style="vertical-align: middle; padding: 0; width: 20%;" align="right">
                                    {buttons}
                                </td>
                            </tr>
                        </table>
                        <hr style="border-top-radius: 1em;">
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