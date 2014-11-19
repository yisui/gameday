#' What are the final scores for the games at a particular date?
#'
#' This function returns a data.frame with the final scores of the games on a
#' particular date.
#'
#' You know the problem: You're in your office writing R code and
#' suddenly have the urge to check the final scores of the games on
#' a particular date.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param \code{date}  The specified date which you want to look the final scores
#' of all the games for.
#' @return A data.frame with four columns. The first column shows the name of the home
#' team, the second column for the name of the away team. The third column gives
#' the score for the home team, while the score for the away team is given on the
#' forth column.
#' @note The \code{date} must be entered as a string in the format: "yyyy-mm-dd".
#' The score columns will be empty if a future date is entered.
#' @export
#' @examples
#' scores(Sys.Date())
#' scores("2014-11-02")
#' scores("2014-12-31")

scores <- function(date){
	assertthat::assert_that(check_date(date))

	if (internet_connection() == FALSE){
		return("There is no internet connection! Please check.")}
	else
		url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
									 date, '.jsonp')
	  raw <- RCurl::getURL(url)
	  json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
	  data <- jsonlite::fromJSON(json)$games
	  with(data,
			data.frame(home = paste(htn, htcommon),
			 					 away = paste(atn, atcommon),
			 					 home_score = hts,
			 					 away_score = ats))
}
