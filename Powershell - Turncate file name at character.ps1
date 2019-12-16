$sourceFolder = Get-ChildItem "C:\Pictures" #Sourcefolder
$character = ' '                            #Charachter on which to turncate filename
$destinationFolder = "C\Destination"

ForEach($file in $sourceFolder)
{
    $extension = $file.Extension
    $name =  $file.Basename.Substring(0,$file.basename.IndexOf($character))  #Turncate name by $character
    $file | Copy-Item -destination "$Destination\$name$extension"  #Copy image with new Filename
}
