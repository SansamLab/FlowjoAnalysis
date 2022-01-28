#' Background subtract the median control from y-axis column
#'
#' Given a parsed flowjo workspace and a colData file, this function will background subtract the median value of the control from the treated samples.
#'
#' @param colData a file that contains all your sample names and all associate labels
#' @param ChannelValueList this is the parsed workspace with gate info. This is essentially the output from getFlowjoWspData function
#' @return A data frame with a column with background subtracted values. This output can be plotted with ggplot2
#' @export


# background subtract function
BackgroundSubtract <- function(colData = "colData",
                               ChannelValueList = "ChannelValueList"){
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
