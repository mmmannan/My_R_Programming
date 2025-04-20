require(readxl)       # readxl package is needed to read excel file
# read_excel function is used to read excel file  
# read_excel function is available in readxl package
# without declaring readxl package, you can't use read_excel function
my_data <- read_excel("Friends.xlsx")   
View(my_data)

my_data %>% 
  select(Name,Sex,Height) %>% 
  mutate(feet = Height * 3.281) %>% 
  mutate(inch = (feet%%1) * 12)
  
  
  