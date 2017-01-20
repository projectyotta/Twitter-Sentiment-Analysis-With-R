


install.packages("tm")
install.packages("stringi")
library(stringi)
library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)
require(twitteR)
library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(rworldmap)
library(rworldxtra)
library(streamR)
library(RCurl)
library(RJSONIO)
library(stringr)
library(ROAuth)
library(streamR)
library(googleVis)

#connect to API
download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')
reqURL <- 'https://api.twitter.com/oauth/request_token'
accessURL <- 'https://api.twitter.com/oauth/access_token'
authURL <- 'https://api.twitter.com/oauth/authorize'
consumer_key <- '######' #put the Consumer Key from Twitter Application
consumer_secret <- '#####'  #put the Consumer Secret from Twitter Application
access_token <- '######'
access_secret <- '######'
setup_twitter_oauth(consumer_key , consumer_secret , access_token , access_secret)




mach_tweets = searchTwitter("Donald Trump", n=500, lang="en")

mach_text = sapply(mach_tweets, function(x) x$getText())
mach_text = iconv(mach_text, 'UTF-8', 'ASCII')


# create a corpus
mach_corpus = Corpus(VectorSource(mach_text))

# create document term matrix applying some transformations
tdm = TermDocumentMatrix(mach_corpus,
                         control = list(removePunctuation = TRUE,
                                        stopwords = c("Donald", "Trump","donald","trump", stopwords("english")),
                                        removeNumbers = TRUE, tolower = TRUE))

# define tdm as matrix
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)

# plot wordcloud
wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))

# save the image in png format
png("MachineLearningCloud.png", width=12, height=8, units="in", res=300)
wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()

createddat_vs_fav.R
install.packages("ggplot2")
require(ggplot2)
theme_set(theme_bw())
ggplot(aes(x=combined.df$created_at, y=combined.df$favourites_count), data= combined.df) + geom_point() + ylab("Number of favourites") + xlab("Date and time created at")



d <- density(combined.df$retweet_count,combined.df$favourites_count) # returns the density data 
plot(d) # plots the results

install.packages("aplpack")
library(aplpack)
attach(combined.df)
bagplot(combined.df$retweet_count,combined.df$favourites_count, xlab="rt", ylab="fav",
        main="Bagplot, used to visualize the location, spread, skewness, and outliers of the data set")
