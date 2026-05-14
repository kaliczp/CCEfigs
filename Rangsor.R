makeRangsor <- function(x) {
    require(ggplot2)
    out <- ggplot(data = x, aes(x=Index, y=Country)) +
        geom_segment(aes(yend=Country, xend=0), colour= "darkgreen")+
        geom_vline(xintercept=0, colour = "darkgrey")
    out
}
