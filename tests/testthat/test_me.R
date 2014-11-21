# save as tests/testthat/test_me.R

context("check case")
# test gday() function is not case sesitive
test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("CANUCKS"))
})

context("check logical")
# test gday() returns a logical
test_that("always returns logical", {
	expect_is(gday("canucks"), "logical")
})

context("check city name")
# test gday() also works when using the city name
test_that("asking for the city works just as well", {
	expect_equal(gday("canucks"), gday("Vancouver"))
})

context("check default")
# test the default team is set to be Canucks
test_that("the default team is set to be Canucks",{
	expect_equal(gday(date = "2014-11-02"), gday( "canucks", "2014-11-02"))
	expect_equal(gday(date = "2014-11-19"), gday( "OILERS", "2014-11-19"))
})

# test the default date is set to be today
test_that("the default date is set to be today",{
	expect_equal(gday("canucks", Sys.Date()), gday(team = "canucks"))
})

context("check date")
# test that Vancouver Canucks had a game with predators on 2014-11-02
test_that("Vancouver Canucks had a game with predators on 2014-11-02", {
	expect_true(gday(team = "canucks",   date = "2014-11-02"))
	expect_true(gday(team = "predators", date = "2014-11-02"))
})

# test that Canucks didn't have a game on 2014-11-17
test_that("Vancouver Canucks didn't have a game on 2014-11-17", {
	expect_false(gday(team = "canucks",   date = "2014-11-17"))
})

# test check_date() returns True when date is in the right format
test_that("This date formate is valid", {
	expect_true(check_date(date = "2014-11-02"))
})

# test check_date() returns False when date is not in the right format
test_that("This date formate is not valid", {
	expect_false(check_date(date = "201-411-02"))
})

# test it gives an error in gday() when date is not in the right format
test_that("Wrong date type throws error", {
	expect_error(gday("Bruins", date = "201-411-12"))
})

context("check scores")
# test that scores() returns a data.frame
test_that("Score function returns a data frame", {
	expect_is(scores(Sys.Date()), "data.frame")
})

# test that scores() gives an error when invalid date entered
test_that("Can't check scores for a invalid date", {
	expect_error(scores(date = "201-411-12"))
})
