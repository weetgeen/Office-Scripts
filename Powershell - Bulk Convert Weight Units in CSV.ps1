$gewichten = Get-Content I:\weights.csv
$gewichten = $gewichten.ToLower()

Foreach($gewicht in $gewichten){

if($gewicht -like '*kg*') {
Write-Host $gewicht.Substring(0,$gewicht.IndexOf('k'))}


elseif ($gewicht -like '*gram*') {
$gewicht = $gewicht.Substring(0,$gewicht.IndexOf('g'))
$gewicht = $gewicht/1000
Write-Host $gewicht }


elseif ($gewicht -like '*g*') {
$gewicht = $gewicht.Substring(0,$gewicht.IndexOf('g'))
$gewicht = $gewicht/1000
Write-Host $gewicht }

elseif ($gewicht -like '*lbs*') {
$gewicht = $gewicht.Substring(0,$gewicht.IndexOf('l'))
$gewicht = $gewicht/0.453592
Write-Host $gewicht }

else{
Write-Host $gewicht}

}