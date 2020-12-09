
library(wordcloud2)
# get 
get_cloud_visual_listings <- function(dataset) {
  
  finalWords <- dataset %>%
    select(id, description, price, name) %>%
    unnest_tokens(word, description) %>%
    filter(!word %in% stop_words$word,
           str_detect(word, "^[a-z]+$"))
  
  finalCloud <- as.data.frame(finalWords %>%
                                group_by(word) %>%
                                filter(!word == "br") %>%
                                summarise(word_counter = length(word)))
  finalCloud2 <- finalCloud[1: 200, ]
  
  wordcloud2(data = finalCloud,
              color = 'random-dark', backgroundColor = "black")
  

}




get_cloud_visual_reviews <- function(dataset) {
  
  finalWords <- dataset %>%
    select(id, comments) %>%
    unnest_tokens(word, comments) %>%
    filter(!word %in% stop_words$word,
           str_detect(word, "^[a-z]+$"))
  
  finalCloud <- as.data.frame(finalWords %>%
                                group_by(word) %>%
                                filter(!word == "br") %>%
                                summarise(word_counter = length(word)))
  finalCloud2 <- finalCloud[1: 200, ]
  
  wordcloud2(data = finalCloud,
             color = 'random-dark', backgroundColor = "black")
  
  
}

