# A helper fucntion used to check whether "date" is in the right format
check_date <- function(date) {
	tryCatch({date = as.Date(date); TRUE},
					 error = function(err) FALSE)
}
