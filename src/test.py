import re

text = """asfasf1234"""

occ = re.findall('[0-9]+', text )
print occ


