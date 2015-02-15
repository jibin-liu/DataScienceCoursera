# Quiz 2 - Jibin Liu
# 12/14/2014

# Question 1
#	Connect GitHub API
library(httr)
oauth_endpoint("github")
myapp <- oauth_app("github", clientID, clientSecret)
#	Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
#	Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
# Transfer contents to JSON and look for DataSharing repo
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[, c("name", "created_at")]

# Question 2
library(sqldf)
acs <- read.csv("getdata-data-ss06pid.csv")
#	select only the data for the probability weights pwgtp1 with ages less than 50
sqldf("select pwgtp1 from acs where AGEP < 50")

# Question 3
# the equivalent function to unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

# Question 4
connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
rowNumber <- c(10, 20, 30, 100)
nchar(htmlCode[rowNumber])

# Question 5
fordf <- read.fwf(file = "getdata-wksst8110.for", skip = 4, widths=c(12, 7,4, 9,4, 9,4, 9,4))
sum(fordf[, 4])
