##Script to download all files in a given nestor link to a given location on your drive.

#Requires chromedriver

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.keys import Keys
import time
import pyautogui
import requests

#Supply name and password here or be prompted
name = ''
password = ''

#Provide full filepath
save_files_to = [LOCALFOLDER1,LOCALFOLDER2]
urls = [URL1,URL2]

#driver = webdriver.Chrome('C:\\Users\\user\\Documents\\Downloads\\chromedriver.exe')  #windows
driver = webdriver.Chrome('/usr/local/bin/chromedriver') #MAC


driver.get(urls[0])
#Prompt for credentials if not provided
if(name == ''):
    name = input('Enter studentnumber:')
if(password == ''):
    password = input('Enter password:')



wait = WebDriverWait(driver = driver, timeout = 900)

username_box = driver.find_element_by_id('name-field')
password_box = driver.find_element_by_id('password-field')

username_box.send_keys(name)
password_box.send_keys(password)
password_box.send_keys(Keys.RETURN)

time.sleep(1)

elems = driver.find_elements_by_xpath("//a[contains(@href, 'bbcswebdav')]")


for elem in elems:
    pdf_url =  elem.get_attribute("href")
    pdf_name = elem.get_attribute('innerText')
    print(pdf_name)
    pdf_download = requests.post(pdf_url, auth=(name, password))
    with open(save_files_to[0] + pdf_name, 'wb') as f:
        f.write(pdf_download.content)

    

for url in range(len(urls)):

    if url == 0:#Skip the first url
        print('passing')
        pass

    driver.get(urls[url])
    time.sleep(1)

    elems = driver.find_elements_by_xpath("//a[contains(@href, 'bbcswebdav')]")


    for elem in elems:
        pdf_url =  elem.get_attribute("href")
        pdf_name = elem.get_attribute('innerText')
        print(pdf_name)
        pdf_download = requests.post(pdf_url, auth=(name, password))
        with open(save_files_to[url] + pdf_name, 'wb') as f:
            f.write(pdf_download.content)
