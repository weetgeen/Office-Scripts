
#Get the XML File
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    Filter = 'XML (*.xml)|*.xml'
}

$FileBrowser.ShowDialog()
$routeFile =  $FileBrowser.FileName
[xml]$xmlElm = Get-Content -Path $routeFile

#Convert XML to boject
$data = $xmlElm.NewDataSet.ControlPoints


#Create a new waypoint array
$waypoints = @()

$data |  ForEach-Object {
     
     $waypointName = $_.Name
     if($waypointName -contains "ControlPoints") { 
        $waypointName = '' 
     }

     ## output the result object
     $waypoints += [pscustomobject]@{
         RouteName =        $_.Routename
         '#'  =   $_.SequenceNumber        
         Name =             $waypointName
         Latitude  =        [Math]::Round(((($_.Latitude / 1) * 180) / [Math]::Pi),6)
         Longitude  =       [Math]::Round(((($_.Longitude / 1) * 180) / [Math]::Pi),6)
     }
 }
 

$TempFile = New-TemporaryFile
($waypoints | Format-Table) > $TempFile

Invoke-Item $TempFile