# Create list of player images for each graph

#ip <- c("~/Timberwolves Project/Ricky.png", "~/Timberwolves Project/Jaden.png", "~/Timberwolves Project/Pek2.png", "~/Timberwolves Project/Brew.png", "~/Timberwolves Project/Mo.png", "~/Timberwolves Project/AB.png", "~/Timberwolves Project/Ant.png", "~/Timberwolves Project/KAT.png", "~/Timberwolves Project/Bazz.png")

max_rows <- 9
gg_list <- list()
clp_list <- list()

# Additional names for clusters, color of centers in each graph, and cluster names

cluster <- c('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4',
             'Cluster 5', 'Cluster 6', 'Cluster 7', 'Cluster 8', 
             'Cluster 9')

cluster_numbers <- c(1:9)

wolves_colors <- c("#253494", "#1A9850", "#4D4D4D", "#66BD63", 
                   "#225EA8", "#081D58", "black", "#253494", "#1A9850")

wolves_colors_alpha <- adjustcolor(wolves_colors, alpha.f = 0.25)

cluster_names <- c("Ricky Rubio", "3&D", "Classic Bigs", "Ball Movement and Defense", "One-Way Combo Guards", "The Wolves Experience", "All-Around Players", "Superstar Offensive Bigs", "High Volume Scorers")

# For loop for outputs of ggplots and player name tables

for(i in seq_along(cluster)) {
  char <- cluster[i]
  num <- cluster_numbers[i]
  wc <- wolves_colors[i]
  wc_2 <- wolves_colors_alpha[i]
  cn <- cluster_names[i]
  #img <- readPNG(ip[i])
  #img_grob <- rasterGrob(img, interpolate = TRUE, width = unit(1.5, "inches"))
  
  cluster_loop <- km_centers %>% 
    filter(Cluster == char) %>%
    arrange(desc(z_value)) %>%
    ggplot(aes(x = reorder(predictor, -z_value), y = z_value, color = Cluster)) + 
    geom_point(color = wc, size = 2) +
    gghighlight(Cluster == char, use_direct_label = FALSE) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "darkgrey", linewidth = 0.75) +  
    labs(x = "Player Statistics", y = "Cluster Center", title = cn, subtitle = char) +  
    theme_minimal() +
    theme(axis.text.x = element_text(angle=45, size=10),
          plot.title = element_text(face = "bold")) +
    scale_y_continuous(breaks = seq(-3, 3, by = 1)) +
    #annotation_custom(img_grob, xmin = Inf, xmax = 10, ymin = Inf, ymax = Inf) +
    coord_cartesian(ylim = c(-3, 3), clip = "off") 
  
  gg_list[[i]] <- cluster_loop
  
  
  cluster_loop_players <- data.frame(Cluster = kmeans9$cluster, 
                                     Name = wolves_500$Player, 
                                     Season = wolves_500$Year) %>%
    filter(Cluster == num)
  
  if(nrow(cluster_loop_players) > 15) {
    sub_players <- distinct(cluster_loop_players, Name, .keep_all = TRUE)
  }
  else {
    sub_players <- cluster_loop_players
  }
  
  tab_play <- tableGrob(sub_players[, 2:3], rows = NULL, theme = 
                          ttheme_default(core = list(bg_params = list(fill = wc_2))))
  
  clp_list[[i]] <- tab_play
}

grid.arrange(gg_list[[1]], clp_list[[1]], layout_matrix = rbind(c(1, 2)))
  
grid.arrange(gg_list[[2]], clp_list[[2]], layout_matrix = rbind(c(1, 2)))

grid.arrange(gg_list[[3]], clp_list[[3]], layout_matrix = rbind(c(1, 2)))

grid.arrange(gg_list[[4]], clp_list[[4]], layout_matrix = rbind(c(1, 2)))

grid.arrange(gg_list[[5]], clp_list[[5]], layout_matrix = rbind(c(1, 2)))

grid.arrange(gg_list[[6]], clp_list[[6]], layout_matrix = rbind(c(1, 2)))

grid.arrange(gg_list[[7]], clp_list[[7]], layout_matrix = rbind(c(1, 2)))

grid.arrange(gg_list[[8]], clp_list[[8]], layout_matrix = rbind(c(1, 2)))

grid.arrange(gg_list[[9]], clp_list[[9]], layout_matrix = rbind(c(1, 2)))
