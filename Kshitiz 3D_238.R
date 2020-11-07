library(rvest)
library(dplyr)

link = "https://timesofindia.indiatimes.com/entertainment/top-rated-movies/best-movies-of-all-time"
page = read_html(link)

name = page %>% html_nodes("h3 a") %>% html_text()
rating = page %>% html_nodes(".cricrating") %>% html_text()

movies = data.frame(name, rating, stringsAsFactors = FALSE )
write.csv(movies, "movies.csv")