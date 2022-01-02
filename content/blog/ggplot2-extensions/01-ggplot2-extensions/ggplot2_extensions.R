# Title: R packages that make ggplot2 more beautiful
# Description: Source code
# Author: Tuo Wang
# Date: 2021-03-28

# Load packages
library(tidyverse)
library(palmerpenguins)
library(skimr)
library(showtext)
library(patchwork)
library(ggrepel)


# Load Data
data(package = 'palmerpenguins')

skim(penguins)
skim(penguins_raw)

font_add_google("Poppins", "poppins")
font_add_google("Lobster Two", "lobstertwo")
font_add_google("Roboto", "roboto")
showtext_auto()

penguins_comp <- penguins %>%
  drop_na()

theme_set(theme_bw())
theme_update(
  legend.text = element_text(size=9, family = "roboto"),
  legend.title = element_text(face="bold", size=12, family = "roboto"),
  legend.position = c(1,0),
  legend.justification = c(1, 0),
  text = element_text(family = "lobstertwo", size = 8, color = "black"),
  plot.title = element_text(family = "lobstertwo", size = 20,
                            face = "bold", color="#2a475e"),
  plot.subtitle = element_text(family = "lobstertwo", size = 15,
                               face = "bold", color="#1b2838"),
  plot.caption = element_text(size = 10),
  axis.text = element_text(size = 10, color = "black"),
  axis.title = element_text(size=12),
  rect = element_blank(),
  panel.grid = element_line(color = "#b4aea9"),
  panel.grid.minor = element_blank(),
  panel.grid.major.x = element_blank(),
  plot.title.position = "plot",
  #plot.caption.position = "plot",
  #panel.grid.major.x = element_line(linetype="dashed"),
  #panel.grid.major.y = element_blank(),
  panel.grid.major.y = element_line(linetype="dashed"),
  axis.ticks = element_blank(),
  axis.line = element_line(colour = "grey50"),
  plot.background = element_rect(fill = '#fbf9f4', color = '#fbf9f4')
)

# 1. Font
penguins_comp %>%
  ggplot(aes(x=flipper_length_mm, y=bill_length_mm)) +
  geom_point(aes(color=species, shape=species), size=2, alpha=0.8) +
  scale_color_manual(values = c("#386cb0","#fdb462","#7fc97f")) +
  labs(title = "Palmer Penguins Data Visualization",
       subtitle = "Scatter plot of flipper lenth vs bill length",
       x = "flip length (mm)",
       y = "bill length (mm)")

ggsave(
  filename = here::here("content","post","2021-03-25-ggplot2-extensions", "1.png"),
  width = 5,
  height = 4,
  device = "png"
)

# 2. Patchwork
# +
p1 <- penguins_comp %>%
  ggplot(aes(x=flipper_length_mm, y=bill_length_mm)) +
  geom_point(aes(color=species, shape=species), size=2, alpha=0.8) +
  scale_color_manual(values = c("#386cb0","#fdb462","#7fc97f")) +
  labs(x = "flip length (mm)",
       y = "bill length (mm)")

p2 <- penguins_comp %>%
  ggplot(aes(x=bill_length_mm, y=bill_depth_mm)) +
  geom_point(aes(color=species, shape=species), size=2, alpha=0.8) +
  scale_color_manual(values = c("#386cb0","#fdb462","#7fc97f")) +
  labs(x = "bill length (mm)",
       y = "bill depth (mm)")

p1 + p2 +
  plot_layout(guides = "collect") +
  plot_annotation(
    title = "Palmer Penguins Data Visualization",
    subtitle = "Scatter plots, left: flip length vs bill lengtt; right: bill length vs bill depth") &
  theme(legend.position = "bottom",
        legend.justification = "center")

ggsave(
  filename = here::here("content","post","2021-03-25-ggplot2-extensions", "2.png"),
  width = 7,
  height = 4,
  device = "png"
)

# /
p3 <- penguins_comp %>%
  ggplot(aes(x = sex, fill = species)) +
  geom_bar(alpha = 0.8,width=0.6, show.legend = FALSE) +
  scale_fill_manual(values = c("#386cb0","#fdb462","#7fc97f")) +
  facet_wrap(~species, ncol = 3) +
  theme(
    strip.text = element_text(size=12, face="bold")
    )

(p1 + p2) / p3 +
  plot_layout(guides = "collect") +
  plot_annotation(
    title = "Palmer Penguins Data Visualization") &
  theme(legend.position = "bottom",
        legend.justification = "center")

ggsave(
  filename = here::here("content","post","2021-03-25-ggplot2-extensions", "3.png"),
  width = 7,
  height = 7,
  device = "png"
)

# inset
p4 <- penguins_comp %>%
  ggplot() +
  geom_jitter(aes(x=species, y=bill_depth_mm, color=species),
              width = 0.1,
              alpha = 0.8,
              size=2,
              show.legend = FALSE) +
  scale_color_manual(values = c("#386cb0","#fdb462","#7fc97f"))+
  labs(title = "Palmer Penguins Data Visualization",
       y = "bill depth (mm)")

p5 <- penguins_comp %>%
  ggplot() +
  geom_jitter(aes(x=species, y=bill_length_mm, color=species),
              width = 0.1,
              alpha = 0.7,
              show.legend = FALSE) +
  scale_color_manual(values = c("#386cb0","#fdb462","#7fc97f")) +
  labs(y = "bill length (mm)")+
  theme(axis.title.x = element_blank())

p4 + inset_element(p5,left = 0.6, bottom = 0.55, right = 1, top = 1)

ggsave(
  filename = here::here("content","post","2021-03-25-ggplot2-extensions", "4.png"),
  width = 6,
  height = 5,
  device = "png"
)


# ggrepel

install.packages("randomNames")
library(randomNames)

set.seed(2021+03+27)
name_vector <- randomNames(nrow(penguins_comp), which.names = "first")

penguins_comp %>%
  mutate(
    name = name_vector,
    highlight = case_when(
      str_starts(name, "C") ~ name,
      TRUE ~ ""
      )) %>%
  ggplot(aes(x=flipper_length_mm, y=bill_length_mm)) +
  geom_point(aes(color=species, shape=species), size=1.5, alpha=0.8) +
  geom_text_repel(aes(label=highlight),family = "poppins",size=3,
                  min.segment.length = 0, seed = 42, box.padding = 0.5,
                  max.overlaps = Inf,
                  arrow = arrow(length = unit(0.010, "npc")),
                  nudge_x = .15,
                  nudge_y = .5,
                  color="grey50")+
  scale_color_manual(values = c("#386cb0","#fdb462","#7fc97f")) +
  labs(title = "Palmer Penguins Data Visualization",
       subtitle = "Scatter plot of flipper lenth vs bill length",
       x = "flip length (mm)",
       y = "bill length (mm)")

ggsave(
  filename = here::here("content","post","2021-03-25-ggplot2-extensions", "5.png"),
  width = 6,
  height = 6,
  device = "png"
)

# ggradar
library(ggradar)

penguins_radar <- penguins_comp %>%
  group_by(species) %>%
  summarise(avg_bill_length = mean(bill_length_mm),
            avg_bill_dept = mean(bill_depth_mm),
            avg_flipper_length = mean(flipper_length_mm),
            avg_body_mass = mean(body_mass_g)) %>%
  ungroup() %>%
  mutate_at(vars(-species), rescale)

penguins_radar %>%
  ggradar(
    font.radar = "roboto",
    grid.label.size = 4, axis.label.size = 2.7,
    group.point.size = 3,
    legend.position = "bottom",legend.text.size = 7,
    plot.title = "Radar plot of penguins species") +
  theme(
    legend.text = element_text(size=9, family = "roboto"),
    legend.title = element_text(face="bold", size=12, family = "roboto"),
    legend.position = c(1,0),
    legend.justification = c(1, 0),
    legend.key  = element_rect(fill = NA, color = NA),
    text = element_text(family = "roboto", size = 8, color = "black"),
    plot.title = element_text(family = "lobstertwo", size = 20,
                              face = "bold", color="#2a475e"),
    plot.subtitle = element_text(family = "roboto", size = 15,
                                 face = "bold", color="#1b2838"),
    rect = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.title.position = "plot",
    panel.grid.major.y = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_blank(),
    plot.background = element_rect(fill = '#fbf9f4', color = '#fbf9f4')
  )

ggsave(
  filename = here::here("content","post","2021-03-25-ggplot2-extensions", "6.png"),
  width = 5.7,
  height = 5,
  device = "png"
)


# ggstatsplot
library(ggstatsplot)

ggbetweenstats(
  data = penguins_comp,
  x = species,
  y = bill_length_mm,
  title = "Distribution of bill length across penguins species",
  xlab = "Penguins Species",
  ylab = "Bill Length"
) +
  theme(
    text = element_text(family = "roboto", size = 8, color = "black"),
    plot.title = element_text(family = "lobstertwo", size = 20,
                              face = "bold", color="#2a475e"),
    plot.subtitle = element_text(family = "roboto", size = 15,
                                 face = "bold", color="#1b2838"),
    axis.text = element_text(size = 10, color = "black"),
    axis.title = element_text(size=12),
    rect = element_blank(),
    panel.grid = element_line(color = "#b4aea9"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.title.position = "plot",
    #plot.caption.position = "plot",
    #panel.grid.major.x = element_line(linetype="dashed"),
    #panel.grid.major.y = element_blank(),
    panel.grid.major.y = element_line(linetype="dashed"),
    axis.ticks = element_blank(),
    axis.line = element_line(colour = "grey50"),
    plot.background = element_rect(fill = '#fbf9f4', color = '#fbf9f4')
  )

ggsave(
  filename = here::here("content","post","2021-03-25-ggplot2-extensions", "7.png"),
  width = 8,
  height = 8,
  device = "png"
)


# library(gggibbous)
#
# tidymoons <- data.frame(
#   x = rep(1:3, 6),
#   y = rep(rep(3:1, each = 3), 2),
#   ratio = c(1:9 / 10, 9:1 / 10),
#   right = rep(c(TRUE, FALSE), each = 9)
# )
#
# ggplot(tidymoons) +
#   geom_moon(aes(x, y, ratio = ratio, right = right, fill = right)) +
#   lims(x = c(0.5, 3.5), y = c(0.5, 3.5))
#
#
# a <- penguins_comp %>%
#   mutate(female=case_when(
#     sex == 'female' ~ 1,
#     TRUE ~ 0
#   )) %>%
#   group_by(island) %>%
#   summarise(
#     n_female=sum(female),
#     n_male=sum(1-female),
#     n_total=n()) %>%
#   mutate(
#     prop_female = n_female/n_total,
#     prop_male = n_male/n_total,
#     x = c(1:3)
#     ) %>%
#   pivot_longer(
#     cols = starts_with("prop"),values_to = "ratio", names_to = "right",
#     names_transform = list(right=function(x) x=="prop_female")
#     )
#
# ggplot(a) +
#   geom_moon(aes(x=island, y=1, ratio=ratio, right=right, fill=right))


library(ggalluvial)
titanic_wide <- data.frame(Titanic)
head(titanic_wide)
#>   Class    Sex   Age Survived Freq
#> 1   1st   Male Child       No    0
#> 2   2nd   Male Child       No    0
#> 3   3rd   Male Child       No   35
#> 4  Crew   Male Child       No    0
#> 5   1st Female Child       No    0
#> 6   2nd Female Child       No    0
ggplot(data = titanic_wide,
       aes(axis1 = Class, axis2 = Sex, axis3 = Age,
           y = Freq)) +
  scale_x_discrete(limits = c("Class", "Sex", "Age"), expand = c(.2, .05)) +
  xlab("Demographic") +
  geom_alluvium(aes(fill = Survived)) +
  geom_stratum() +
  geom_text(stat = "stratum", aes(label = after_stat(stratum))) +
  scale_fill_manual(values = c("#386cb0","#fdb462"))




