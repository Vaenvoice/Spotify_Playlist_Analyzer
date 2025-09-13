#This will be your default repo location
setwd("C:/Users/bedan/Documents/R_Project/Spotify_Playlist_Analyzer")


#if R does not loads Renviron file, uncomment and run the following
#readRenviron("~/.Renviron")


source("R/utils.R")
source("R/get_data.R")
source("R/clean_data.R")
source("R/plot_features.R")

# Load environment variables
client_id <- Sys.getenv("SPOTIFY_CLIENT_ID")
client_secret <- Sys.getenv("SPOTIFY_CLIENT_SECRET")
redirect_uri <- "http://127.0.0.1:1410/callback"


cat("Client ID:", client_id, "\n")
cat("Client Secret:", substr(client_secret, 1, 4), "...\n")

# Get the token using Authorization Code Flow
token <- get_spotify_token(client_id, client_secret, redirect_uri)

# Ask for playlist ID
playlist_id <- readline(prompt = "Enter the Spotify Playlist ID: ")

# Fetch and clean data
raw_data <- fetch_playlist_data(playlist_id, token)
playlist_info <- clean_playlist_data(raw_data)

# Sort by popularity descending
top_tracks <- playlist_info[order(-playlist_info$popularity), ]
head(top_tracks, 10)

# Plot features
plot_playlist_features(playlist_info)
