# save as tests/testthat/test_me.R

test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("CANUCKS"))
})

test_that("always returns logical", {
	expect_is(gday("canucks"), "logical")
})

test_that("asking for the city works just as well", {
	expect_equal(gday("canucks"), gday("Vancouver"))
})

test_that("the default team is set to be Canucks",{
	expect_equal(gday(date = "2014-11-02"), gday( "canucks", "2014-11-02"))
})

test_that("the default date is set to be today",{
	expect_equal(gday("canucks", Sys.Date()), gday(team = "canucks"))
})

test_that("Vancouver Canucks had a game on 2014-11-02", {
	expect_true(gday(team = "canucks",   date = "2014-11-02"))
	expect_true(gday(team = "predators", date = "2014-11-02"))
})

test_that("Vancouver Canucks didn't have a game on 2014-11-17", {
	expect_false(gday(team = "canucks",   date = "2014-11-17"))
})

test_that("This date formate is valid", {
	expect_true(check_date(date = "2014-11-02"))
})

test_that("This date formate is not valid", {
	expect_false(check_date(date = "201-411-02"))
})

test_that("Wrong date type throws error", {
	expect_error(gday("Bruins", date = "201-411-12"))
})

test_that("Score function returns a data frame", {
	expect_is(scores(Sys.Date()), "data.frame")
})

test_that("Can't check scores for a invalid date", {
	expect_error(scores(date = "201-411-12"))
})
