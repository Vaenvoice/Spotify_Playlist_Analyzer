if (!require(httr)) install.packages("httr")
if (!require(jsonlite)) install.packages("jsonlite")

library(httr)
library(jsonlite)

get_spotify_token <- function(client_id, client_secret, redirect_uri) {
  auth_url <- modify_url("https://accounts.spotify.com/authorize", query = list(
    client_id = client_id,
    response_type = "code",
    redirect_uri = redirect_uri,
    scope = "playlist-read-private",
    state = "xyz123"
  ))
  
  cat("Open this URL in your browser and authorize the app:\n")
  cat(auth_url, "\n\n")
  
  redirected_url <- readline(prompt = "Paste the full redirected URL here: ")
  parsed <- parse_url(redirected_url)
  code <- parsed$query$code
  
  if (is.null(code)) {
    stop("No code found! Check redirect URI.")
  }
  
  token_response <- POST(
    url = "https://accounts.spotify.com/api/token",
    body = list(
      grant_type = "authorization_code",
      code = code,
      redirect_uri = redirect_uri,
      client_id = client_id,
      client_secret = client_secret
    ),
    encode = "form"
  )
  
  if (status_code(token_response) != 200) {
    stop("Failed to retrieve token!\n", content(token_response, "text"))
  }
  
  content(token_response)$access_token
}