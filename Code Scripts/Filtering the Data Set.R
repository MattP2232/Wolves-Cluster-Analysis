# Filtering for players who player at least 500 minutes

wolves_500 <- subset(wolves_data, MP > 500)
unique_players <- unique(wolves_500$Player)

suppressWarnings({
  m <- as.data.frame(matrix(unique_players, ncol = 5, byrow = TRUE))
})

names(m) <- NULL
m[13, 4] <- ""
m[13, 5] <- ""

m_html <- kable(m, "html") %>%
  kable_styling()

m_html
