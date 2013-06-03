#'Noam's default ggplot2 styling
#'@import ggplot2 grid
#'@export
theme_nr <-  ggplot2::theme(text=element_text(family="Lato Light", size=14),
        panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank(),
        panel.grid.minor.y=element_blank(),
        panel.grid.major.y=element_line(colour="#ECECEC", size=0.5, linetype=1),
        axis.ticks.y=element_blank(),
        panel.background=element_blank(),
        legend.title=element_blank(),
        legend.key=element_rect(fill="white"),
        legend.key.size=unit(1.5, "cm"),
        legend.text=element_text(size=22),
        axis.title=element_text(size=24),
        axis.text=element_text(color="black",size=13))