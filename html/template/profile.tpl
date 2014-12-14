<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/images.css">    
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <title>{profile_name} - The Lists</title>
    <script>
        function find(id){
            var s_el = document.getElementById(id);
            var search = s_el.value;
            var next_el = s_el.nextSibling;
            while (next_el.tagName != "HR"){
                next_el = next_el.nextSibling;
            }
            next_el = next_el.nextSibling;
            while (next_el.tagName != "HR"){
                if (next_el.tagName == "A"){
                    var dd_text = next_el.firstChild.firstChild.nodeValue;
                    if (-1 == dd_text.toLowerCase().indexOf(search.toLowerCase())){
                        next_el.style.display='none';
                    } else {
                        next_el.style.display='';
                    }
                }
                next_el = next_el.nextSibling;
            }
        }
    </script>
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
                                        <a {href_lists} class="link" style="font-size: 19px; padding-right: 210px">Списки</a>
                                        <a {guest_access} href="/create.php">
                                            <div class="plus" style="position: relative; top: 2px;" title="Создать новый список"></div>
                                        </a>
                                        <div id="myLists" {trigger_lists}>
                                            <input class="local_search" type="text" placeholder="Поиск" id="search_in_lists" maxlength="15" onkeydown="find('search_in_lists')" onkeypress="find('search_in_lists')" onkeyup="find('search_in_lists')">
                                            <hr>
                                            {lists}
                                            <hr>
                                        </div>
                                    </dl>
                                </div>
                                <div>
                                    <dl class="left_menu" {guest_access}>
                                        <a href="?change=bookmarks" class="link" style="font-size: 19px"><dt>Закладки</dt></a>
                                        <div id="bookMark" {trigger_bookmarks}>
                                            <input class="local_search" type="text" placeholder="Поиск" id="search_in_bookmarks" maxlength="15" onkeydown="find('search_in_bookmarks')" onkeypress="find('search_in_bookmarks')" onkeyup="find('search_in_bookmarks')">
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
                    <center>
                        <ul>
                            <li><a href="sitemap.xml">Карта сайта</a></li>
                            <li><a href="about.html">О нас</a></li>
                            <li>Все права наши © 2014</li>
                        </ul>
                    </center>
                </footer>
            </td>
        </tr>
    </table>
    {message}
</body>
</html>