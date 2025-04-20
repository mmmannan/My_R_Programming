#Import data from excel in 3 ways

#way1: Environment > Import > From Excel

#way2: click on your .xlsx file in 4th quardant > Import dataset > 
#Make changes in import options if necessary > click import or copy code preview

#way3: Paste the code here

#Importing from Sheet 1/Friends
library(readxl)       #to read excel file
my_data <- read_excel("Friends.xlsx") #or , sheet = "Friends"/1)
View(my_data)


#Importing from Sheet 2/Gaps
library(readxl)
my_data <- read_excel("Friends.xlsx", sheet = 2, skip = 2)     
                                  #or sheet = "Gaps", range = "A3:E13"
View(my_data)


#Importing from Sheet 3/Positions
library(readxl)
my_data <- read_excel("Friends.xlsx", sheet = 3, range = "E4:I14")
                                  #or sheet = "Positions"
View(my_data)
