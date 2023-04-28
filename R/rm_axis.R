#' Remove an axis from a ggplot
#'
#' @param axis The axis to remove ("x" or "y")
#' @param line_too Whether to remove the axis line too (i.e. not just the title,
#' ticks and text)
#'
#' @examples
#'
#' data <- tibble::tibble(x = 1:3, z = 3:1)
#'
#' ggplot2::ggplot(data, ggplot2::aes(x = x, y = x)) +
#'   ggplot2::geom_line() +
#'   rm_axis("x")
#'
#' @export

# Function to remove an axis
rm_axis <- function(axis, line_too = TRUE) {

  # Build the call
  call <- c("title", "ticks", "text")
  if (line_too) call <- c(call, "line")
  call <- sprintf("axis.%s.%s = ggplot2::element_blank()", call, axis)
  call <- paste0("ggplot2::theme(", purrr::reduce(call, paste, sep = ", "), ")")

  # Evaluate the call
  eval(rlang::parse_expr(call))

}
