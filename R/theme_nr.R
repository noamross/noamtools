#'Noam's default ggplot2 styling
#'@import ggplot2 grid
#'@export
theme_nr <-theme(text=element_text(family="Lato", face = "plain", size=14),
        panel.border = element_blank(),
        panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank(),
        panel.grid.minor.y=element_blank(),
        panel.grid.major.y=element_line(colour="#ECECEC", size=1, linetype=1),
        axis.line = element_blank(),
        axis.ticks.y=element_blank(),
   #     panel.background=element_blank(),
        legend.title=element_blank(),
        legend.key=element_rect(fill="white"),
     #   legend.key.size=unit(1.5, "cm"),
        legend.text=element_text(),
        axis.text=element_text(),
        axis.title=element_text(),
        title=element_text(),
        panel.background = element_rect(fill = "transparent", colour = NA),
        plot.background = element_rect(fill = "transparent", colour = NA))
