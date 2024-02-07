expect_hex <- function(xx) {
  if (grepl(pattern = "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$", x = xx)) {
    testthat::succeed()
    return(invisible(xx))
  } else {
    message <- "Does not return a valid hex color"
    testthat::fail(message)
  }
}

# Test to see if it returns a valid hex code
lengthen_pal(shortpal = c("red", "green"), newlength = 3)[1] |>
  expect_hex()

lengthen_pal(shortpal = c("red", "green"), newlength = 6) |>
  testthat::expect_length(n = 6)
