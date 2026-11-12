test_that("the cleaner handles both opponent age formats", {
  record = rep("", 17)
  record[c(1, 2, 3, 5, 12, 17)] = c(
    "19951030", "Canadian Open", "Carpet", "L", "Anne Miller", "19770119"
  )
  women = clean_match_records(list(record), "1981-09-26", "birth_date")
  
  record[c(1, 2, 3, 12, 17)] = c(
    "20010910", "Spain F10", "Hard", "Guillermo Platel", "22.264202601"
  )
  men = clean_match_records(list(record), "1986-06-03", "age")
  
  expect_equal(round(women$opponent_age, 2), 18.78)
  expect_equal(round(women$age_difference, 2), -4.68)
  expect_equal(round(men$opponent_age, 2), 22.26)
  expect_equal(round(men$age_difference, 2), -6.99)
})