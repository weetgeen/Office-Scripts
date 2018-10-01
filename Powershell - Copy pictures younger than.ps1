#Script that copy's pictures from $Folder to $KalenderFoto's

$Folder  = "E:\Pictures" 
$KalenderFolder = "E:\New Pictures"
$Age = 365  #Defines age of picture in days

Get-ChildItem -Include *.png,*.jpg,*.jpeg,*.PNG -Recurse $Folder |   #for each picture in the folder $Folder
Foreach-Object{

    $Foto = $_

    If($Foto.LastWriteTime -gt (Get-Date).AddDays(-$Age))  #If picture is younger than one yaer
    {
        Copy-Item $Foto.PSPath "$KalenderFolder\$Foto"   #Copy picture
        
        Write-Host "Copying: $Foto  -----------> To Kalender 2019" #Log Proces
    }
   
}
