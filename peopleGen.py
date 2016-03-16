import csv
import sys

peoplefile = sys.argv[1]

with open('people.csv','a+') as fi:
    fi.write('name,email\n')

with open(peoplefile) as csvf:
    reader = csv.reader(csvf)
    next(reader)
    for row in reader:
        with open('people.csv','a') as fi:
            fi.write(row[0]+','+row[2]+',\n')
