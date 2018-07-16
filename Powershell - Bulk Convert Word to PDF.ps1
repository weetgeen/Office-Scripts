$documents_path = 'C:\WORD' #Rename to absolute path of Word Documents

$word_app = New-Object -ComObject Word.Application
$word.visible = $false
# This filter will find .doc as well as .docx documents
Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {

    $document = $word_app.Documents.Open($_.FullName)

    $pdf_filename = "C:\PDF\$($_.BaseName).pdf"  #Rename path to PDF file folder

    $document.SaveAs([ref] $pdf_filename, [ref] 17)

    $document.Close()
}

$word_app.Quit()


