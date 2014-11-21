## ------------------------------------------------------------------------
library(gameday)

## ------------------------------------------------------------------------
# check whether "Canucks" has a game today
gday()

## ------------------------------------------------------------------------
# check whether "Bruins" has a game on "2014-11-02"
gday("Bruins", "2014-11-02")

## ------------------------------------------------------------------------
# apply gday() to "Canucks"
gday("Canucks")

# apply gday() to "canucks"
gday("canucks")

# confirm gday() is not case sensitive
identical(gday("Canucks"), gday("canucks"))

## ------------------------------------------------------------------------
# apply gday() to "canucks"
gday("canucks")

# apply gday() to "Vancouver"
gday("Vancouver")

# confirm asking by the city name also works
identical(gday("canucks"), gday("Vancouver"))

## ----, results='asis'----------------------------------------------------
# look up the scores for the games on "2014-11-19"
knitr::kable(scores("2014-11-19"))

## ------------------------------------------------------------------------
# load package "dplyr"
suppressPackageStartupMessages(library(dplyr))

## ------------------------------------------------------------------------
# look for the winning teams  on "2014-11-18"
scores_data <- scores("2014-11-18")

scores_data %>%
	mutate(winning_team = ifelse(home_score > away_score, as.character(home), 
															as.character(away))) %>%
	select(winning_team)

