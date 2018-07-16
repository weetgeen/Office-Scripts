[ref]$SaveFormat = "microsoft.office.interop.word.WdSaveFormat" -as [type]
$word = New-Object -ComObject word.application
$word.visible = $false
$folderpath = "I:\Source\*" #select every file from the source folder with the .doc extension
$fileType = "*doc"
Get-ChildItem -path $folderpath -include $fileType |
foreach-object `
{
$path = ($_.fullname).substring(0,($_.FullName).lastindexOf("."))
"Converting $path to $fileType ..."
$doc = $word.documents.open($_.fullname)
$doc.saveas([ref] "$path.docx", [ref]$SaveFormat::wdFormatDocumentDefault)#Save as .docx with same filename

$doc.close()
}
$word.Quit()
$word = $null
[gc]::collect()
[gc]::WaitForPendingFinalizers()
