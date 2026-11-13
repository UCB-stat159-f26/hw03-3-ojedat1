plot_career_matches = function(matches) {
  ggplot2::ggplot(matches, ggplot2::aes(
    x = .data$player_age, y = .data$age_difference, color = .data$result
  )) +
    ggplot2::geom_hline(yintercept = 0, color = "grey", linewidth = 0.5) +
    ggplot2::geom_point(size = 1.5, alpha = 0.8, na.rm = TRUE) +
    ggplot2::scale_color_manual(
      values = c("W" = "#4DCBE8", "L" = "#96358C"),
      breaks = c("W", "L"), labels = c("Win", "Loss")
    ) +
    ggplot2::scale_x_continuous(position = "top") +
    ggplot2::labs(
      x = "Player age (years)", y = "Player age minus opponent age (years)",
      color = NULL, caption = "Source: Tennis Abstract"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "top", panel.grid.minor = ggplot2::element_blank())
}