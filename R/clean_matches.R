clean_match_records = function(records) {
  data.frame(
    match_date = as.Date(
      vapply(records, function(record) record[1], character(1)),
      format = "%Y%m%d"
    ),
    tournament = vapply(records, function(record) record[2], character(1)),
    surface = vapply(records, function(record) record[3], character(1))
  )
}