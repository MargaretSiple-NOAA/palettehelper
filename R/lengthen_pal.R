#' Lengthen color palette
#'
#' @param newlength numeric. Length you need your new palette to be.
#' @param shortpal A character vector of color names or hex codes; your "starter palette".
#'
#' @return a new character vector containing a new palette of length newlength
#' @export
#'
#' @examples
#' lengthen_pal(shortpal = c('red','yellow','blue'))
lengthen_pal <- function(newlength = 10, shortpal) {
  newpal <- grDevices::colorRampPalette(shortpal)(newlength)
  return(newpal)
}
