# Package gameday
Yi Sui  
20 November, 2014  

## Introduction

The `gameday` package provides a convenient way to know whether a specified NHL team has a 
game on a specified date and scores of all the games on a specified date through `R` 
instead of the traditional way -- searching on the Internet.

## How to install gameday

`gameday` package can be easily installed from GitHub. To install the package,
we need to do this:

```r
library(devtools)
install_github("yisui/gameday")
```

__NOTE: Here the package `devtools` is needed. To make sure vignette get built, we can 
inculde `build_vignettes = TRUE` in `install_github()`.__

## How gameday works

To see how `gameday` works, we need to first load the `gameday` package using

```r
# load the "gameday" package 
library(gameday)
```

There are two functions `gday(team, date)` and `scores(date)` in the `gameday` package. 
`gday(team, date)` is used to check whether a specified NHL team has a 
game on a specified date. For example, if we want to know whether Minnesota Wild has a 
game on the "2014-11-18", we can do:

```r
gday("wild", "2014-11-18")
```

```
## [1] FALSE
```

The `scores(date)` function gives the scores of all the games 
on a specified date as a `data.frame`. For example, if we want to know all the game 
results on "2014-11-19", we can do:

```r
knitr::kable(scores("2014-11-19"), format = "markdown")
```



|home               |away                | home_score| away_score|stage |live_gamecenter |
|:------------------|:-------------------|----------:|----------:|:-----|:---------------|
|NY RANGERS RANGERS |PHILADELPHIA FLYERS |          2|          0|FINAL |TRUE            |
|EDMONTON OILERS    |VANCOUVER CANUCKS   |          4|          5|FINAL |TRUE            |

__NOTE: `scores(date)` also returns a column "stage" shows the current 
stage of the game.__ If a game haven't 
started yet, in the "stage" column it will show the game starting time in EST. If the 
game is in progress, it will show which period the game is at and the remaining time for
this period. If a game has finished, it will show "Final". The `TRUE` in the column 
"live_gamecenter" means this game is live on "gamecenter".


## How to access vignette

A more detailed manual of the `gameday` package and its functions can be found in the 
vignette. To access the vignette, after loading the `gameday` package, you run the 
following command in the `R` console:

```r
browseVignettes(package = "gameday")
```

Then you can click on `HTML` to get a overview of the `gameday` package.

You can also read the `Rmarkdown` file for the vignette of `gameday` [here](https://github.com/yisui/gameday/blob/master/vignettes/overview.Rmd).

__NOTE: There are some very useful discussion about "vignettes" at our class discussion 
board [here](https://github.com/STAT545-UBC/Discussion/issues/68). For me, I removed 
"inst/doc" from ".gitigonre" to make sure vignette works.__ 
