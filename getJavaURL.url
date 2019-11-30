import requests
from bs4 import BeautifulSoup

res = requests.get("https://cloud.google.com/appengine/docs/standard/java/download#java_linux")
#print(res.text)
soup = BeautifulSoup(res.text,'html.parser')
abbr=soup.select('abbr')
a=abbr[0].select('a')
print(a[0].get('href'))
