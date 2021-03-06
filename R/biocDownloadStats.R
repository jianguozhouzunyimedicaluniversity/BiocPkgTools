#' get bioconductor download stats
#'
#' @details Note that bioconductor package download
#' stats are not version-specific.
#'
#' @importFrom utils read.table
#' @importFrom tibble as_tibble
#' 
#' @return a \code{data.frame} of download stats for
#' all bioconductor packages, in tidy format
#'
#' @examples
#' biocDownloadStats()
#'
#' @export
biocDownloadStats = function() {
  tmp = read.table('http://bioconductor.org/packages/stats/bioc/bioc_pkg_stats.tab',
                   sep="\t", header = TRUE)
  tmp$repo = 'Software'
  tmp2 = read.table('http://bioconductor.org/packages/stats/data-annotation/annotation_pkg_stats.tab',
                    sep="\t", header = TRUE)
  tmp2$repo = 'AnnotationData'
  tmp3 = read.table('http://bioconductor.org/packages/stats/data-experiment/experiment_pkg_stats.tab',
                    sep="\t", header = TRUE)
  tmp3$repo = 'ExperimentData'
  tmp = rbind(tmp,tmp2,tmp3)
  as_tibble(tmp)
}
