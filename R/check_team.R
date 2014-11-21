# A helper fucntion used to check whether "team" is a valid NHL team
check_team <- function(team){
	any(grepl(team, arena_team$team, ignore.case = TRUE))
}
