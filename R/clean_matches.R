clean_match_records = function(records, player_dob, opponent_age_format) {
  field = function(position) {
    vapply(records, function(record) record[position], character(1))
  }
  
  match_date = as.Date(field(1), format = "%Y%m%d")
  player_age = as.numeric(match_date - as.Date(player_dob)) / 365.25
  opponent_age = if (opponent_age_format == "birth_date") {
    as.numeric(match_date - as.Date(field(17), format = "%Y%m%d")) / 365.25
  } else {
    as.numeric(field(17))
  }
  
  data.frame(
    match_date = match_date, tournament = field(2), surface = field(3),
    result = field(5), opponent = field(12), player_age = player_age,
    opponent_age = opponent_age, age_difference = player_age - opponent_age
  )
}