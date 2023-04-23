Angående den version af processing der bruges kan excel knappen godt skabe lidt problematik. Programmet er lige nu opsat til processing 4.2,
men tidligere versioner af programmet kan have problemer.

Hvis der bruges en tidligere version af processing end 4.2 og den ikke vil loade data fra .csv filen ind eller at excel knappen ikke fungerer korrekt skal 
der fjernes et "!" fra koden.

Under data tabben i createTimeplan() funktionen skal:
if(!ExcelButton.Power){
loadData();
println("loadingData...");
}
omskrives til:
if(ExcelButton.Power){
loadData();
println("loadingData...");
}

Vi har opdaget en forskel i hvordan programmet kører i processing version 4.2 og version 4.0.1

-Nicklas Vagner