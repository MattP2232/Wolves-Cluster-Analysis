# Mike Conley vs. Monte Morris

mc <- data.frame(Name = "Mike Conley", Season = "2023-2024")
column_widths <- unit(c(3, 3), "cm")

mike_grob <- tableGrob(mc, rows = NULL, 
                       theme = ttheme_default(core = list(bg_params = list(fill = adjustcolor("red", alpha.f = 0.25)))), 
                       widths = column_widths)

mc_mm <- rbind(mike_grob, monte_grob[2, ], size = "last")

img_4 <- readPNG("~/Timberwolves Project/Mike.png")
img_grob_4 <- rasterGrob(img_4, interpolate = TRUE, width = unit(1.36, "inches"))
img_grob_5 <- rasterGrob(img_2, interpolate = TRUE, width = unit(1.36, "inches"))

mike <- scaled_wolves[134, ]
mike <- as.data.frame(t(mike))

mike <- mike %>% 
  rename(c('AST%' = 'AST.', 'DRB%' = 'DRB.', 'ORB%' = 'ORB.', 
           'BLK%' = 'BLK.', 'STL%' = 'STL.', 'TOV%' = 'TOV.', 
           'USG%' = 'USG.', 'TS%' = 'TS.', '3PAr' = 'X3PAr', 'WS/48' = 'WS.48'))

mike_data <- gather(mike, key = "values", value = "stats")

mike_data <- mike_data %>% arrange(desc(stats))

suppressWarnings({
  monte_mike <- mike_data %>% 
    ggplot(aes(x = reorder(values, -stats), y = stats)) + 
    geom_point(color = "red", size = 2) +
    geom_point(data = long_data, aes(x = x, y = y), color = "#253494", size = 2) +
    geom_point(data = mike_data, aes(x = values, y = stats), color = "red", size = 2) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "darkgrey", linewidth = 0.75) +  
    labs(x = "Player Statistics", y = "Scaled Values", 
         title = "Mike Conley vs. Monte Morris", 
         subtitle = "Scaled Relative to Timberwolves Data Set") +  
    theme_minimal() +
    theme(axis.text.x = element_text(angle=45, size=10),
          plot.title = element_text(face = "bold"), plot.margin = ) +
    scale_y_continuous(breaks = seq(-3, 3, by = 1)) +
    annotation_custom(img_grob_5, xmin = Inf, xmax = 10, ymin = Inf, ymax = 2) +
    annotation_custom(img_grob_4, xmin = Inf, xmax = 4, ymin = Inf, ymax = 2) +
    coord_cartesian(ylim = c(-3, 3), clip = "off") 
})

cluster_grids <- grid.arrange(monte_mike, mc_mm, layout_matrix = rbind(c(1, 2)))