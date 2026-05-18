library(ggplot2)

out <- ggplot(T1.diff.nsum,
              aes(x = Variable,
                  y = Region,
                  fill = Diff)) +
    geom_tile(color = "white", linewidth = 0.3) +
    facet_wrap(~ Type, ncol = 3) +
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
        title = "Changes between the two periods"
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
    ) +
    geom_text(aes(label = round(Diff, 1)),
              size = 3)

pdf("Table1Heat.pdf")
out
dev.off()
