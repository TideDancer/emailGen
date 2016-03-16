import glob
import string
import re
import random

initCnt = 5
path = 'output/*'
files = glob.glob(path)
for fi in files:
    with open(fi) as f:
        initCnt = initCnt + 1  
        tmp = string.split(fi, '__')
        email = tmp[1]
        subjectId = string.split(tmp[0], '/')
        subjectId = subjectId[1]
        with open('outputsubjects/{}subject'.format(subjectId)) as subf:
            subject = subf.read().replace("'","''")
        tmp = string.split(email, '@')
        name = string.replace(tmp[0], '.', ' ')
        year = random.randint(2014,2015)
        month = random.randint(1,12)
        day = random.randint(1,27)
        day_r = day + 1 
        hour = random.randint(1,59)
        minute = random.randint(1,59)
        second = random.randint(1,59)
        hour_r = random.randint(1,59)
        minute_r = random.randint(1,59)
        second_r = random.randint(1,59)
        body = f.read().replace("'","''")
        

        with open('sqlQuery.csv','a+') as qfile:
            qfile.write("INSERT INTO `messages` VALUES({id}, 2, 'Kirk Thunderwood', '{sender}', '{subj}', '{msg}', 'normal', '{sentdate}', '{readate}', 12, '0');\n"
                        .format(id = initCnt,
                                sender = name,
                                subj = subject,
                                msg = body,
                                sentdate = '{}-{}-{} {}:{}:{}'.format(year,month,day,hour,minute,second),
                                readate = '{}-{}-{} {}:{}:{}'.format(year,month,day_r,hour_r,minute_r,second_r),)) 
