makeRangsor <- function(x, xlim = NULL, shape = "rectangle", rampcolor = FALSE, SmallPlacement = -1.2, LastSmallPlacement = 4) {
    basecolour <- "#8B7355"
    boxcolour <- "#53868B"
    require(ggplot2)
    x$PlotData <- sprintf("%.1f", round(x$Index, digits = 1))
    x$Place <- -0.5
    x[1:LastSmallPlacement, "Place"] <- SmallPlacement
    out <- ggplot(data = x, aes(x=Index, y=Country)) +
        geom_segment(aes(yend=Country, xend=0), colour= basecolour)+
        geom_vline(xintercept=0, colour = "darkgrey") +
        theme_classic() +
        labs(x = "Index [%]", y = NULL) +
        geom_text(aes(x = Place, label = Country, hjust = "right"),
                               colour = basecolour) +
        theme(
            axis.line.y  = element_blank(),
            axis.text.y  = element_blank(),
            axis.ticks.y = element_blank(),
            axis.title.y = element_blank()
        )
    if(shape == "rectangle") {
        if(rampcolor) {
            out <- out + geom_label(aes(label = PlotData, fill = Index),
                                    border.colour = "#8B0000",
                                    text.colour = "white" , size = 2.9, show.legend = FALSE) +
                scale_fill_gradient(low = "#f4e0b6", high = "#762419")
        } else {
            out <- out + geom_label(aes(label = PlotData),
                                    colour = "white" , size = 2.8, fill = boxcolour)
        }
    } else {
        out <- out + geom_text(aes(label = PlotData),
                               colour = "black", size = 2.9)
    }
    if(!is.null(xlim)) {
        out <- out + scale_x_continuous(limits = xlim, breaks = seq(0, 30, by = 10))
    }
    out
}
