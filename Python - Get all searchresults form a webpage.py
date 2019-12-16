"""
Tihs script loops through all search results of a website that shows the search result per page.
"""

import pandas as pd
import addDB

#url with site specific search query that returns a JSON with search results
results = pd.read_json('https://www.rtvnoord.nl/zoeken/Results?query=quiz+groningen')
pages = results.pageCount[0]      #Amount of pages site gives as return

#url after which page numbers can be appended
url = 'https://www.rtvnoord.nl/zoeken/Results?query=quiz+groningen&page='

resultList = []                         #Initialize list

#Loop over every page
for page in range(1, pages + 1):
    jsonurl = url + str(page)           #Append pagenumber to url
    response = pd.read_json(jsonurl)    #Read JSON
    for r in response.searchResults:    #Loop over every element in JSON
        resultList.append(r)                #Append results

for result in resultList:
    #Preform action with each result
    print(result)