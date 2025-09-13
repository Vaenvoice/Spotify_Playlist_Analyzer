clean_playlist_data <- function(raw_data) {
  library(jsonlite)
  
  playlist_json <- fromJSON(raw_data, simplifyVector = FALSE)  # keep as lists
  items <- playlist_json$tracks$items
  
  # Initialize vectors
  track_names <- c()
  track_artists <- c()
  track_duration <- c()
  track_popularity <- c()
  
  for (item in items) {
    if (!is.null(item$track)) {
      track <- item$track
      track_names <- c(track_names, track$name)
      
      # Artists may be a list
      artists <- sapply(track$artists, function(a) a$name)
      track_artists <- c(track_artists, paste(artists, collapse = ", "))
      
      track_duration <- c(track_duration, track$duration_ms)
      track_popularity <- c(track_popularity, track$popularity)
    }
  }
  
  # Return data frame
  data.frame(
    name = track_names,
    artist = track_artists,
    duration_ms = track_duration,
    popularity = track_popularity,
    stringsAsFactors = FALSE
  )
}
