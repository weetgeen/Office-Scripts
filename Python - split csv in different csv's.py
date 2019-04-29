#Creates a new csv when  'rowToCheckForChange' changes and writes the row to it.

import csv

inpurCSV = open("I:\\PYTHON\\file.csv")
outputDir = "I:\\PYTHON\\"

rowToCheckForChange = '3'

csv.register_dialect('myDialect',
delimiter = ';',
quoting=csv.QUOTE_NONE,
skipinitialspace=True)


def CreateCSV(fileName, outputDir):
	
	csvname =  outputDir +  fileName +".csv"
	header = ['Column 1','Column2','....']
	
	csv.register_dialect('myDialect',
	delimiter = ';',
	quoting=csv.QUOTE_NONE,
	skipinitialspace=True)

	with open(csvname, 'w') as f:
		writer = csv.writer(f, dialect='myDialect')
		writer.writerow(header)

	f.close()	

 
inputCSV = csv.reader(inputCSV, delimiter=';')
inputCSV = iter(inputCSV)
next(inputCSV) 					#Skip the header row

currentItem = ''				
 csvFile = ''
#Voor elk artikel selecteer het atikel en vul de twee kolom in in desgewenst veld
for row in inputCSV:
	 item = row[rowToCheckForChange]
	
	if( item != currentItem):
		
		if csvFile != '':        #Do not close csv for first item, as there is no csv opened yet  
			csvFile.close()
			
		currentItem = item
		fileName = item
		print('New item, creating CSV')
		print(item)
		CreateCSV(fileName,outputDir)
		csvFile = open(csvname,'a')
	
	writer = csv.writer(csvFile,  dialect='myDialect',lineterminator='\r')
	writer.writerow([item.replace('\n','') for item in artikel])
	

	
	
	
	
	
	
