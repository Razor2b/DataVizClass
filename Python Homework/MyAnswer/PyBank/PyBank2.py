import sys
import os.path
from datetime import datetime
from dateutil import relativedelta
import csv
from statistics import mean

#set up program to save all the print results to a file
orig_stdout = sys.stdout
f = open("BudgetData.txt",'w')
sys.stdout = f 

#create lists to hold data from cvs file
PLdates = []
PLnums = []

#read data from cvs file and put in lists
with open('budget_data.csv') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    for row in csvreader:
        PLdates.append(row[0])
        PLnums.append(row[1])

#remove column headers from each list               
del PLnums[0]
del PLdates[0]                  

#convert string in list PLnums to numbers in new list PLnumbers
PLnumbers = [float(i) for i in PLnums]


#establish a max & min with first date in list
maxPLdate = PLdates[1]
minPLdate = PLdates[1]


#loop through list of dates to find the max and min dates
for PLdate in PLdates:
    if datetime.strptime(PLdate,"%b-%y") > datetime.strptime(maxPLdate,"%b-%y"):
        maxPLdate = PLdate
    elif datetime.strptime(PLdate,"%b-%y") < datetime.strptime(minPLdate,"%b-%y"):
        minPLdate = PLdate



#find the difference between the max and min dates
difference = relativedelta.relativedelta(datetime.strptime(maxPLdate,"%b-%y"), datetime.strptime(minPLdate,"%b-%y"))
years = difference.years

#total months = months in first year + months in whole years + months in last year
months = (13-(datetime.strptime(minPLdate,"%b-%y")).month) + ((years-1) *12) + (datetime.strptime(maxPLdate,"%b-%y")).month

#find the total profit/loss by summing up the numbers in the list PLnumbers
NetPL = sum(PLnumbers)

#find the average profit/loss by deviding the total profit/loss by the number of items in the list using the length function
AvgPL = NetPL/len(PLnumbers)

#get thte index for the maximum profit/loss
maxpos = PLnumbers.index(max(PLnumbers))
minpos = PLnumbers.index(min(PLnumbers))

print("  ")
print("Financial Analysis")
print("----------------------------")  
print("Total months: ", months)
print("Total: $" + format(NetPL, ',.2f'))
print("Avg Change: $"+ format(AvgPL, ',.2f'))
#use the index to get the date out of the list of dates and the amount out of the list of numbers
print("Greatest Increase in Profits: ", PLdates[maxpos],"( $"+ format(PLnumbers[maxpos], ',.2f')+ ")")
print("Greatest Decrease in Profits: ", PLdates[minpos], "( $"+ format(PLnumbers[minpos], ',.2f')+ ")")

#close file where data is saved
sys.stdout = orig_stdout
f.close()

#close file to screen
file = open("BudgetData.txt",'r')
file_contents = file.read()
print(file_contents)
file.close()

