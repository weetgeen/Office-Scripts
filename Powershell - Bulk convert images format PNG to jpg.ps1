﻿$files = Get-ChildItem "\\fs01\UserFolders\hans\KopieDatasheetsWord\test\tojpg" -Filter *.png -file -Recurse | 
foreach-object {

$Source = $_.FullName
$test = [System.IO.Path]::GetDirectoryName($source)
$base= $_.BaseName+".jpeg"
$basedir = $test+"\"+$base
Write-Host $basedir
Add-Type -AssemblyName system.drawing
$imageFormat = "System.Drawing.Imaging.ImageFormat" -as [type]
$image = [drawing.image]::FromFile($Source)

# Create a new image
$NewImage = 
[System.Drawing.Bitmap]::new($Image.Width,$Image.Height)
$NewImage.SetResolution($Image.HorizontalResolution,$Image.VerticalResolution)

# Add graphics based on the new image
$Graphics = 
[System.Drawing.Graphics]::FromImage($NewImage)
$Graphics.Clear([System.Drawing.Color]::White) # Set the color to white
$Graphics.DrawImageUnscaled($image,0,0) # Add the contents of $image

# Now save the $NewImage instead of $image
$NewImage.Save($basedir,$imageFormat::Jpeg)} 