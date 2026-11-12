library(ggplot2)
levels(TnewNov$Region) <- c("CE", "EE", "NE", "SE", "SEE", "WE", "EU", "E")

out <- ggplot(TnewNov,
              aes(x = Region,
                  y = Type,
                  fill = Value)) +
    geom_tile(color = "white", linewidth = 0.5, show.legend = FALSE) +
    facet_wrap(~ Product, ncol = 2) +
    scale_fill_gradient2(
        low = "white",
        high = "#B2182B",
        name = NULL
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
    geom_text(aes(label = round(Value, 2)),
              size = 3
)

pdf("PlotTableNewNov.pdf", width = 6, height = 5)
outtext
dev.off()
