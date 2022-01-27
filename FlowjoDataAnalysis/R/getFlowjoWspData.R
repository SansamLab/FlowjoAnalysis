#' Pull out specific data from flowjo workspace
#'
#' Given a flowjo workspace that is in the same directory as the .fcs files, this code will generate a list of dataframes for the specific gates that are specified.
#'
#' @param wspFilename wsp file that includes gating setting and other data from flowjo
#' @param nodes nodes specifies the gate being used for the analysis
#' @param markers marker specifies the columns of data you want back. Ex: FSC-A, SSC-A, FL1-A
#' @return A list of data frames with all the data specific to each gate you specify. Each item in the list is a different sample and each data frame has the raw data.
#' @export

getFlowjoWspData <-  function(wspFilename="04-Oct-2021.wsp",
         nodes="Cells",
         markers=c("FSC-A","SSC-A","FL1-A"))
  {
  # load workspace
  data <- CytoML::open_flowjo_xml(wspFilename)
  # parse workspace and fcs files
  gs <- CytoML::flowjo_to_gatingset(data, name = 1)
  # put data
  df3 <- flowWorkspace::gs_get_singlecell_expression_by_gate(x=gs, nodes=nodes, other.markers=markers, threshold = FALSE)
  names(df3) <- gsub("\\_.*","",names(df3))
  # add names to last column and remove excess columns
  df3names <- lapply(names(df3), function(x) {
    df <- as.data.frame(df3[[x]])
    df$Sample <- x
    return(df)
  })
  names(df3names) <- gsub("\\_.*","",names(df3))
  return(df3names)
}
