#' Pull out specific data from flowjo workspace
#'
#' Given a flowjo workspace and a list of .fcs files this code will generate a list of dataframes and specific gates can be specified.
#'
#' @param colData a file that contains all your sample names and all associate labels
#' @param ChannelValueList this is the parsed workspace with gate info. This is essentially the output from getFlowjoWspData function
#' @return A list of data frames with all the data specific to each gate. Each item in the list is a different samlpe and each data frame has the raw data.
#' @export


# background subtract function
BackgroundSubtract <- function(colData = colData,
                               ChannelValueList = insolubleG1){
  colDataList <- split(coldata,f=coldata$Treated)
  tst <- lapply(colDataList,function(colDataSubset){
    # subset channel value list to get the control numbers
    controlNumbers <- ChannelValueList[[colDataSubset$Control]]
    # subset y axis values
    controlNumbers <- controlNumbers[,colDataSubset$yaxischannel]
    # calculate median
    controlMedian <- median(controlNumbers)
    # subset channel value list to get the treated numbers
    treatedNumbers <- ChannelValueList[[colDataSubset$Treated]]
    # add backgroundsubtracted y axis values
    treatedNumbers$bcgrndSub <- treatedNumbers[,colDataSubset$yaxischannel] - controlMedian
    return(treatedNumbers)
  })
  return(tst)
}
