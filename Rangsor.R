makeRangsor <- function(x, xlim = NULL) {
    basecolour <- "darkgreen"
    require(ggplot2)
    x$Place <- -0.5
    out <- ggplot(data = x, aes(x=Index, y=Country)) +
        geom_segment(aes(yend=Country, xend=0), colour= basecolour)+
        geom_vline(xintercept=0, colour = "darkgrey") +
        theme_classic() +
        labs(x = "Index [%]", y = NULL) +
        geom_text(aes(label = round(Index,1)), colour = "black", size = 2.9) +
        geom_text(aes(x = Place, label = Country, hjust = "right"),
                               colour = basecolour) +
        guides(y = "none")
    if(!is.null(xlim)) {
        out <- out + scale_x_continuous(limits = xlim)
    }
    out
}
