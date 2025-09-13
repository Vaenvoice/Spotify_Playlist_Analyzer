plot_playlist_features <- function(playlist_info) {
  library(ggplot2)
  
  # Remove tracks with NA popularity
  valid_tracks <- subset(playlist_info, !is.na(popularity))
  
  # Sort by popularity descending and take top 10
  top_tracks <- valid_tracks[order(-valid_tracks$popularity), ]
  top_n <- min(10, nrow(top_tracks))
  top_tracks <- top_tracks[1:top_n, ]
  
  # Plot
  ggplot(top_tracks, aes(x = reorder(name, popularity), y = popularity)) +
    geom_bar(stat = "identity", fill = "seagreen") +
    coord_flip() +  # horizontal bars for better readability
    labs(title = "Top Tracks by Popularity",
         x = "Track Name",
         y = "Popularity") +
    theme_minimal()
}