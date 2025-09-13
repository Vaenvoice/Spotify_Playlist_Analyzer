fetch_playlist_data <- function(playlist_id, token) {
  url <- paste0("https://api.spotify.com/v1/playlists/", playlist_id)
  
  response <- GET(
    url = url,
    add_headers(Authorization = paste("Bearer", token))
  )
  
  if (status_code(response) != 200) {
    stop("Failed to fetch playlist data!\n", content(response, "text"))
  }
  
  content(response, as = "text", encoding = "UTF-8")
}