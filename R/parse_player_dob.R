parse_player_dob = function(profile_lines) {
  matches = stringr::str_match(
    profile_lines, "\\bvar\\s+dob\\s*=\\s*([0-9]{8})\\s*;"
  )
  dob = matches[!is.na(matches[, 2]), 2]
  
  if (length(dob) != 1L) {
    stop("Could not find a unique birth date in the player profile.", call. = FALSE)
  }
  
  as.Date(dob, format = "%Y%m%d")
}