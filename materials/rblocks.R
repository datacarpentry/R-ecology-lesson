#' Creates a block grid of a given data type
#' 
#' @param nrow 
#' @examples
#' grid1 = block_grid(10, 10)
#' grid1 = block_grid(10, 10, 'matrix')
#' grid1[1]  = 'red'
#' grid1
#' grid1 = block_grid(10, type = 'vector')
#' grid1[1]  = 'red'
#' grid1
block_grid = function(nrow, ncol = nrow, type = 'data.frame', fill = "#7BEA7B"){
  data_ = matrix(fill, nrow, ncol)
  blk = switch(type,
    "data.frame" = as.data.frame(data_, stringsAsFactors = F),
    "data.table" = {library(data.table); data.table(data_)},
    "matrix" = data_,
    "vector" = rep(fill, nrow)
  )
  as.block(blk)
}

#' Display a block grid
#' 
#' The implementation here is borrowed from sna::plot.sociomatrix
display = function(block){
  if (length(dim(block)) < 2){
    data = matrix('white', length(block) - 1, length(block))
    data[1,] = block
  } else {
    data = block
  }
  n = dim(data)[1]; o = dim(data)[2]
  drawlines = TRUE
  cur_mar = par('mar')
  par(mar = c(0.5, 0.5, 0.5, 0.5))
  colors_ = c('#7BEA7B', 'red')
  plot(1, 1, xlim = c(0, o + 1), ylim = c(n + 1, 0), type = "n",
    axes = FALSE, xlab = "", ylab = ""
  )
  for (i in 1:n){
    for (j in 1:o) {
      rect(j - 0.5, i + 0.5, j + 0.5, i - 0.5, 
         col = data[i, j], xpd = TRUE, border = 'white'
      )
    }
  }
  rect(0.5, 0.5, o + 0.5, n + 0.5, col = NA, xpd = TRUE, border = 'white')
  par(mar = cur_mar)
}

print.block = function(x){
  display(x)
}

print_raw = function(x){
  class(x) = class(x)[-1]
  print(x)
}

as.block = function(x){
  class(x) = c('block', class(x))
  return(x)
}

#' Hook to crop png using imagemagick convert
#' 
#' 
hook_crop_png = function(before, options, envir){
  if (before){
    return()
  }
  ext = tolower(options$fig.ext)
  if (ext != "png") {
    warning("this hook only works with PNG at the moment")
    return()
  }
  if (!nzchar(Sys.which("convert"))) {
    warning("cannot find convert; please install and put it in PATH")
    return()
  }
  paths = knitr:::all_figs(options, ext)
  lapply(paths, function(x) {
    message("optimizing ", x)
    x = shQuote(x)
    cmd = paste("convert", if (is.character(options$convert)) 
      options$convert, x, x)
    if (.Platform$OS.type == "windows") 
      cmd = paste(Sys.getenv("COMSPEC"), "/c", cmd)
    system(cmd)
  })
  return()
}
  