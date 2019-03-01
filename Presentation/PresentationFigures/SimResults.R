# Results figure for ICCM 2018 talk
d <- data.frame(Condition=c('tossed', 'thrown'), ProcessingTime=c(159.073, 149.794),
                SD=c(27.692, 24.698), PercentGrammatical=c(244/2000*100, 13/2000*100))
d$Condition <- relevel(d$Condition, 'tossed')
d$SE <- d$SD / sqrt(2000)


library(ggplot2)

f1 <- ggplot(d, aes(Condition, ProcessingTime)) +
  geom_pointrange(aes(ymin=ProcessingTime-2*SE, ymax=ProcessingTime+2*SE)) +
  labs(y='Processing time [steps]') +
  ggtitle('Mean processing times\nwith 95% CIs') +
  theme_classic(base_size = 18)

f2 <- ggplot(d, aes(Condition, PercentGrammatical)) + geom_point(size=2.5) +
  ylim(0, 13) +
  labs(y='Percent local coherence') +
  ggtitle('Percentage of runs settling \non the locally coherent parse') +
  theme_classic(base_size = 18)

library(cowplot)
plot_grid(f1, f2)
ggsave('SimResults.pdf', width = 11, height = 5, units='in')
