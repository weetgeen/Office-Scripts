$FOLDER1  = (Get-ChildItem -Recurse -path C:\ -Filter *.PDF).BaseName     #Apply filter if needed
$FOLDER2  = (Get-ChildItem -Recurse -path C:\ -Filter *.PDF).BaseName


$result1 = Compare-Object -ReferenceObject $FOLDER1 -DifferenceObject $FOLDER2  #Compare filenames and print differnce
