makeRangsor <- function(x, xlim = NULL, shape = "rectangle") {
    basecolour <- "darkgreen"
    require(ggplot2)
    x$PlotData <- sprintf("%.1f", round(x$Index, digits = 1))
    x$Place <- -0.5
    x[1:4, "Place"] <- -1.2
    out <- ggplot(data = x, aes(x=Index, y=Country)) +
        geom_segment(aes(yend=Country, xend=0), colour= basecolour)+
        geom_vline(xintercept=0, colour = "darkgrey") +
        theme_classic() +
        labs(x = "Index [%]", y = NULL) +
        geom_text(aes(x = Place, label = Country, hjust = "right"),
                               colour = basecolour) +
        guides(y = "none")
    if(shape == "rectangle") {
        out <- out + geom_label(aes(label = PlotData),
                                colour = "white" , size = 2.9, fill = basecolour)
    } else {
        out <- out + geom_text(aes(label = PlotData),
                               colour = "black", size = 2.9)
    }
    if(!is.null(xlim)) {
        out <- out + scale_x_continuous(limits = xlim)
    }
    out
}
