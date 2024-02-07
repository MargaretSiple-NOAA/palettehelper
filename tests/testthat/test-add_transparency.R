# Test to see if the output from add_transparency() is a character
add_transparency(color = "#FF5555", trans = 150) |>
  testthat::expect_type("character")

