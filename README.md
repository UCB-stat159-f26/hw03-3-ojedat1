# tennismatches



`tennismatches` is an R package for STAT 159 HW03. It retrieves career match records from Tennis Abstract and plots a player's age against the age difference between them and their opponent. Each point represents a match and is colored by win or loss. A positive age difference means the player was older than their opponent.



## Installation





```r

# install.packages("devtools")

devtools::install_github("UCB-stat159-f26/hw03-3-ojedat1")

```



## Usage



`get_career_matches()` requires an internet connection. It returns a data frame with one row per match, including the match date, tournament, surface, result, opponent, both ages, and the age difference in years.



```r

library(tennismatches)



serena <- get_career_matches("Serena Williams")

head(serena)

plot_career_matches(serena)



nadal <- get_career_matches("Rafael Nadal")

plot_career_matches(nadal)

```



## Repository structure

```text
hw03-3-ojedat1/
├── .Rbuildignore
├── DESCRIPTION
├── NAMESPACE
├── README.md
├── instructions.md
├── R/
│   ├── clean_matches.R
│   ├── fetch_career_lines.R
│   ├── get_career_matches.R
│   ├── parse_matches.R
│   ├── parse_player_dob.R
│   └── plot_career_matches.R
├── man/
│   ├── get_career_matches.Rd
│   └── plot_career_matches.Rd
└── tests/
    ├── testthat.R
    └── testthat/
        ├── test-clean-matches.R
        └── test-parse-matches.R
```



## Tests



Run these commands in R from the repository root. The automated tests use small sample records and run offline.



```r

devtools::test()

devtools::check()

```



## Personal reflection



Turning my Serena Williams plot from HW02 into a function helped me understand how `ggplot2` finds columns inside `aes()`. For example, `.data$player_age` tells `ggplot2` to use the `player_age` column from the data frame I pass to the function. I used the same approach to map `age_difference` to the y-axis and `result` to color. Once those mappings were in place, I could use the same function to plot both Serena Williams and Rafael Nadal.



I also learned how to turn manual checks in the RStudio console into automated tests with `testthat`. I used small inputs and `expect_identical()` or `expect_equal()` to compare the output with what I expected. One test checks that the parser preserves empty fields so later values stay in the right positions. Another checks both ways the files represent an opponent's age. One format provides a birth date, and the other provides the age directly.



When `devtools::check()` reported a note about extra files at the top level, I learned to use the filenames in the output to track down the cause. I added a rule to `.Rbuildignore` so `instructions.md` could stay in the repository and be excluded from the package build. I compared the two parser scripts before removing the duplicate at the repository root. I also removed the extensionless copy of the plot help page and kept the `.Rd` file in `man/`. After the cleanup, the package check reported zero errors, zero warnings, and zero notes.

