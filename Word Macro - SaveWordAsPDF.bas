Attribute VB_Name = "NewMacros"
Sub SaveWordAsPDF()

'SaveWordAsPDF Macro
'Sla word document op als pdf zonder prompt vensters, automatisch in aangegeven map
'De macro kan worden toegevoegd in de Quick Access Toolbar by File>Options>Quick Access Toolbar  En dan Choose command from macros
    
    Dim sName As String
    Dim sPath As String

    With ActiveDocument
        sName = Left(.Name, InStr(.Name, ".doc") - 1)                  'Bestands naam minus extensie
        sName = sName & ".pdf"                                         'Voeg .pdf extensie toe
        sPath = "C:\Destination"  'Full Path Destination Folder 

        .ExportAsFixedFormat _
          OutputFileName:=sPath & sName, _
          ExportFormat:=wdExportFormatPDF
    End With


End Sub
