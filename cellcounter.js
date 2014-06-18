

var keymaps = {};

//========================================================================
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
                model.set(i, {"activated":false})
                keymaps[data["elements"][i]["shortcut"].toLowerCase()] = i;
                root.currentCount += data["elements"][i]["count"]

            }
        }
    }

}

//========================================================================

function increase(index){
    console.debug("increase")
    var c = model.get(index).count
    if ( root.currentCount > root.maxCount || root.currentCount <0)
        return;

    model.set(index,{count:c + 1})
    currentCount += 1

}

//========================================================================


function decrease(index){
    console.debug("decrease")
    var c = model.get(index).count
    if ( root.currentCount > root.maxCount || root.currentCount <0)
        return;

    model.set(index,{count:c - 1})
    currentCount -= 1

}



