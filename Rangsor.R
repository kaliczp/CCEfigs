makeRangsor <- function(x) {
    require(ggplot2)
    out <- ggplot(data = x, aes(x=Index, y=Country)) +
        geom_segment(aes(yend=Country, xend=0), colour= "darkgreen")+
        geom_vline(xintercept=0, colour = "darkgrey") +
        theme_classic() +
        labs(x = "Index [%]", y = NULL) +
        geom_text(aes(label = round(Index,1)), colour = "black", size = 2.9)+
        scale_y_discrete(labels = x$Country) +
    guides(y = "none")

    out
}
