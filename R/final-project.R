install.packages("here")
install.packages("gtsummary", dependencies = TRUE)

library(here)
library(gtsummary)
library(tidyverse)

performance_by_nationality <- read_csv(here::here("performance_by_nationality.csv"))

names(performance_by_nationality)

tbl_summary(
	performance_by_nationality,
			by = year,
				include = c(nationality, score, part))

tbl_uvregression(
	performance_by_nationality,
			y = score,
				include = c(nationality, year, part),
					method = lm)

linear_model <- lm(score ~ nationality + year + part,
									 data = performance_by_nationality)
