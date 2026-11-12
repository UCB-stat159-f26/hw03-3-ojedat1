test_that("the parser finds multiple matches and preserves empty fields", {
  raw_lines = c(
    'var morematchmx = [',
    '  ["19951030", "Canadian Open", ""],',
    '  ["19970307", "Indian Wells", "Hard"]',
    '];'
  )

  expect_identical(
    parse_match_records(raw_lines),
    list(
      c("19951030", "Canadian Open", ""),
      c("19970307", "Indian Wells", "Hard")
    )
  )
})