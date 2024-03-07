# Morris and Rubio player photos

#img_2 <- readPNG("~/Timberwolves Project/Monte.png")
#img_grob_2 <- rasterGrob(img_2, interpolate = TRUE, width = unit(1.5, "inches"))
#img_3 <- readPNG("~/Timberwolves Project/Ricky.png")
#img_grob_3 <- rasterGrob(img_3, interpolate = TRUE, width = unit(1.5, "inches"))

# Ricky and Monte Player Table

mm2 <- data.frame(Name = "Monte Morris", Season = "Career")
column_widths <- unit(c(3, 3), "cm")

monte_grob <- tableGrob(mm2, rows = NULL, 
                        theme = ttheme_default(core = list(bg_params = list(fill = adjustcolor("#253494", alpha.f = 0.25)))), 
                        widths = column_widths)

ricky <- data.frame(Cluster = kmeans9$cluster,
                    Name = wolves_500$Player, 
                    Season = wolves_500$Year) %>%
  filter(Cluster == 1)

ricky_grob <- tableGrob(ricky[, 2:3], rows = NULL, 
                        theme = ttheme_default(core = list(bg_params = list(fill = adjustcolor("red", alpha.f = 0.25)))), 
                        widths = column_widths)

combined_table <- rbind(ricky_grob, monte_grob[2, ], size = "last")

# Ricky vs. Monte Visual

suppressWarnings({
  ricky_monte <- km_centers %>% 
    filter(Cluster == "Cluster 1") %>%
    arrange(desc(z_value)) %>%
    ggplot(aes(x = reorder(predictor, -z_value), y = z_value, color = Cluster)) + 
    geom_point(color = "red", size = 2) +
    geom_point(data = long_data, aes(x = x, y = y), color = "#253494", size = 2) +
    gghighlight(Cluster == "Cluster 1", use_direct_label = FALSE) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "darkgrey", linewidth = 0.75) +  
    labs(x = "Player Statistics", y = "Cluster Center", 
         title = "Ricky Rubio vs. Monte Morris", 
         subtitle = "Cluster 1 Against Scaled Morris Statistics") +  
    theme_minimal() +
    theme(axis.text.x = element_text(angle=45, size=10),
          plot.title = element_text(face = "bold"), plot.margin = ) +
    scale_y_continuous(breaks = seq(-3, 3, by = 1)) +
    #annotation_custom(img_grob_2, xmin = Inf, xmax = 10, ymin = Inf, ymax = 2) +
    #annotation_custom(img_grob_3, xmin = Inf, xmax = 4, ymin = Inf, ymax = 2.06) +
    coord_cartesian(ylim = c(-3, 3), clip = "off") 
})

suppressWarnings({
  monte <- long_data %>% 
    ggplot(aes(x = reorder(x, y, decreasing = TRUE), y = y)) + 
    geom_point(color = "red", size = 2) +
    geom_point(data = long_data, aes(x = x, y = y), color = "#253494", size = 2) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "darkgrey", linewidth = 0.75) +  
    labs(x = "Player Statistics", y = "Scaled Morris Values", 
         title = "Monte Morris Career Statistics", 
         subtitle = "Scaled Relative to Timberwolves Data Set") +  
    theme_minimal() +
    theme(axis.text.x = element_text(angle=45, size=10),
          plot.title = element_text(face = "bold"), plot.margin = ) +
    scale_y_continuous(breaks = seq(-3, 3, by = 1)) +
    #annotation_custom(img_grob_2, xmin = Inf, xmax = 10, ymin = Inf, ymax = 2) +
    coord_cartesian(ylim = c(-3, 3), clip = "off") 
})
cluster_grids <- grid.arrange(monte, combined_table, ricky_monte, ncol = 3)
