
library(tidyverse)

penguins_comp <- penguins %>%
  drop_na()

penguins_comp %>%
  ggplot(aes(x=flipper_length_mm, y=bill_length_mm)) +
  geom_point(aes(color=species, shape=species), size=2, alpha=0.8) +
  labs(
    title = "Palmer Penguins Data Visualization",
    subtitle = "Scatter plot of flipper lenth vs bill length",
    x = "flip length (mm)",
    y = "bill length (mm)"
  )


library(scales)

scale_fill_tuo <- function(...){
  discrete_scale(
    "fill","tuo",
    scales::manual_pal(
      values = c(
        "#386cb0","#fdb462","#7fc97f",
        "#ef3b2c","#662506","#a6cee3",
        "#fb9a99","#984ea3","#ffff33", "#000099")),
    ...)
}

scale_colour_tuo <- function(...){
  discrete_scale(
    "colour","tuo",
    scales::manual_pal(
      values = c(
        "#386cb0","#fdb462","#7fc97f",
        "#ef3b2c","#662506","#a6cee3",
        "#fb9a99","#984ea3","#ffff33","#000099")),
    ...)
}

penguins_comp %>%
  ggplot(aes(x=flipper_length_mm, y=bill_length_mm)) +
  geom_point(aes(color=species, shape=species), size=2, alpha=0.8) +
  labs(
    title = "Palmer Penguins Data Visualization",
    subtitle = "Scatter plot of flipper lenth vs bill length",
    x = "flip length (mm)",
    y = "bill length (mm)"
  ) +
  scale_colour_tuo()

ggsave(
  filename = here::here("content","post","2021-04-25-color-in-ggplot2", "3.png"),
  width = 6,
  height = 5,
  device = "png"
)


theme_tuo <- function(...){
  library(showtext)
  font_add_google("Roboto", "roboto")
  showtext_auto()
  theme(
    text = element_text(family = "roboto", size = 8, color = "black"),
    plot.title = element_text(family = "roboto", size = 15,
                              face = "bold", color="#2a475e"),
    plot.subtitle = element_text(family = "roboto", size = 10,
                                 face = "bold", color="#1b2838"),
    plot.caption = element_text(size = 10),
    axis.title.y = element_text(face="bold", angle=90),
    axis.title.x = element_text(face="bold"),
    axis.text.x = element_text(size = 10, color = "black"),
    axis.text.y = element_text(size = 10, color = "black"),
    axis.title = element_text(size=12),
    rect = element_blank(),
    panel.grid = element_line(color = "#b4aea9"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.title.position = "plot",
    panel.grid.major.y = element_line(linetype="dashed"),
    axis.ticks = element_blank(),
    axis.line = element_line(colour = "grey50"),
    plot.background = element_rect(fill = '#fbf9f4', color = '#fbf9f4')
  )
}

