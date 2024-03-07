# Scale the Monte Morris data frame using the means and standard deviations

mm$TOV. <- -mm$TOV.

means <- colMeans(wolves_data_1)

sds <- apply(wolves_data_1, 2, sd)

scaled_mm <- as.data.frame(scale(mm, center = means, scale = sds))

scaled_mm <- scaled_mm %>% 
  rename(c('AST%' = 'AST.', 'DRB%' = 'DRB.', 'ORB%' = 'ORB.', 
           'BLK%' = 'BLK.', 'STL%' = 'STL.', 'TOV%' = 'TOV.', 
           'USG%' = 'USG.', 'TS%' = 'TS.', '3PAr' = 'X3PAr'))

long_data <- gather(scaled_mm, key = "x", value = "y")

# Assign the new observation to the cluster with the minimum distance

set.seed(2024)

distances <- apply(kmeans9$centers, 1, function(center) sqrt(sum((scaled_mm - center)^2)))
s <- t(as.matrix(distances))
as.data.frame(s)