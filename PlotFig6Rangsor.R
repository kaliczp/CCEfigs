pdf("PlotFig6Rangsor.pdf", height = 17 / 2.54, width = 11 / 2.54, pointsize = 12)
makeRangsor(RangsorO, xlim = c(-6,33))
dev.off()

pdf("PlotFig6RangsorGradient.pdf", height = 17 / 2.54, width = 11 / 2.54, pointsize = 12)
makeRangsor(RangsorO, xlim = c(-6,33), rampcolor = TRUE)
dev.off()
