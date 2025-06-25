This project is an exploratory analysis of Pixar movies, using R for data wrangling and  visualization. It was completed after the COSS-2025 summer school as part of the #TidyTuesday weekly challenge to refine data visualization skills.

##Data
The dataset was sourced from the pixarfilms package by Eric Leung, which includes structured information on Pixar's films, people, box office numbers, genres, and public reception.

##Libraries
- tidyverse and dplyr for data wrangling
- ggplot2, ggrepel, and cowplot for layered data visualization
- hrbrthemes for aesthetics

##Plots
The following plots were created during the project:

1. Genre Frequency:
A bar chart showing the frequency of genre tags across Pixar movies. Family, adventure, and animation are the key thematics presented in these movies.

2. Movie Budgets Over Time:
A scatter plot showing how the production budgets of Pixar films evolved chronologically. Toy Story 1 was made with a significantly lower budget compared to all other movies from Pixar. Whereas, recent trends suggest the range of production budget being between $175M and $200M USD. The budget information for movie "Luca" was not disclosed in this dataset.

3. ROI: Budget vs Revenue (Dumbbell Plot):
A dumbbell plot comparing each film's budget and global box office revenue. A dashed red line was added after Toy Story 4 to signal the onset of the COVID-19 pandemic, which directly affected theatrical releases.

✨ Key Insight:
The last three Pixar films (Onward, Soul, Luca) were released during the pandemic. Due to global lockdowns, these films either saw reduced theatrical runs or were released directly to streaming platforms (Disney+), resulting in low or negative box-office ROI — despite maintaining creative output.

4. Public Reception vs ROI (Scatterplot):
A scatter plot of Metacritic critic scores against the financial return on investment (ROI) for each movie. A linear model line (trendline) was added.

✨ Key Insights:
Toy Story (1995) emerged as Pixar’s most exceptional success, standing far above the trendline both critically and financially — despite being their first film.
Soul (2020) received strong critical acclaim, but had zero theatrical revenue due to its exclusive release on Disney+ amid lockdowns.
Onward (2020) had limited theatrical exposure before pandemic closures — again impacting its ROI.

##Insights and Summary
This project highlights how external forces (like global pandemics) can heavily skew financial data, even for well-received films produced by multi-million animation powerhouses. It also showcases how audience reception, genre consistency, and budget investment have played out in Pixar's legacy. The analysis leveraged tidy R workflows and multiple data visual techniques to extract both expected and unexpected patterns from the dataset.

Citation

1. https://cran.r-project.org/package=pixarfilms
2. Data Science Learning Community (2024). Tidy Tuesday: A weekly social data project. https://tidytues.day