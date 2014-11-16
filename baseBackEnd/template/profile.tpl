<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
<div style="height: 100%">
    <div style="background: #DDDDDD; padding: 5px 10px; width: 100%; border-bottom: solid 1px black; margin: 0px; height: 5%; min-height: 26px">
        <span style="font-size: 20px;  margin: 50% 0px; height: 90%">
            The Lists
        </span>
        <span style="font-size: 16px; margin: 5% 0px 5% 22%; border: solid 1px black; border-radius: 10px; background: #E5E5E5; padding: 1px 100px; height: 90%">
            Поиск...
        </span>
            <span style="margin: 0px 0px 0px 22%; border: solid 1px black; background: #E5E5E5; padding: 2px 11px; width: 0px; height: 0px">
            </span>
            <span style="font-size: 16px; margin: 0px 0px 0px 1%; padding: 0px 100px 0px 0px; width: 200px; text-align: left;">
	            {profile_name}
            </span>
    </div>
    <table style="height: 100%; width: 100%; border-spacing: 0; border-collapse: collapse">
        <tr style="height: 100%; width: 100%;">
            <td style="height: 100%; width: 25%; padding: 0">
                <div style="height: 100%; padding: 5px 10px; background: #E5E5E5; border-right: solid 1px black">
                  <span>
                    {lists}
                  </span>
                </div>
            </td>
            <td style="height: 100%; width: 70%; padding: 5% 20%;  min-height: 400px">
                <div style="height: 100%; padding: 5px 10px; background: #E5E5E5; border: solid 1px black">
                    <span style="font-size: 20px;">
                        {name}
                    </span>
                    <hr>
                    <span>
                        {text}
                    </span>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>