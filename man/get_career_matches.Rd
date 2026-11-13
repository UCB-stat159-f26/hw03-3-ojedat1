\name{get_career_matches}
\alias{get_career_matches}
\title{Retrieve a Player's Career Matches}
\usage{get_career_matches(player_name)}
\arguments{
  \item{player_name}{A character string giving the player's name or Tennis Abstract ID.}
}
\description{
  Retrieves career match records and the player's birth date from Tennis Abstract.
  This function requires an internet connection.
}
\value{
  A data frame with one row per match, including match date, tournament,
  surface, result, opponent, both ages, and the age difference in years.
}