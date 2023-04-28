#' Remove facet strips from a ggplot
#'
#' @param axis Which axis to remove facets along? Either of "x", "y" or "xy".
#'
#' @examples
#'
#' data <- tibble::tibble(x = 1:3, y = 1, z = 3:1)
#'
#' ggplot2::ggplot(data, ggplot2::aes(x = x, y = x)) +
#'   ggplot2::geom_line() +
#'   ggplot2::facet_grid(. ~ y) +
#'   rm_strips()
#'
#' @export

# Function to remove strips from facets
rm_strips <- function(axis = "xy") {

  if (axis == "x") {
    ggplot2::theme(
      strip.background.x = ggplot2::element_blank(),
      strip.text.x = ggplot2::element_blank()
    )
  } else if (axis == "y") {
    ggplot2::theme(
      strip.background.y = ggplot2::element_blank(),
      strip.text.y = ggplot2::element_blank()
    )
  } else if (axis == "xy") {
    ggplot2::theme(
      strip.background = ggplot2::element_blank(),
      strip.text = ggplot2::element_blank()
    )
  } else stop("axis must be either of 'x', 'y' or 'xy'")

}
