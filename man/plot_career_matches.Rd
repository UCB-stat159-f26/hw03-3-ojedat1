\name{plot_career_matches}
\alias{plot_career_matches}
\title{Plot Career Matches by Age Difference}
\usage{plot_career_matches(matches)}
\arguments{
  \item{matches}{A data frame returned by \code{get_career_matches()}.}
}
\description{
  Plots the player's age against the player's age minus the opponent's age,
  with points colored by win or loss.
}
\value{A ggplot object.}