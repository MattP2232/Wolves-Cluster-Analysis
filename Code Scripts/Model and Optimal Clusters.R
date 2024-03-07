# Determining the optimal number of clusters using fviz_nbclust function

oc <- fviz_nbclust(scaled_wolves, kmeans, method = "wss")
oc

# Running the model

set.seed(2024)

K <- 9
kmeans9 <- kmeans(scaled_wolves, centers = K, nstart = 25, iter.max = 20)
km_centers <- as.data.frame(kmeans9$centers) 

# Name clusters before pivoting

km_centers$Cluster <- c('Cluster 1', 'Cluster 2', 'Cluster 3',
                        'Cluster 4', 'Cluster 5', 'Cluster 6',
                        'Cluster 7', 'Cluster 8', 'Cluster 9') 

# Pivot data to make plotting easier

km_centers <- km_centers %>% 
  rename(c('AST%' = 'AST.', 'DRB%' = 'DRB.', 'ORB%' = 'ORB.', 
           'BLK%' = 'BLK.', 'STL%' = 'STL.', 'TOV%' = 'TOV.', 
           'USG%' = 'USG.', 'TS%' = 'TS.', '3PAr' = 'X3PAr')) %>%
  pivot_longer(!Cluster, names_to = 'predictor', values_to = 'z_value')

# Reset the order of clusters for plotting

km_centers$Cluster <- factor(km_centers$Cluster, 
                             levels=c('Cluster 1', 'Cluster 2', 'Cluster 3', 
                                      'Cluster 4', 'Cluster 5', 'Cluster 6', 
                                      'Cluster 7', 'Cluster 8', 'Cluster 9'))
