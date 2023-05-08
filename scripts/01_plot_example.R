## ---------------------------
##
## Script name: 01_plot_example.R
##
## Purpose of script:
##
## Make example figures to illustrate a use case of the package.
##
## Prerequisites:
## - package tidyverse
## - package patchwork
## - package ggrm (https://github.com/rscherrer/ggrm)
##
## Output:
## - file figures/before.png
## - file figures/after.png
##
## Author: Raphael Scherrer
##
## Date Created: 2023-05-08
##
## This script comes with no guarantee whatsoever.
##
## Copyright (c) Raphael Scherrer, 2023
##
## Find me on GitHub at https://github.com/rscherrer
##
## Email:
## r.scherrer@rug.nl
## raphael.scherrer@evobio.eu
## raph.rjfs@hotmail.fr
##
## ---------------------------

rm(list = ls())

library(tidyverse)
library(patchwork)
library(ggrm)

theme_set(theme_classic())

set.seed(42)

# Make up some data
data <- tibble(
  t = seq(100),
  x = rnorm(100),
  y = x + rnorm(100),
  G1 = sample(3, size = 100, replace = TRUE), # first grouping factor
  G2 = letters[(sample(5, size = 100, replace = TRUE))] # second grouping factor
)

# First plot
p1 <- data %>%
  ggplot(aes(x = x, y = y)) +
  geom_point() +
  facet_grid(G2 ~ .) +
  xlab("Variable x") +
  ylab("Variable y")

# Second plot
p2 <- data %>%
  pivot_longer(x:y) %>%
  ggplot(aes(x = t, y = value, color = name)) +
  geom_line() +
  xlab("Time") +
  ylab("Variable") +
  labs(color = NULL) +
  scale_color_manual(values = c("cornflowerblue", "chocolate2")) +
  facet_grid(G2 ~ .)

# Assemble them
P1 <- wrap_plots(p1, p2)

# Save
ggsave("figures/before.png", P1, width = 6, height = 6, dpi = 300)

# Assemble again but save some space
P2 <- wrap_plots(p1 + rm_strips("y"), p2 + rm_axis("y"))

# Save
ggsave("figures/after.png", P2, width = 5, height = 6, dpi = 300)
