import mysql.connector
import re
import glob
import csv
import sys
import random

emailNum = int(sys.argv[1])
	
# initialize sender and reciever

senderNameList = []
senderEmailList = []
with open('people.csv') as csvfile:
	reader = csv.reader(csvfile, delimiter=',')
	next(reader)
	for row in reader:
		senderNameList.append(row[0])
		senderEmailList.append(row[1])

senderNameListLen = len(senderNameList)
senderEmailListLen = len(senderEmailList)
receiver = 'Xingyu'


# read lists

endingList = []
firstSentenceList = []
lastSentenceList = []
greetingList = []
helperList = []
favoriteList = []
worksList = []

with open('unnecessary/ending.csv') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		endingList.append(row[0])
with open('unnecessary/firstSentence.csv') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		firstSentenceList.append(row[0])
with open('unnecessary/greeting.csv') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		greetingList.append(row[0])
with open('unnecessary/helper.csv') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		helperList.append(row[0])
with open('unnecessary/lastSentence.csv') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		lastSentenceList.append(row[0])

with open('necessary/favorite.csv') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		favoriteList.append(''.join(row))
with open('necessary/works.csv') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		worksList.append(''.join(row))


# read keyword table
favoriteKeywordList = []
worksKeywordList = []
path = 'favorite/*.csv'
files = glob.glob(path)
for f in files:
	with open(f) as csvfile:
		reader = csv.reader(csvfile)
		for line in reader:
			favoriteKeywordList.append(line[0])
path = 'works/*.csv'
files = glob.glob(path)
for f in files:
	with open(f) as csvfile:
		reader = csv.reader(csvfile)
		for line in reader:
			worksKeywordList.append(line)


# start generating

for i in range(0, emailNum):

	# decide which email emailType
	# random greeting, favorite, list, enron

	emailTypeList = ['greeting','favorite','list','enron']
	emailTypeListLen = len(emailTypeList)
	r = random.randint(0,(emailTypeListLen-1)*2-1)
	if r > (emailTypeListLen - 1):
		emailTypeId = emailTypeListLen -1
	else:
		emailTypeId = r
	emailType = emailTypeList[emailTypeId]

	
	# get sender and email

	r = random.randint(0, senderNameListLen-1)
	senderName = senderNameList[r]
	senderEmail = senderEmailList[r]
	print('email emailType is {}, and sender:{},{}'.format(emailType, senderName,senderEmail))

	
	# initialize:

	greetingId = -1
	firstSentenceId = -1
	lastSentenceId = -1
	endingId = -1
	enronId = -1
	
	greetingPart = ''
	firstSentencePart = ''
	lastSentencePart = ''
	endingPart = ''
	helperPartList = ['','']
	favoritePartList = []
	worksPart = ''
	enronPart = ''
	receiverPart = ''
	senderPart = ''
        
        subject = ''
	
	# create helperList

	for j in range(0, 3):
		helperPartList.append(helperList[random.randint(0, len(helperList)-1)])
	emailType = 'enron'
	# cases
	
	if emailType == 'greeting':
		greetingId = random.randint(0, len(greetingList)-1)
		firstSentenceId = random.randint(0, len(firstSentenceList)-1)
		lastSentenceId = random.randint(0, len(lastSentenceList)-1)
		endingId = random.randint(0,len(endingList)-1)
	elif emailType == 'favorite':
		greetingId = random.randint(-len(greetingList), len(greetingList)-1)
		firstSentenceId = random.randint(-len(firstSentenceList), len(firstSentenceList)-1)
		lastSentenceId = random.randint(-len(lastSentenceList), len(lastSentenceList)-1)
		endingId = random.randint(-len(endingList),len(endingList)-1)
		for j in range(0, random.randint(1,3)):
			favoritePartList.append(favoriteList[random.randint(0,len(favoriteList)-1)])
	elif emailType == 'list':
		greetingId = random.randint(-len(greetingList), len(greetingList)-1)
		firstSentenceId = random.randint(-len(firstSentenceList), len(firstSentenceList)-1)
		lastSentenceId = random.randint(-len(lastSentenceList), len(lastSentenceList)-1)
		endingId = random.randint(-len(endingList),len(endingList)-1)
		worksPart = worksList[random.randint(0, len(worksList)-1)] +'\n' + ('\n'.join(worksKeywordList[random.randint(0,len(worksKeywordList)-1)]))
	elif emailType == 'enron':
		enronBody = ''
		# connect to mysql
		enron = mysql.connector.connect(user='root', database='enron',password='HandWall8')
		cursor = enron.cursor()
		msgId = random.randint(1, 255636)
                query = ("select body from bodies where messageid = {}".format(msgId))
                cursor.execute(query)
                for any in cursor:
			para = re.split(r"\n\n", any[0])
			size = len(para)
			for k in range(0,size):
				if len(para[k]) > 8 and re.match('\-\-',para[k])==None:
					para[k].replace('enron','company')
					para[k].replace('Enron','company')
					para[k].replace('ENRON','company')
                        		enronBody = enronBody + '\n' + para[k]
                query = ('select subject from messages where messageid = {}'.format(msgId))
                cursor.execute(query)
                for any in cursor:
                        subject = any[0]
		enron.commit()
		cursor.close()
		enron.close()

	
	# combine components to make emails
	if random.randint(0,1):
		receiverPart = receiver	+ ','
	if greetingId >= 0:
		greetingPart = greetingList[greetingId] + ','
	if firstSentenceId >= 0:
		firstSentencePart = firstSentenceList[firstSentenceId] + '.'
	if lastSentenceId >= 0:
		lastSentencePart = lastSentenceList[lastSentenceId] + '.'
	if endingId >= 0:
		endingPart = endingList[endingId]
	if random.randint(0,1):
		senderPart = senderNameList[random.randint(0,senderNameListLen-1)]
	 
	
	emailBody = ''
	if emailType <> 'enron':
		emailBody = emailBody + (greetingPart + ' ' + receiverPart + '\n')
		emailBody = emailBody + (firstSentencePart + '\n')
		emailBody = emailBody + helperPartList[random.randint(0,4)] + ' '
		for j in range(0, len(favoritePartList)):
			emailBody = emailBody + (favoritePartList[j].format(favoriteKeywordList[random.randint(0,len(favoriteKeywordList)-1)])) + '.'
			emailBody = emailBody + helperPartList[random.randint(0,4)] + ' '
		emailBody = emailBody + (worksPart)
		emailBody = emailBody + helperPartList[random.randint(0,4)] + ' '
		emailBody = emailBody + (lastSentencePart + '\n')
		emailBody = emailBody + (endingPart + '\n')
		emailBody = emailBody + (senderPart)
	else:
		emailBody = enronBody


	# put all emails in a file
	outfile = open('output/'+str(i)+'__'+senderEmail,'w')
	outfile.write(emailBody)
        outfile = open('outputsubjects/'+str(i)+'subject','w')
        outfile.write(subject)
		
