#' Add transparency to a color
#'
#' @param color character hex color that you want to add transparency to
#' @param trans integer value between 0 and 255, with 0 being fully transparent and 255 being fully visible
#'
#' @return A character hex value for the transparent version of your color
#' @export
#'
#' @examples
#' color_in <- "#FF5555"
#' color_alpha <- add_transparency(color = color_in, trans = 255/2)
#' plot(1:3, rep(5,times = 3), col = color_alpha, pch = 19)
#' points(1:3, rep(3, times = 3),col = color_in, pch = 19)

add_transparency <- function(color, trans) {
  # This function adds transparency to a color.
  # Works with either color and trans a vector of equal length,
  # or one of the two of length 1.

  if (length(color) != length(trans) & !any(c(length(color), length(trans)) == 1)) stop("Vector lengths not correct")
  if (length(color) == 1 & length(trans) > 1) color <- rep(color, length(trans))
  if (length(trans) == 1 & length(color) > 1) trans <- rep(trans, length(color))

  num2hex <- function(x) {
    hex <- unlist(strsplit("0123456789ABCDEF", split = ""))
    return(paste(hex[(x - x %% 16) / 16 + 1], hex[x %% 16 + 1], sep = ""))
  }

  rgb <- rbind(grDevices::col2rgb(color), trans)
  res <- paste("#", apply(apply(rgb, 2, num2hex), 2, paste, collapse = ""), sep = "")
  return(res)
}
