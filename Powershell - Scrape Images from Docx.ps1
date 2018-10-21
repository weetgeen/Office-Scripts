 
    #Filepath to document folder
    [String]$WordFilePath = "I:\word\*"  #source
    [String]$DestinationFolder = "I:\img\" #Destination
    $fileType = "*docx"  #Filter to only include Docx files
   
	#Gets every file from the folder
    Get-ChildItem -path $WordFilePath -include $fileType |
    foreach-object {
    $WordFilePath = ($_.fullname) #Redefine variable to only one specific word document
    [String]$fname = [System.IO.Path]::GetFileNameWithoutExtension($WordFilePath) #Defines the filename from the path
     #Destination folder for the picture with the same filename as the word document
    Add-Type -Assembly “system.io.compression.filesystem”
	
    #copy and renaming the docx to .zip file
	$ZipFile = "I:\zip\" + [guid]::NewGuid().ToString() + ".zip"
	Copy-Item -Path $WordFilePath -Destination $ZipFile

	#extract all files to a temporary  folder
	$TmpFolder = "I:\tmp\" + [guid]::NewGuid().ToString()
	[io.compression.zipfile]::ExtractToDirectory($ZipFile, $TmpFolder)

	#copy image files from media folder to destination and rename to DestinationFolder
    $image = Get-ChildItem "$TmpFolder\word\media\image1.*"
    $extension = [System.IO.Path]::GetExtension($image)
	Get-ChildItem "$TmpFolder\word\media\image1.*" -recurse | Copy-Item -destination "$($DestinationFolder)$($fname)$($extension)"

}

