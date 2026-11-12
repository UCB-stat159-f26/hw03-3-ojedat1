parse_match_records = function(raw_lines) {
  raw_text = paste(raw_lines, collapse = "\n")
  
  records = stringr::str_extract_all(
    raw_text,
    '\\[\\s*"[0-9]{8}"(?:[^"\\[\\]]|"[^"]*")*\\]'
  )[[1]]
  
  fields = stringr::str_extract_all(records, '"[^"]*"')
  lapply(fields, function(values) {
    stringr::str_remove_all(values, '^"|"$')
  })
}