import urllib2,re,sys

url = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
nothing = 12345

while True:
    page = urllib2.urlopen( url + str( nothing ) ).read()
    if 'Divided by two' in page:
        nothing = int(nothing)/2
    else:
        occ = re.findall('[0-9]+', page)
        if occ:
            nothing = occ[-1]
        else:
            print page
            break

# peak.html


