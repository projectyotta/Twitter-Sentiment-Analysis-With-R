
install.packages("twitteR")
install.packages("RCurl")
install.packages("base64enc")
install.packages("devtools")
install.packages("tm")
install.packages("googleVis")
install.packages("streamR")
install.packages("RJSONIO")
install.packages("stringr")
install.packages("ROAuth")
install.packages("googleVis")
install.packages("rworldmap")
install.packages("rworldxtra")
library(rworldmap)
library(rworldxtra)
library(streamR)
library(RCurl)
library(RJSONIO)
library(stringr)
library(ROAuth)
library(streamR)
library(googleVis)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "##############"
consumerSecret <- "################"
#make sure these show up in the global env
my_oauth <- OAuthFactory$new(consumerKey = consumerKey, consumerSecret = consumerSecret, requestURL = requestURL, accessURL = accessURL, authURL = authURL)
#environment set up ! 
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
#download cacert.pem file 
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))



# end of part 1 
#part 2 begins 
save(my_oauth, file = "my_oauth.Rdata")
load("my_oauth.RData")

for(x in 1:20)
{
  x= x+1 
  filterStream(file.name = "tweets_trump.json", track = c("Donald Trump"),language = "en", timeout = 10, oauth = my_oauth)
  tweets_trump.df <- parseTweets("tweets_trump.json", simplify = FALSE)
  if(x==16) break; 
}

tweets.df <- parseTweets("tweets.json", simplify = FALSE)
combined.df <- rbind(tweets.df, tweets_trump.df)

newdf.df <- combined.df[tweets.df$place_lat != "NaN",]
keeps <- c("place_lat", "place_lon")
latlondata.df <- newdf.df[keeps]

#save all of the tweets in a data frame for further processing 
tweets.df[[37]] 
L = tweets.df$place_lat !=0
L
tweets.df[L,]
dim(tweets.df)

subset(tweets.df,COLUMNNAME=="created_at")



newmap <- getMap(resolution = "low")
plot(newmap)
points(latlondata.df$place_lon, latlondata.df$place_lat, col = "#ff6666", cex = 1.3)




#next part : run the code for the sentiment analysis . 
#Then try running it on the induvidual data frames and see what happens 
tweets1.df <- parseTweets("tweets1.json", simplify = TRUE)

tweets.df$created_at <- as.POSIXct(tweets.df$created_at, format="%a, %d %b %Y %H:%M:%S %z") 
df <- df[order(df$date),]
