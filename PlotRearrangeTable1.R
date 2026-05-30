library(ggplot2)

# Abbreviated region names
levels(T1.df$Region) <- c("CE", "EE", "NE", "SE", "SEE", "WE", "E")

out <- ggplot(T1.df,
              aes(x = Region,
                  y = Type,
                  fill = Standard)) +
    geom_tile(color = "white", linewidth = 0.3, show.legend = FALSE) +
    facet_wrap(~ Product, ncol = 3) +
    scale_fill_gradient2(
        low = "#2166AC",
        mid = "white",
        high = "#B2182B",
        midpoint = 0,
        name = expression(Delta)
    ) +
    coord_equal() +
    labs(
        x = NULL,
        y = NULL,
        title = NULL
    ) +
    theme_minimal(base_size = 12) +
    theme(
        panel.grid = element_blank(),
        axis.text.x = element_text(
            angle = 45,
            hjust = 1
        ),
        strip.text = element_text(face = "bold"),
        legend.position = "right"
    )
outtext <- out +
    geom_text(aes(label = round(Diff, 1)),
              size = 3
)
pdf("PlotTable1Blue.pdf", width = 8, height = 6)
outtext
dev.off()
