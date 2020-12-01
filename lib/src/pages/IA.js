var oracion="La #OMS mantiene su confianza en las investigaciones cientificas por el desarrollo de la #vacuna contra #COVID19";
var oracion2=[];
var oracion3="";

var limpieza=["#",".","*","-","_", "(",")",","]

var stopword=["por","las","en","la","La","el","de","su"]

for (var i = 0; i < oracion.length; i++) {

    for (var j = 0; j < limpieza.length; j++) {
        if(oracion[i]==limpieza[j]){
            oracion = oracion.replace(oracion[i],"  ");
        }
    } 
}   

oracion2=oracion.split(" ");

            
for (var i = 0; i < oracion2.length; i++) {

    for (var j = 0; j < stopword.length; j++) {
        if(oracion2[i]==stopword[j]){
            oracion2[i]=" ";
        }
    } 
      
}
oracion3=oracion2.join(" ")


document.write(oracion3.toLowerCase());



