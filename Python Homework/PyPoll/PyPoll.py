import sys
import os.path
from datetime import datetime
from dateutil import relativedelta
import csv

from collections import Counter
from statistics import mean

#set up program to save all the print results to a file
orig_stdout= sys.stdout
f = open('ElectionData.txt','w')
sys.stdout = f 

WinVotes = 0

#create lists to hold data from cvs file
Votes = []
Candidates = []


#read data from cvs file and put in lists
with open('election_data.csv') as csvfile:
	csvreader = csv.reader(csvfile, delimiter=',')
	
	for row in csvreader:
		Votes.append(row[2])
	

#remove column headers from each list		
del Votes[0]
		

#find the number of votes cast
VotesCast = len(Votes)

#find unique list of candidate names
for Candidate in Votes: 
        # check if exists in list or not 
        if Candidate not in Candidates: 
            Candidates.append(Candidate)

#count the votes for a candidate
Results = Counter(Votes)

print("Election Results")
print("------------------------")
print("Total Votes: ",format(VotesCast, ',.0f'))
print("------------------------")

#get canidates vote percentage and find the winner
for Candidate in Candidates:
	print(Candidate,":", format(Results.get(Candidate)/VotesCast*100, ',.1f'),"% (",format(Results.get(Candidate), ',.0f'),")")
	
	if Results.get(Candidate)>WinVotes:
		WinVotes = Results.get(Candidate)
		WinCand = Candidate
		
print("------------------------")
print("Winner: ",WinCand)
print("------------------------")

#close file where data is saved
sys.stdout = orig_stdout
f.close()

#close saved file to screen
file = open("ElectionData.txt",'r')
file_contents = file.read()
print(file_contents)
file.close()