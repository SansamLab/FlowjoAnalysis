# FlowjoAnalysis
Package to help utilize R in Flowjo data analysis.

# Load package on local drive
1. Copy repository URL from github into your local github desktop
2. Open the rproj file
3. Make sure you have renv library installed - install.packages("renv")
4. load library renv - library(renv)
5. Then initialize the package - renv::init()
6. Once all the packages are downloaded from the renv.lock file, install the newest version of the package (Ex: FlowjoDataAnalysis_0.1.2.tar.gz)
7. Open the new package - library(FlowjoDataAnalysis)
8. Run on your data
9. Output is a list of samples in dataframes with all values associated with that gate and measuement

### Load Specific Package Versions (additional help)
[renv] https://rstudio.github.io/renv/articles/renv.html \
This documentation shows how to use the package renv in order to load specific versions of packages.


# Function
Parameter for getFlowjoWspData()
1. Name of .wsp file
2. Name of gate
3. Name of measurement desired

Ex: getFlowjoWspData("10-Jan-2022.wsp", "Cells", "FCS-A")
