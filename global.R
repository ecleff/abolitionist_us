# load and manage in data
library(dplyr)

# all universities: read github data
library(RCurl)
urlfile<-'https://github.com/ecleff/my_projects.git/allcolleges.csv'
all<-read.csv("allcolleges.csv")

all$X <- NULL
all$Y <- NULL
all$NAME <- as.character(all$NAME)

all$radius <- log(all$TOT_ENROLL)
all$markerID <- 2

## Land-grant
urlfilelg <- "https://github.com/ecleff/my_projects.git/landgrant.xlsx"
library(readxl)
landg <- read_xlsx("landgrant.xlsx", col_names=FALSE)

landg$state <- landg$...1
landg$university <- landg$...2

landgrant <- all %>%
  right_join(landg, by =c("NAME" = "university")) %>%
  select(-...1, -...2)
landgrant$X <- NULL
landgrant$Y <- NULL
landgrant$markerID = 1
## add in lats and longs for missing
landgrant$LATITUDE[landgrant$NAME == "Alabama A&M University"] <- 34.7846
landgrant$LONGITUDE[landgrant$NAME == "Alabama A&M University"] <- -86.5720

landgrant$LATITUDE[landgrant$NAME == "University of Alaska, Fairbanks"] <- 64.8558
landgrant$LONGITUDE[landgrant$NAME == "University of Alaska, Fairbanks"] <- -147.8335

landgrant$LATITUDE[landgrant$NAME == "University of Arkansas Pine Bluff"] <- 34.2469
landgrant$LONGITUDE[landgrant$NAME == "University of Arkansas Pine Bluff"] <- -92.0213

landgrant$LATITUDE[landgrant$NAME == "University of California"] <- 37.8719
landgrant$LONGITUDE[landgrant$NAME == "University of California"] <- -122.2585

landgrant$LATITUDE[landgrant$NAME == "Colorado State University"] <- 40.5734
landgrant$LONGITUDE[landgrant$NAME == "Colorado State University"] <- -105.0865

landgrant$LATITUDE[landgrant$NAME == "Delaware State College"] <- 39.1861
landgrant$LONGITUDE[landgrant$NAME == "Delaware State College"] <- -75.5423

landgrant$LATITUDE[landgrant$NAME == "Florida A&M University"] <- 30.4268
landgrant$LONGITUDE[landgrant$NAME == "Florida A&M University"] <- -84.2851

landgrant$LATITUDE[landgrant$NAME == "Fort Valley State College"] <- 32.5360
landgrant$LONGITUDE[landgrant$NAME == "Fort Valley State College"] <- -83.8963

landgrant$LATITUDE[landgrant$NAME == "University of Hawaii"] <- 19.8968
landgrant$LONGITUDE[landgrant$NAME == "University of Hawaii"] <- -155.5828

landgrant$LATITUDE[landgrant$NAME == "University of Illinois"] <- 40.1020
landgrant$LONGITUDE[landgrant$NAME == "University of Illinois"] <- -88.2272

landgrant$LATITUDE[landgrant$NAME == "Purdue University"] <- 40.4237
landgrant$LONGITUDE[landgrant$NAME == "Purdue University"] <- -86.9212

landgrant$LATITUDE[landgrant$NAME == "Louisana State University"] <- 30.4133
landgrant$LONGITUDE[landgrant$NAME == "Louisana State University"] <- -91.1800

landgrant$LATITUDE[landgrant$NAME == "Southern University"] <- 30.5265
landgrant$LONGITUDE[landgrant$NAME == "Southern University"] <- -91.1929

landgrant$LATITUDE[landgrant$NAME == "University of Maryland, College Park"] <- 38.9869
landgrant$LONGITUDE[landgrant$NAME == "University of Maryland, College Park"] <- -76.9426

landgrant$LATITUDE[landgrant$NAME == "University of Massachusetts"] <- 42.3868
landgrant$LONGITUDE[landgrant$NAME == "University of Massachusetts"] <- -72.5301

landgrant$LATITUDE[landgrant$NAME == "University of Minnesota"] <- 44.9740
landgrant$LONGITUDE[landgrant$NAME == "University of Minnesota"] <- -93.2277

landgrant$LATITUDE[landgrant$NAME == "University of Missouri"] <- 38.9404
landgrant$LONGITUDE[landgrant$NAME == "University of Missouri"] <- -92.3277

landgrant$LATITUDE[landgrant$NAME == "Montana State University-Bozeman"] <- 45.6674
landgrant$LONGITUDE[landgrant$NAME == "Montana State University-Bozeman"] <- -111.0546

landgrant$LATITUDE[landgrant$NAME == "University of Nebraska"] <- 40.8202
landgrant$LONGITUDE[landgrant$NAME == "University of Nebraska"] <- -96.7005

landgrant$LATITUDE[landgrant$NAME == "University of Nevada, Reno"] <- 39.5442
landgrant$LONGITUDE[landgrant$NAME == "University of Nevada, Reno"] <- -119.8164

landgrant$LATITUDE[landgrant$NAME == "University of New Hampshire"] <- 43.1389
landgrant$LONGITUDE[landgrant$NAME == "University of New Hampshire"] <- -70.9370

landgrant$LATITUDE[landgrant$NAME == "Rutgers - the State University of New Jersey"] <- 40.5008
landgrant$LONGITUDE[landgrant$NAME == "Rutgers - the State University of New Jersey"] <- -74.4474

landgrant$LATITUDE[landgrant$NAME == "New Mexico State University"] <- 32.2788
landgrant$LONGITUDE[landgrant$NAME == "New Mexico State University"] <- -106.7479

landgrant$LATITUDE[landgrant$NAME == "North Carolina A&T State University"] <- 36.0773
landgrant$LONGITUDE[landgrant$NAME == "North Carolina A&T State University"] <- -79.7720

landgrant$LATITUDE[landgrant$NAME == "North Carolina State University"] <- 35.7847
landgrant$LONGITUDE[landgrant$NAME == "North Carolina State University"] <- -78.6821

landgrant$LATITUDE[landgrant$NAME == "North Dakota State University"] <- 46.8978
landgrant$LONGITUDE[landgrant$NAME == "North Dakota State University"] <- -96.8024

landgrant$LATITUDE[landgrant$NAME == "Ohio State University"] <- 40.0068
landgrant$LONGITUDE[landgrant$NAME == "Ohio State University"] <- -83.0306

landgrant$LATITUDE[landgrant$NAME == "Oklahoma State University"] <- 36.1270
landgrant$LONGITUDE[landgrant$NAME == "Oklahoma State University"] <- -97.0737

landgrant$LATITUDE[landgrant$NAME == "Pennsylvania State University"] <- 40.7982
landgrant$LONGITUDE[landgrant$NAME == "Pennsylvania State University"] <- -77.8599

landgrant$LATITUDE[landgrant$NAME == "University of Puerto Rico"] <- 18.4028
landgrant$LONGITUDE[landgrant$NAME == "University of Puerto Rico"] <- -66.0500

landgrant$LATITUDE[landgrant$NAME == "University of Tennessee"] <- 35.9544
landgrant$LONGITUDE[landgrant$NAME == "University of Tennessee"] <- -83.9295

landgrant$LATITUDE[landgrant$NAME == "Prairie View A&M University"] <- 30.0939
landgrant$LONGITUDE[landgrant$NAME == "Prairie View A&M University"] <- -95.9899

landgrant$LATITUDE[landgrant$NAME == "Texas A&M University"] <- 30.6188
landgrant$LONGITUDE[landgrant$NAME == "Texas A&M University"] <- -96.3365

landgrant$LATITUDE[landgrant$NAME == "Virginia Polytechnic Institute & State University"] <- 37.2284
landgrant$LONGITUDE[landgrant$NAME == "Virginia Polytechnic Institute & State University"] <- -80.4234

landgrant$LATITUDE[landgrant$NAME == "West Virginia State College"] <- 38.3790
landgrant$LONGITUDE[landgrant$NAME == "West Virginia State College"] <- -81.7666
## oldest universities
urlfileold <- "https://github.com/ecleff/my_projects.git/oldest_unis.csv"
old <- read.csv("oldest_unis.csv")
old$markerID <- 3
## indigenous land
urlfileil <- "https://github.com/ecleff/my_projects.git/natshapes.csv"
natshapes <- read.csv("natshapes.csv")
# rename lat and long
names(natshapes)[names(natshapes)== "INTPTLAT"] <- "latitude"
names(natshapes)[names(natshapes)== "INTPTLON"] <- "longitude"

natshapes$latitude <- as.character(natshapes$latitude)
natshapes$latitude <- as.numeric(natshapes$latitude)

natshapes$longitude <- as.character(natshapes$longitude)
natshapes$longitude <- as.numeric(natshapes$longitude)
natshapes$markerID <- 4

# make radius variable for natshapes
natshapes <- natshapes %>% mutate(radius = log(ALAND))

# dataframe w/ all data and lats and long
total <- natshapes %>%
  select(NAME, latitude, longitude, markerID) %>%
  full_join(old, by=c("latitude"="Latitude", "longitude"="Longitude", "NAME"="Institution", "markerID"="markerID"))%>%
  full_join(all, by=c("latitude"="LATITUDE", "longitude"="LONGITUDE", "NAME"="NAME", "markerID"="markerID")) %>%
  full_join(landgrant, by=c("latitude"="LATITUDE", "longitude"="LONGITUDE", "NAME"="NAME", "markerID"="markerID")) %>%
  select(NAME, latitude, longitude, markerID)

# shiny
library(rsconnect)
rsconnect::setAccountInfo(name='abolitionistusfinal',
                          token='6D48CD45F46DD5570AFDC929EAAFE0FC',
                          secret='A4Hlc5bqcmpkWQ+iTNhFHSbhTGBkEcd/3dB1xDz7')
library(shiny)
library(leaflet)
m <- leaflet() %>%
  addTiles() %>%
  setView(-72.6569, 41.5566, zoom = 7)
