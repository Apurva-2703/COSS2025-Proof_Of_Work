#R is an interpreted language. There is no compilation.

# Home page: http://www.r-project.org
# Bioinformatics packages: https://bioconductor.org/ 

#Creating a variable
My_Number <- 23.6
My_Character <- "Alphabet"
My_Truth <- FALSE
str(My_Number) #This tells you the data type of a variable.

#Concatenation (The "\n" introduces new line in output.)
cat(My_Character, "is an American coorporation.", "\n")

#Boolean
My_Truth == (200>250) #FALSE == FALSE
(My_Number < 25) & (My_Number + 3 != 29) #TRUE & TRUE
(My_Truth) | (50/100 == 2) # FALSE or FALSE
!My_Truth #TRUE

#Script = set of instructions for the interpreted programming lang. saved in a txt file.

#Vector = seequence of elements in the same basic type.
Shoes <- c("Nike", "Saucony", "Adidas", "Hoka") #c command creates vector.
str(Shoes) #Will show a 1x4 vector made up of chr.
Shoes[2:4] #Indexing the vector. This is show the SECOND-FORTH item.

#Skipping elements in the vector
Shoes[-2] #Skips the SECOND element
Shoes[c(TRUE, FALSE, FALSE, TRUE)] #Boolean FALSE skips items from the vector

#Checking components of the vector
lenght(Shoes)
"Nike" %in% Shoes #Tests whether item is in vector.
My_mix <- c(TRUE, 55)
str(My_mix) #Converts TRUE to 1 to match all data types (num).
My_mix + 5 #Adds num to all elements of the vector.

#Conditional over a whole vector
My_vector <- c(55, 79, 42, 71)
(My_vector < 60) #1,0,1,0

#Matrices
Quantity <- c(3, 5, 1, 7)
shopping <- cbind(Shoes, Quantity) #Creates a 4x2 Matrix
colnames(shopping) <- c("Shoes", "Amount") #Rename columns

#Data Frame
shopping_df <- data.frame(Shoes, Quantity, stringsAsFactors = TRUE) #DataFrame allows storage of various data types in 1 variable.
colnames(shopping_df) <- c("Shoes", "Amount")
str(shopping_df) #Data types are now Factor and Num

#Factors: Categories in a vector.
locations <- c("Costco", "Walmart", "Zehrs", "Walmart")
places <- factor(locations)
summary(places) #Tells us how often a level appears in a factor.

summary(shopping_df) #Gives us the statistics for the level that contains num Data type.

#Selecting and adding columns
shopping_df$Amount #selecting a column
shopping_df$Price <- c(50, 75, 20, 100) #Creating a new column

#Selecting rows
shopping_df[c(2,4),] #Shows rows 2 and 4
shopping_df[c(2,4), c("Amount","Price")] #Rows 2 and 4 for given columns

#Creating a new column and computing.
shopping_df$Total <- shopping_df$Amount * shopping_df$Price
sum(shopping_df$Total) #Adds up all the values from the total column.

#LOOPS AND CONDITIONAL
Sample_list <- c("Alfredo", "Pasta", "Water", "Olive oil")
for (i in Sample_list){
   cat("Make sure to purchase: ", i, "\n")
   if (i == "Pasta"){
    cat("Please purchase penne-style pasta.\n")
   }
}

#Taking user input
your_name <- readline(prompt = "Enter your name: ")
cat("Hi ", your_name, "!\n", sep="") #Last argument removes empty spaces across concat. strings.

#Functions
Egg.boiling <- function(){
    cat("Place your eggs in a pot full of cold water.\n")
    cat("Place the pot on a stovetop and raise the temperature to medium.\n")
    cat("Once the water starts boiling, drop the temperature to medium-low.\n")
    cat("After 10-12minutes, remove the eggs from the water and place them in cold water again.\n")
    cat("Peel the boiled eggs and use as per your recipe.")
}

#Arguments
Salad.steps <- function(item1, item2, item3){
    cat("Add ", item1, "\n", sep="")
    cat("Add ", item2, "\n", sep="")
    cat("Add ", item3, "\n", sep="")
    cat("Mix everything well. \n")
}

Salad.steps("Lettuce", "Tomato", "Vinegar") #The arguments are the input to the function.

#Variable number of parameters
mix.ingredients <- function(ingredients){
    for (i in ingredients)
        cat("Add", i, "\n")
    cat("Mix everything well\n")
}

ingredients <- c("sugar", "flour", "raisins", "vanilla")
mix.ingredients(ingredients)

#Default argument, return statement, and "paste"
make.pasta.bolognese <- function(sauce.ingredients, pasta="Spaghetti"){
    #Paste simply concatenates its inputs into a single string.
    #Collapse separates the concatenated strings with the given symbol.
    ingredients.string <- paste(sauce.ingredients, collapse=", ") 
    cat("Cook", ingredients.string, "together\n")
    cat("Serve on top of", pasta, "\n")
    return(paste("Bolognese sauce with", pasta))
    #Return statement allows us to use the output of the function later.
}

make.pasta.bolognese(c("onions", "ground beef", "tomatoes"))
#Despite not declaring the pasta argument in this function, the DEFAULT spagetthi is used as argument for the function.

##END OF LECTURE - HIGH-PERFORMANCE R NOT COVERED. =)