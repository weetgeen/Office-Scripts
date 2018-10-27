$CSV = Import-CSV I:\TMP\names.csv -Delimiter ';'
  
$SourceFilePath       = "H:\JPG"    #Rename to absolute filepath of images
$DestinationFilePath = "H:\Output" #Rename to absolute filepath of destiantion folder


ForEach($item in $CSV)
{
    
    
    #Define variables from csv collumns 
    $Column1 = $item."Column1"   #$item.columnname
    $Column2 = $item."Column2"   #$item.columnname


    Get-ChildItem "$SourceFilePath\$Column1.jpg" | Copy-Item -destination "$DestinationFilePath\$Column2.jpg" #Copy's image from ImageFilePath to Destination and renames it to $column2


    Write-Output "Processing: $Column1 ---> $Column2" #Write process
}
