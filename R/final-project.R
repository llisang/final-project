install.packages("here")
install.packages("gtsummary", dependencies = TRUE)

library(here)
library(gtsummary)
library(tidyverse)
library(ggplot2)

performance_by_nationality <- read_csv(here::here("performance_by_nationality.csv"))

names(performance_by_nationality)
tbl_summary(performance_by_nationality)

tbl_summary(
	performance_by_nationality,
			by = year,
				include = c(nationality, score, part)) |>
	add_overall(last = TRUE)


tbl_uvregression(
	performance_by_nationality,
			y = score,
				include = c(nationality, year, part),
					method = lm)


linear_model <- lm(score ~ nationality + year + part,
									 data = performance_by_nationality)


ggplot(performance_by_nationality, aes(x=score, y=type)) +
	geom_point() +
		labs(
					y = "Reason for IELTS Exam",
					x = "Test Score"
		)



