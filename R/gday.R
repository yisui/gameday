#' Is it Gameday?
#'
#' This function returns TRUE if you NHL team plays today and FALSE otherwise.
#'
#' You know the problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param \code{team}  The name of the team which you want to check with.
#' The default is set to be "canucks". It will also work if you just enter in
#' the city name where the team located.
#' @param \code{date}  The date gives you option to see whether the team plays or
#' played on a particular day. The default is set to be today's date.
#' @return  Logical. It returns \code{TRUE} if \code{team} has a NHL game today,
#' \code{FALSE} otherwise.
#' @keywords misc
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' ## By default, gday() is the same thing as gday("canucks", Sys.Date())
#' gday()
#' gday("Bruins", "2014-11-02")
#' gday("Vancouver")


gday <- function(team = "canucks", date = Sys.Date()){
	assertthat::assert_that(check_date(date))
	assertthat::assert_that(check_team(team))

	if (internet_connection() == FALSE){
		return("There is no internet connection! Please check.")}
	else
	url <- paste0("http://live.nhle.com/GameData/GCScoreboard/",
								date, ".jsonp")
	grepl(team, RCurl::getURL(url), ignore.case = TRUE)

	}



