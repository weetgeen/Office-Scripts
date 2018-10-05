$sourceFolder = Get-ChildItem "C:\Pictures" #Sourcefolder
$character = ' '                            #Charachter on which to turncate filename
$destinationFolder = "C\Destination"

ForEach($foto in $sourceFolder)
{
    $extension = $foto.Extension

    $name =  $foto.Basename.Substring(0,$foto.basename.IndexOf($character))  #Turncate name by $character


    $foto | Copy-Item -destination "$Destination\$name$extension"  #Copy image with new Filename
   
   
    

}
