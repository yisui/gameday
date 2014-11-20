# Package Gameday
Yi Sui  
20 November, 2014  

## Introduction

The `gameday` package provides a convenient way to know whether a specified NHL team has a 
game on a specified date and final scores of all the games on a specified date through `r` 
instead of the traditional way -- searching on the Internet.

## How to install Gameday

`gameday` package can be easily installed from GitHub, we need to do that:

```r
library(devtools)
install_github("yisui/gameday")
```

__NOTE: Here the package `devtools` is needed.__

## How gameday works

To see how `gameday` works, we need to first load the `gameday` package as

```r
# load the "gameday" package 
library(gameday)
```

There are two functions `gday(team, date)` and `scores(date)` in the `gameday` package. 
gday(team, date) gives an option to check whether a specified NHL team has a 
game on a specified date. For example, if we want to know whether Minnesota Wild has a 
game on the "2014-11-18", we can do:

```r
gday("wild", "2014-11-18")
```

```
## [1] FALSE
```

The `scores(date)` function gives the option to display the final scores of all the games 
on a specified date as a `data.frame`. For example, if we want to know all the game 
results on "2014-11-19", we can do:

```r
scores("2014-11-19")
```

```
##                 home                away home_score away_score
## 1 NY RANGERS RANGERS PHILADELPHIA FLYERS          2          0
## 2    EDMONTON OILERS   VANCOUVER CANUCKS          4          5
```

## How to access vignette

A more detailed manual of the `gameday` package and its functions can be found in the 
vignette. To access the vigette, after loading the `gameday` package, you run the 
following command in the `r` console:

```r
browseVignettes(package = "gameday")
```

Then you can click on `HTML` to get a overview of the `gameday` package.
