#Friends_vs_retweet.R
install.packages("ggplot2")
require(ggplot2)
x=combined.df$friends_count
y=combined.df$retweet_count

theme_set(theme_bw())
ggplot(aes(x, y), data= combined.df) + geom_point() + ylab("retweet count") + xlab("friends count")

#friends_vs_favourite.R
install.packages("ggplot2")
require(ggplot2)
x=combined.df$friends_count
y=combined.df$favourites_count

theme_set(theme_bw())
ggplot(aes(x, y), data= combined.df) + geom_point() + ylab("favourite count") + xlab("friends count")

#follower_vs_retweet.R
install.packages("ggplot2")
require(ggplot2)
x=combined.df$followers_count
y=combined.df$retweet_count

theme_set(theme_bw())
ggplot(aes(x, y), data= combined.df) + geom_point() + ylab("retweet count") + xlab("follower count")

#follower_vs_favourite.R
install.packages("ggplot2")
require(ggplot2)
x=combined.df$followers_count
y=combined.df$favourites_count

theme_set(theme_bw())
ggplot(aes(x, y), data= combined.df) + geom_point() + ylab("favourite count") + xlab("follower count")

#status_vs_retweet.R
install.packages("ggplot2")
require(ggplot2)
x=combined.df$statuses_count
y=combined.df$retweet_count

theme_set(theme_bw())
ggplot(aes(x, y), data= combined.df) + geom_point() + ylab("retweet count") + xlab("statuses count")

#status_vs_favourite.R
install.packages("ggplot2")
require(ggplot2)
x=combined.df$statuses_count
y=combined.df$favourites_count

theme_set(theme_bw())
ggplot(aes(x, y), data= combined.df) + geom_point() + ylab("favourite count") + xlab("statuses count")
