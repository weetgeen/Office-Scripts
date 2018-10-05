#Changes the name of Datasheets to english using the description.
#13 pdfs raken verloren dit moet nog uitgezocht


#Import the CSV
$omschrijving = Import-CSV 'I:\Datasheet 2.0\Naamsverandering\tmp\omschrijving.csv' -Delimiter ';'-Encoding utf8

$Datasheets = Get-ChildItem "I:\Datasheet 2.0\Naamsverandering\tmp\datasheet" |
foreach-object {
    $artikelcode = ($_.basename)
    Try{$artikelcode = $artikelcode.Substring(0,$artikelcode.IndexOf('-')-1)}
    Catch{Return}
    $volledigenaam = ($_.FullName)
  

#Itterate through each row in the csv sheet
$Output = ForEach($item in $omschrijving)
{
    $csvcode = $item.Artikelcode 
    $Description = $item.Omschrijving
    

 
    if ($artikelcode -eq $csvcode)  #Make sure Artikelcode 
    {  

        
       
       Try{$volledigenaam | Copy-Item -Destination "I:\Datasheet 2.0\Naamsverandering\tmp\english\$artikelcode - $Description.pdf"   #Copy original pdf to new folder with english filename
           
       }
       Catch{break}   #If the copy does not work Continue so that the pdf does not get removed
       Write-Host $artikelcode
       $volledigenaam | Remove-Item  #Remove the old PDF
       



    }
}

    



}