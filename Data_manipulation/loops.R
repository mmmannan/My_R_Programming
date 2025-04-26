library(tidyverse)

View(starwars)

# format of loop: working with index
for(i in 1:5){
  print(starwars$name[i])
}


starwars$height[2]

length(starwars$height)
for(i in 1:length(starwars$height)){
  print(starwars$height[i])
}


length(starwars)
starwars$mass[14]
for(i in 1:length(starwars)){
  print(starwars$mass[i])
}


## Use output of loop to create a new vector which is very much useful
# Create an empty vector
tallness <- vector(mode = "numeric", length = 5)
tallness

# Add data points to new vector from the loop
for(i in 1:5){
  tallness[i] <- starwars$height[i]/100
}

# Check new vector
tallness


## A new format of for loop: working with value
## for(x in data_set$variable_name)

for(x in starwars$name){
  print(x)
}

## Creating a break in loop
for(x in starwars$name){
  print(x)
  if(x == "Darth Vader"){
    break
  }
}

for(x in starwars$name){
  if(x == "Darth Vader"){
    break
  }
  print(x)   ## Does not print Darth Vader
}


## Skip a data point using next
for(x in starwars$name){
  if(x == "C-3PO"){
    next
  }
  print(x)
}

for(x in starwars$name){
  print(x)    ## Does not skip C-3PO
  if(x == "C-3PO"){
    next
  }
}

for(x in starwars$name){
  if(x == "C-3PO" | x == "R2-D2"){
    next
  }
  print(x)
}

for(x in starwars$name){
  if(x %in% c("C-3PO", "Darth Vader", "BB8")){
    next
  }
  print(x)
}


for(x in starwars$name){
  if(x == "C-3PO"){
    next
  }
  print(x)
  if(x == "Darth Vader"){
    break
  }
}


for(i in 1:5){
  cat("The height of", starwars$name[i], "is",
      tallness[i], "meters. \n")
}

for(i in 1:5){
  cat("The height of", starwars$name[i], "is",
      tallness[i], "meters. ")
}


for(i in 1:5){
  print(paste("The height of", starwars$name[i], "is",
              tallness[i], "meters \n"))
}

for(i in 1:5){
  print(paste("The height of", starwars$name[i], "is",
              tallness[i], "meters."))
}


## cat() use korle [1] output e ase na
## print(paste()) use korle [1] output e ase





