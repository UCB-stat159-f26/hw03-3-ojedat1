fetch_career_lines = function(player_id) {
  career_url = paste0(
    "https://www.tennisabstract.com/jsmatches/",
    player_id,
    "Career.js"
  )
  readLines(career_url, warn = FALSE)
}