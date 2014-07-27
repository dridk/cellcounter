

var keymaps = {};

//========================================================================
function loadJson(filename) {

    var txtFile = Qt.resolvedUrl(filename)
    console.debug(txtFile)
    var req = new XMLHttpRequest();
    req.open("GET", txtFile, true);
    req.send(null);
    req.onreadystatechange = function()
    {
        if (req.readyState == 4)
        {
            var data = JSON.parse(req.responseText)

            reset()
            model.clear()

            root.maxCount = data["max_count"]
//            root.title = data["title"]
            root.concentration = data["concentration"]
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
    var c = model.get(index).count
    if ( root.currentCount >= root.maxCount || root.currentCount <0){
        errorSound.play()
        return;

    }

    if ( c >= root.maxCount){
        errorSound.play()
        return;
    }


    model.set(index,{count:c + 1})
    currentCount += 1
    validSound.play()

}

//========================================================================


function decrease(index){
    console.debug("decrease")
    var c = model.get(index).count
    if ( root.currentCount > root.maxCount || root.currentCount <=0){
        errorSound.play()
        return;
    }

    if ( c <= 0 ){
        errorSound.play()
        return;
    }



model.set(index,{count:c - 1})
currentCount -= 1
validSound.play()

}
//========================================================================

function reset()
{
    for (var i=0; i<model.count; ++i)
    {
        model.get(i).count = 0

    }
    root.currentCount = 0
}
//========================================================================

function start()
{
    root.started = !root.started
    main.focus = true

}

