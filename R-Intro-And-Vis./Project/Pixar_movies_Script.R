#Install required package to access the Pixar dataset.
packages <- c('pixarfilms', 'ggplot2', 'cowplot', 'reshape', "hrbrthemes", 'tidyr', 'dplyr', 'tidyverse', 'ggrepel')

installer <- function(pkg_list){
  for (pkg in pkg_list){
    install.packages(pkg, character.only=TRUE)#We set character.only=TRUE to pass variable name, rather than literal string.
  }
}
installer(packages)

#Calling the required libraries for wrangling and plotting data.
Caller <- function(pkg_list){
  for (pkg in pkg_list){
    library(pkg, character.only = TRUE) 
  }
}
Caller(packages)

#Checking the components of the library
ls('package:pixarfilms') #Library contains 6 data sets.

#Which movies are in this data set? 
str(pixar_films) #Shows that there are 27 movies in this data set.

#What is the most common genre?
str(genres) #Since each movie is cataloged with multiple genres, let's assess the frequency of each genre.
taste <- factor(genres$genre)
summary(taste) #This shows us that Animation and Adventure are the most popular genre in Pixar!

##Lets plot the frequency of each genre across pixar movies!
plotting_frequency <- data.frame(table(taste))

ggplot(data = plotting_frequency, aes(x = reorder(taste, Freq), y = Freq)) +
  geom_col(fill = "#0072B2") +
  labs(x = "Genre", y = "Frequency", title = "Genre Frequency in Pixar Films") +
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))

#Lets check whether the budget of Pixar movies has changed over time.
Budget_over_time <- data.frame(film = box_office$film, Budget = box_office$budget)
Budget_over_time$film <- factor(Budget_over_time$film, levels = box_office$film)

##Since the budget is in the order of millions, lets simplify the notation.
Budget_over_time$Budget <- (Budget_over_time$Budget/1e6)
#Since this dataset doesn't contain the budget nor revenue for the movie "Luca", lets go ahead and remove the data point.
Budget_over_time <- na.omit(Budget_over_time)

##Plotting the changes in budget of pixar movies over time.
ggplot(data=Budget_over_time, aes(x=Budget, y=film))+
  geom_point(color='steelblue')+
  labs(x="Budget (in million USD)", y="Movies (in release order)", title = "Pixar Movie Budgets Over Time")+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))


#Lets test whether movies with a greater budget perform better in the box office.
box_office <- box_office[!is.na(box_office$box_office_worldwide), ] #Removes the movie(s) that does NOT contain any revenue information.

Movie_money <- data.frame(Budget_over_time, Revenue=box_office$box_office_worldwide)
Movie_money$Revenue <- (Movie_money$Revenue/1e6) #Standardizing revenue to Millions.

## Dumbbell plot with budget and revenue

### First, lets melt the Movie_money data frame from wide format to long format (such that revenue and budget are separate rows for each movie.)
Movie_money_long <- Movie_money |> 
  select(film, Budget, Revenue) |> 
  pivot_longer(cols = c(Budget, Revenue), 
               names_to = "type", 
               values_to = "amount")

### Once the data format is right, lets plot the dumbbell plot showing the ROI!
### The data clearly shows that movies after Toy Story 4 did NOT have a large revenue -- due to the COVID-19 pandemic and lockdowns.
ggplot(Movie_money_long, aes(x = film, y = amount, color = type)) +
  geom_segment(data = Movie_money,
               aes(x = film, xend = film, y = Budget, yend = Revenue),
               color = "grey") +
  annotate("text",
           x = 22,
           y = 920, 
           label = "COVID-19 Lockdowns",
           color = "firebrick",
           size = 3.5,
           hjust = 0.5)+
  geom_point(size = 3) +
  coord_flip() +
  theme_bw() +
  geom_vline(xintercept = 21.5, linetype = "dashed", color = "red")+
  labs(
    x = "",
    y = "Capital (Millions USD)",
    color = "Type",
    title = "Pixar Movies - Return on Investment",
  )

# Is there a correlation between ROI and public reception of a Pixar movie?
Movie_money$ROI <- c(Movie_money$Revenue/Movie_money$Budget) 
## Once again, lets remove any missing "NA" values for the public ratings
public_response <- public_response[!is.na(public_response$metacritic), ]
Public_ROI <- data.frame(Name = Movie_money$film, ROI = Movie_money$ROI, Metacritic_score = public_response$metacritic) #We'll use metacritic as public score.

## Lets plot the ROI against public score! I used ggrepel for labels and a linear regression method to get best fit.
ggplot(data=Public_ROI, aes(x=Metacritic_score, y=ROI))+
         geom_point(size=3, color="red")+
         geom_label_repel(aes(label=Name), nudge_x =0, nudge_y=0.5, size = 3.8, max.overlaps = Inf, min.segment.length = 0, segment.curvature = 1, force_pull=9)+
         coord_cartesian(clip = "off")+
         theme_bw()+
         labs(title='Critic score vs Financial ROI')+
         geom_smooth(method='lm', se=FALSE, color='blue')