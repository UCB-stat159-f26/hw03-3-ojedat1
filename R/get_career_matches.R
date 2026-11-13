get_career_matches = function(player_name) {
  if (!is.character(player_name) || length(player_name) != 1L ||
      is.na(player_name) || !nzchar(trimws(player_name))) {
    stop("Enter one player name.", call. = FALSE)
  }
  
  player_id = make_player_id(player_name)
  records = tryCatch(
    suppressWarnings(parse_match_records(fetch_career_lines(player_id))),
    error = function(e) {
      stop("Could not retrieve career data for ", player_name, ": ",
           conditionMessage(e), call. = FALSE)
    }
  )
  if (!length(records)) {
    stop("No career matches found for ", player_name, ".", call. = FALSE)
  }
  
  profile = fetch_player_profile(player_id, records)
  clean_match_records(records, profile$dob, profile$age_format)
}

make_player_id = function(player_name) {
  player_name = trimws(player_name)
  if (grepl("[[:space:]]", player_name)) {
    player_name = stringr::str_to_title(player_name, locale = "en")
  }
  gsub("[[:space:]]+", "", player_name)
}

fetch_player_profile = function(player_id, records) {
  age_fields = vapply(records, function(record) record[17], character(1))
  uses_birth_dates = any(grepl("^[0-9]{8}$", age_fields))
  endpoint = if (uses_birth_dates) "wplayer.cgi" else "player.cgi"
  age_format = if (uses_birth_dates) "birth_date" else "age"
  profile_url = paste0("https://www.tennisabstract.com/cgi-bin/", endpoint,
                        "?p=", utils::URLencode(player_id, reserved = TRUE))
  profile_lines = readLines(profile_url, warn = FALSE)
  list(dob = parse_player_dob(profile_lines), age_format = age_format)
}