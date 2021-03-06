% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/findSegments.R
\name{findSegmentsFast}
\alias{findSegmentsFast}
\title{Find Segments in the provided CN data for set parameters}
\usage{
findSegmentsFast(data, ctrl, ctrlAll, arrayType = "auto")
}
\arguments{
\item{data}{CN data to evaluate}

\item{ctrl}{CN data of controls, levels to test to (1 mean / median
over all ctrl samples)}

\item{ctrlAll}{CN data of all control samples}

\item{arrayType}{"auto","450k", "EPIC"; auto -> tries to automatically 
determine the array type (450k, EPIC)}
}
\value{
data containing chr, startCG, endCG, segmentmedian, p-value, 
samplename
}
\description{
Uses data from minfis getCN() function and normalizes 
probe-wise against control CN data.
Segments are identified with changepoints cpr.var() 
function (BinSeg)
Differes compared to findSegments in:
- no plotting
- only wilcoxon tests
- differences are calculated
- only limited set of return values
}
\examples{
norm <- minfi::getCN(minfi::preprocessRaw(minfiData::RGsetEx))
ctrlAll <- norm[,5,drop=FALSE]
ctrl <- norm[,4] #ctrl <- apply(ctrlAll, 1, "median")
samples <- norm[,1,drop=FALSE]
findSegmentsFast(samples,ctrl, ctrlAll)[1:4,]
}

