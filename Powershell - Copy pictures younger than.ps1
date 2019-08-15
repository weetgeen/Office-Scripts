#Script that copy's pictures from $Folder to $Destination that are younger than $Age

$Folder  = "E:\Pictures" 
$Destination = "E:\New Pictures"
$Age = 365  #Defines age of picture in days

Get-ChildItem -Include *.png,*.jpg,*.jpeg,*.PNG -Recurse $Folder |   #for each picture in the folder $Folder
Foreach-Object{

    $Foto = $_

    If($Foto.LastWriteTime -gt (Get-Date).AddDays(-$Age))  #If picture is younger than one yaer
    {
        $FotoName = $Foto.Name
        Copy-Item $Foto.FullName "$Destination\$FotoName"  #Copy picture
        
        Write-Host "Copying: $Foto  -----------> To $Destination" #Log Proces
    }
   
}
