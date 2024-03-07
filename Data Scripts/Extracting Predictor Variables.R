# Extracting predictor variables

wolves_data_1 <- wolves_500[, c(4:13, 17:20)]
wolves_data_1$TOV. <- -wolves_data_1$TOV.
scaled_wolves <- scale(wolves_data_1)