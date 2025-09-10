🎵 Spotify Playlist Analyzer

Ever wondered how danceable, energetic, or popular your favorite playlist really is?

This project helps you explore Spotify playlists using the Spotify Web API and some friendly R scripts. We pull in track data, clean it up, analyze audio features like tempo and energy, and create simple visualizations to make sense of it all.

---------------------------------------------------------------------------------------------------

🚀 What This Project Does

• 🔗 Connects to the Spotify API using your credentials

• 📥 Downloads track data from any public playlist

• 🧹 Cleans and processes the data

• 📊 Visualizes audio features like danceability, energy, tempo, and more

• 📄 Generates a clean, shareable report using Quarto or R Markdown

---------------------------------------------------------------------------------------------------

🛠 How to Set It Up

You’ll need R and RStudio (or VS Code with R), and a free Spotify developer account.

1. Clone the repo

git clone https://github.com/Vaenvoice/Spotify_Playlist_Analyzer.git
cd Spotify_Playlist_Analyzer

Then open the .Rproj file in RStudio.

2. Install required R packages

install.packages(c("spotifyr", "dplyr", "ggplot2", "readr"))

3. Get Spotify API access

• Go to Spotify for Developers(https://developer.spotify.com/dashboard)

• Create an app → copy your Client ID and Client Secret

• Create a file called .Renviron in your project folder:

SPOTIFY_CLIENT_ID=your_id_here
SPOTIFY_CLIENT_SECRET=your_secret_here

(These are local only — we’ve ignored .Renviron in Git so your secrets stay safe.)

---------------------------------------------------------------------------------------------------

🧪 Running the Project

Once you're set up, just open main.R and run it.

This script:

• Authenticates with Spotify

• Downloads playlist data

• Cleans the data and adds audio features

• Saves processed data in data/processed/

• Generates plots and saves them in plots/

Example playlists you can try:

playlist_id <- "37i9dQZF1DXcBWIGoYBM5M"  # Today's Top Hits

---------------------------------------------------------------------------------------------------

📁 Project Structure
Spotify_Playlist_Analyzer/
├── R/                      # All R scripts
├── data/                   # Raw and processed data (ignored in Git)
├── plots/                  # Auto-generated visualizations
├── analysis/               # Quarto/RMarkdown reports
├── main.R                  # Main pipeline script
├── .Renviron.example       # Template for API credentials
├── README.md, LICENSE, .gitignore, .Rproj

---------------------------------------------------------------------------------------------------

💡 Features (So Far)

• ✅ Pull track data from any playlist

• ✅ Clean and format audio features

• ✅ Plot danceability, energy, tempo, and more

• ✅ Save results and generate reports

Planned:

• 🎨 Add genre-based analysis

• 📊 Cluster similar tracks

• 🌐 Create a mini web dashboard (maybe)

---------------------------------------------------------------------------------------------------

📷 Sample Plots (Coming Soon)

Once we load some real data, you’ll see:

• Histogram of danceability scores

• Energy vs. popularity plots

• Tempo distributions

Stay tuned 👀

---------------------------------------------------------------------------------------------------

👥 Collaborators

Built by @Vaenvoice and @proxybinder
Pull requests and ideas welcome!

---------------------------------------------------------------------------------------------------

📄 License

MIT License
 — free to use and adapt.

---------------------------------------------------------------------------------------------------

📝 Note

Want to contribute? Just fork the repo, set up your .Renviron, and try analyzing your own playlists!

---------------------------------------------------------------------------------------------------
