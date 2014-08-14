cellcounter
===========

Cute Software to manual count blood cells. This application can be use in biology laboratories, particulary in hematolgy cytology. However this application is designed to be use for any counting task. Just edit a json file and open it. 


<p align="center">
  <img src="http://dridk.github.io/cellcounter/images/capture.png" alt="Cellcounter"/>
</p>



#Installation 

You can install directly the binary version of cellcounter avaible for windows and Mac. You can also compile the code. [Download Qt](http://qt-project.org/downloads) according to your platform. Open the **cell.pro** from QtCreator and compile it by clicking on the green arrow. That's all 

#Setting a template

Cellcounter use a json file to descripe what you want to count. Check the definition as show below. You can create your own json file and open it from cellcounter

    {
    "title": "Formule sanguine",
    "max_count" : 200,
    "concentration" : 1.24,
    "author": "sacha schutz",

    "elements": [

        {
         "name":"Polynucléaire neutrophile",
         "count" : 0,
         "color":"#ff6b33",
         "shortcut" : "w"
        },

        {
         "name":"Polynucléaire eosinophile",
         "count" : 0,
         "color":"#FFCA63",
         "shortcut" : "x"
        },

        {
         "name":"Polynucléaire basophile",
         "count" : 0,
         "color":"#C84FCB",
         "shortcut" : "c"
        },

        {
         "name":"Lymphocyte",
         "count" : 0,
         "color":"#905BF1",
         "shortcut" : "v"
        },

        {
         "name":"Monocyte",
         "count" : 0,
         "color":"#01C7A6",
         "shortcut" : "b"
        }

    ]
    }

*title*         : title of the template counting  
*max_count*     : maximum limit of total count  
*concentration* : this is a value where the percent obtained will be multiply  
*author*        : the author of the template   

Elements is a table which contains each items to counts. Each of them can be defined by : 

*name*          : name of elements  
*count*         : default count, by default it's zero  
*color*         : the color . Keep it nice :D  
*shortcut*      : the shortcut to perform a count.   

#Use 
#### Open a template
Just click on open 

#### Start counting 
Click on start to start counting and disable toolbar . You can also press Return to swich betwwen start and stop. 

####Stop counting
As above, click on stop or use the return shortcut. 

####Set the max count value 
The first number from the left is the maximum limit of the count. You can see in elements lists each percents. 

####Set the concentration value
The second number from the left is the concentration value. You can see in  elements lists each value. 

####Shortcuts 
You can use keyboard shortcut defined in the file and showed on your cellcounter. Press + **Key** to increase. Use **Maj + Key** to decrease.
You can also use your mouse. Click left to increase, click right to decrease.











