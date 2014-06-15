

var keymaps = {};


function loadJson(filename) {

    var txtFile = Qt.resolvedUrl(filename)
    var req = new XMLHttpRequest();
    req.open("GET", txtFile, true);
    req.send(null);
    req.onreadystatechange = function()
    {
        if (req.readyState == 4)
        {
            var data = JSON.parse(req.responseText)
            root.maxCount = data["max_count"]
            for ( var i=0; i<data["elements"].length; i++)
            {
                model.append(data["elements"][i])
                keymaps[data["elements"][i]["shortcut"].toLowerCase()] = i;
                root.currentCount += data["elements"][i]["count"]

            }
        }
    }

}
