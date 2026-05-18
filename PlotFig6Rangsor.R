pdf("PlotFig6Rangsor.pdf", height = 17 / 2.54, width = 11 / 2.54, pointsize = 12)
makeRangsor(RangsorO, xlim = c(-6,33))
dev.off()

pdf("PlotFig6RangsorGradient.pdf", height = 17 / 2.54, width = 11 / 2.54, pointsize = 12)
makeRangsor(RangsorO, xlim = c(-6,33), rampcolor = TRUE)
dev.off()

png("PlotFig6RangsorGradientKarcsú.png", height = 17, width =  7, pointsize = 12, units = "cm", res = 300)
par(mar=c(5.1,3.1,0.1,0.1))
makeRangsor(RangsorO, xlim = c(-11.5,32.8), SmallPlacement = -3, LastSmallPlacement = 9, rampcolor = TRUE)
dev.off()
