# FlowjoAnalysis Package

## Load Specific Package Versions
[renv] https://rstudio.github.io/renv/articles/renv.html \
This documentation shows how to use the package renv in order to load specific versions of packages.

# Load package on local drive

1. Copy repository URL from github into your local github desktop
2. Open the rproj file
3. Make sure you have revn library loaded - install.packages("renv")
4. load library revn - library(revn)
5. Then initialize the package - renv::init()
6. Once all the packages are downloaded from the renv.lock file install the newest version of the package (Ex: FlowjoDataAnalysis_0.1.2.tar.gz)
7. Open the new package - library(FlowjoDataAnalysis)
8. Run on your data

# Functions

Needed for getFlowjoWspData()
1. Name of .wsp file
2. Name of gate
3. Name of measurement desired

Ex: getFlowjoWspData("10-Jan-2022.wsp", "Cells", "FCS-A")
