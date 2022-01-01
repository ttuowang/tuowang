# Title: R packages that make ggplot2 more beautiful, part two
# Description: Source code
# Author: Tuo Wang
# Date: 2021-04-05

# Load packages
library(tidyverse)
library(palmerpenguins)
library(showtext)
library(ggdist)
library(ggtext)
library(patchwork)
library(ggforce)

font_add_google("Roboto", "roboto")
font_add_google("Roboto Slab", "roboto slab")
showtext_auto()

theme_set(theme_bw())
theme_update(
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


col_palette <-  c("#386cb0","#fdb462","#7fc97f")

# Load Data
data(package = 'palmerpenguins')

penguins_comp <- penguins %>%
  mutate(bill_ratio = bill_length_mm / bill_depth_mm) %>%
  mutate(species_num = as.numeric(fct_rev(species))) %>%
  drop_na()


penguins_comp %>%
  ggplot(aes(x=flipper_length_mm, y=bill_length_mm)) +
  geom_point(aes(color=species, shape=species), size=1.3, alpha=0.8,show.legend = FALSE) +
  scale_color_manual(values = c("#386cb0","#fdb462","#7fc97f")) +
  labs(
    title = "Palmer Penguins Data Visualization",
    subtitle ="*Species: <span style='color:#386cb0'>Adélie<span>
    <span style='color:#fdb462'>Chinstrap<span>
    <span style='color:#7fc97f'>Gentoo<span>*",
    x = "flip length (mm)",
    y = "bill length (mm)") +
  theme(plot.subtitle = element_markdown(
    family = "roboto", size = 15,face = "bold",),
    axis.title.y = element_text(face="bold",angle=90),
    axis.title.x = element_text(face="bold"),
    axis.text.x = element_text(size = 10, color = "black"),
    axis.text.y = element_text(size = 10, color = "black"))

ggsave(
  filename = here::here("content","post","2021-04-05-ggplot2-extensions-part2", "0.png"),
  width = 5,
  height = 5,
  device = "png"
)

text_df <- data.frame(
  x=rep(1.45,3),
  y=c(1.1,2.1,3.1),
  label=c("<span style='color:#7fc97f'>Gentoo<span>",
          "<span style='color:#fdb462'>Chinstrap<span>",
          "<span style='color:#386cb0'>Adélie<span>")
)

p1 <- penguins_comp %>%
  ggplot() +
  stat_halfeye(
    aes(x=bill_ratio, y= species_num,
        color=species,
        fill=ggplot2::after_scale(colorspace::lighten(color, 0.3))),
    shape=18, show.legend = FALSE,
    .width = c(0.8, 0.95), point_size = 3) +
  geom_richtext(data=text_df, aes(x=x,y=y,label=label), hjust=0.2,
            show.legend = FALSE, fill = NA, label.color=NA,
            family="roboto",fontface = "bold") +
  scale_color_manual(values = col_palette) +
  scale_fill_manual(values = col_palette) +
  coord_cartesian(clip = "off") +
  labs(#title = "Palmer Penguins Data Visualization",
       #subtitle = "Distribution of bill ratio (bill_length / bill_depth)",
       x = "Bill Ratio") +
  scale_y_continuous(
    limits = c(.55, NA),
    breaks = 1:3,
    expand = c(0, 0))

p2 <- penguins_comp %>%
  ggplot() +
  stat_dots(
    aes(x=bill_ratio, y= species_num,
        color=species), alpha=0.8, quantiles = 100,
    dotsize = 1.35,
    shape=16, show.legend = FALSE,
    .width = c(0.8, 0.95), ) +
  geom_richtext(data=text_df, aes(x=x,y=y,label=label), hjust=0.2,
                show.legend = FALSE, fill = NA, label.color=NA,
                family="roboto",fontface = "bold") +
  scale_color_manual(values = col_palette) +
  scale_fill_manual(values = col_palette) +
  coord_cartesian(clip = "off") +
  labs(#title = "Palmer Penguins Data Visualization",
       #subtitle = "Distribution of bill ratio (bill_length / bill_depth)",
       x = "Bill Ratio") +
  scale_y_continuous(
    limits = c(.55, NA),
    breaks = 1:3,
    expand = c(0, 0))

p1 + p2 +
  plot_annotation(
    title = "Palmer Penguins Data Visualization",
    subtitle = "Distribution of bill ratio (bill_length / bill_depth)") &
  theme(  axis.title.y = element_blank(),
          axis.text.y = element_blank())

ggsave(
  filename = here::here("content","post","2021-04-05-ggplot2-extensions-part2", "1.png"),
  width = 8,
  height = 5,
  device = "png"
)


p3  <- penguins_comp %>%
  ggplot() +
  stat_dots(
    aes(x=bill_ratio, y= species_num,
        color=species), alpha=0.8, quantiles = 100,
    dotsize = 1.3,
    shape=16, show.legend = FALSE,
    .width = c(0.8, 0.95), )  +
  stat_slab(
    aes(x=bill_ratio, y= species_num,fill=species),alpha=0.8,
    show.legend = FALSE, side = "bottom", scale = 0.5) +
  geom_richtext(data=text_df, aes(x=x,y=y,label=label), hjust=0.2,
                show.legend = FALSE, fill = NA, label.color=NA,
                family="roboto",fontface = "bold") +
  scale_color_manual(values = col_palette) +
  scale_fill_manual(values = col_palette) +
  coord_cartesian(clip = "off") +
  scale_y_continuous(
    limits = c(0.0, NA),
    breaks = 1:3,
    expand = c(0, 0)) +
  labs(#title = "Palmer Penguins Data Visualization",
       #subtitle = "Distribution of bill ratio (bill_length / bill_depth)",
       x = "Bill Ratio")

p4 <- penguins_comp %>%
  ggplot() +
  stat_dots(
    aes(x=bill_ratio, y= species_num,
        color=species), alpha=0.8, quantiles = 100,
    dotsize = 1.3,
    shape=16, show.legend = FALSE,
    .width = c(0.8, 0.95), )  +
  stat_slab(
    aes( y= species_num,x=bill_ratio,
        fill=species,
        fill_ramp = stat(cut_cdf_qi(
          cdf, .width = c(.5,.8, .95),
          labels = scales::percent_format()
        ))
    ),side = "bottom", scale = 0.5, show.legend = FALSE) +
  scale_fill_ramp_discrete(range = c(1, 0.2), na.translate = FALSE) +
  geom_richtext(data=text_df, aes(x=x,y=y,label=label), hjust=0.2,
                show.legend = FALSE, fill = NA, label.color=NA,
                family="roboto",fontface = "bold") +
  scale_color_manual(values = col_palette) +
  scale_fill_manual(values = col_palette) +
  coord_cartesian(clip = "off") +
  scale_y_continuous(
    limits = c(0.0, NA),
    breaks = 1:3,
    expand = c(0, 0)) +
  labs(#title = "Palmer Penguins Data Visualization",
       #subtitle = "Distribution of bill ratio (bill_length / bill_depth)",
       x = "Bill Ratio")

p3 + p4 +
  plot_annotation(
    title = "Palmer Penguins Data Visualization",
    subtitle = "Distribution of bill ratio (bill_length / bill_depth)") &
  theme(  axis.title.y = element_blank(),
          axis.text.y = element_blank())

ggsave(
  filename = here::here("content","post","2021-04-05-ggplot2-extensions-part2", "2.png"),
  width = 8,
  height = 5,
  device = "png"
)

### ggforce

penguins_comp %>%
  ggplot() +
  geom_point(
    aes(x=flipper_length_mm, y=bill_length_mm,color=species, shape=species),
    size=1, alpha=0.8) +
  facet_zoom(x = species == "Gentoo",zoom.size = 1.5) +
  scale_color_manual(values = col_palette) +
  labs(title = "Palmer Penguins Data Visualization",
       subtitle = "Scatter plot of flipper lenth vs bill length",
       x = "flip length (mm)",
       y = "bill length (mm)") +
  theme(
    plot.title = element_text(family = "roboto", size = 12,
                              face = "bold", color="#2a475e"),
    plot.subtitle = element_text(family = "roboto", size = 8,
                                 face = "bold", color="#1b2838"),
    legend.text = element_text(size=7, family = "roboto"),
    legend.title = element_text(face="bold", size=10, family = "roboto"),
    legend.position = c(1,0),
    legend.justification = c(1, 0),
    axis.title.y = element_text(face="bold",angle = 90,size=8),
    axis.title.x = element_text(face="bold",size=8),
    axis.text.x = element_text(size = 6, color = "black"),
    axis.text.y = element_text(size = 6, color = "black"))

ggsave(
  filename = here::here("content","post","2021-04-05-ggplot2-extensions-part2", "3.png"),
  width = 4,
  height = 6,
  device = "png"
)

penguins_comp %>%
  ggplot() +
  geom_point(
    aes(x=flipper_length_mm, y=bill_length_mm,color=species, shape=species),
    size=2, alpha=0.8) +
  geom_mark_rect(
    aes(x=flipper_length_mm, y=bill_length_mm,color=species,fill=species,
        label=species,filter = species == 'Adelie',
        description="Adelie penguins live on Togersen, Dream and Biscoe"),
    label.fill = NA, label.colour = c("#386cb0","#386cb0"),
    show.legend=FALSE,alpha=0.1) +
  scale_color_manual(values = col_palette) +
  scale_fill_manual(values = col_palette) +
  labs(title = "Palmer Penguins Data Visualization",
       subtitle = "Scatter plot of flipper lenth vs bill length",
       x = "flip length (mm)",
       y = "bill length (mm)") +
  theme(
    legend.text = element_text(size=9, family = "roboto"),
    legend.title = element_text(face="bold", size=12, family = "roboto"),
    legend.position = c(1,0),
    legend.justification = c(1, 0),
    axis.title.y = element_text(face="bold",angle = 90),
    axis.title.x = element_text(face="bold"),
    axis.text.x = element_text(size = 10, color = "black"),
    axis.text.y = element_text(size = 10, color = "black"))

ggsave(
  filename = here::here("content","post","2021-04-05-ggplot2-extensions-part2", "4.png"),
  width = 6,
  height = 6,
  device = "png"
)

penguins_comp %>%
  count(species) %>%
  mutate(focus=ifelse(species=="Chinstrap", 0.2, 0)) %>%
  ggplot() +
  geom_arc_bar(
    aes(x0 = 0, y0 = 0, r0 = 0.8, r = 1, amount = n, fill = species,explode = focus),
    alpha = 0.3, stat = "pie") +
  scale_fill_manual(values = col_palette) +
  theme(
    legend.text = element_text(size=4, family = "roboto"),
    legend.title = element_text(face="bold", size=6, family = "roboto"),
    legend.key.size = unit(0.35, 'cm'),
    legend.position = c(0.6,0.45),
    legend.justification = c(1, 0),
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    panel.grid.major.y = element_blank(),
    axis.line = element_blank()
    )

ggsave(
  filename = here::here("content","post","2021-04-05-ggplot2-extensions-part2", "5.png"),
  width = 3,
  height = 3,
  device = "png"
)


