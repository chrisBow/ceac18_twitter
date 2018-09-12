
# load library and set up authorisation tokens

library(twitteR)

api_key <- "API KEY"

api_secret <- "API SECRET"

access_token <- "ACCESS TOKEN"

access_token_secret <- "ACCESS TOKEN SECRET"

setup_twitter_oauth(api_key, 
                    api_secret,
                    access_token,
                    access_token_secret)

# Search Twitter for recent tweets and convert to dataframes

ceac_tweets <- searchTwitter("CEAC18",
                             n = 10000,
                             lang = "en",
                             resultType = "recent")

tweets_df <- twListToDF(ceac_tweets)


case_eur_tweets <- searchTwitter("CASE_Europe",
                                 n = 10000,
                                 lang = "en",
                                 resultType = "recent")

tweets_df2 <- twListToDF(case_eur_tweets)


tweets_df$search_term <- "CEAC18"

tweets_df2$search_term <- "CASE_Europe"


# Bind dataframe rows

library(dplyr)

case_tweets <- tweets_df %>%
  bind_rows(tweets_df2)

write.csv(tweets_df, "case_tweets.csv", row.names = FALSE)
