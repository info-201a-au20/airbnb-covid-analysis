
library(wordcloud2)
# get 
get_listing_words <- function(dataset) {
  
  finalWords <- dataset %>%
    select(id, description, price, name) %>%
    unnest_tokens(word, description) %>%
    filter(!word %in% stop_words$word,
           str_detect(word, "^[a-z]+$"))
  
  finalCloud <- as.data.frame(finalWords %>%
                                group_by(word) %>%
                                summarise(word_counter = length(word)))
  
  finalCloud2 <- finalCloud[1:1000, ]
  
  wordcloud2(data = finalCloud2,
              color = 'random-light', backgroundColor = "grey")
  
  # wordcloud(words = finalCloud$word, freq = finalCloud$word_counter, min.freq = 5,
   #         max.words = 300, random.order = FALSE, rot.per = 0.56, colors = brewer.pal())
  

}


get_listing_words(seattle_listings)

