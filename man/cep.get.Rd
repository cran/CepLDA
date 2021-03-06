% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cep_get.R
\name{cep.get}
\alias{cep.get}
\title{Obtain Data Frame to be Used in \code{Lopt.get} and \code{predict.ceplda}}
\usage{
cep.get(y,x,nw,k)
}
\arguments{
\item{y}{n-vector indicating  group membership}

\item{x}{\emph{N} by \emph{n} matrix containing \emph{n} time series, each with length \emph{N}.}

\item{nw}{Width of tapers used in multitaper spectral estimation. Default is set to 4}

\item{k}{Number of tapers used in multitaper spectral estimation. Default is set to 7}
}
\value{
\item{D.hat}{Data frame containing group information and raw cepstral coefficients.}
}
\description{
Returns a data frame containing raw cepstra coefficients and the group membership from multiple time seres.
}
\examples{
## Simulate dataset
nj = 50  #number of series in training data
N = 500  #length of time series
data1 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))
data2 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.5,1.2),r.phi2=c(-.36,-.25),r.sig2=c(.3,3))
data3 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.9,1.5),r.phi2=c(-.56,-.75),r.sig2=c(.3,3))
dat <- cbind(data1$X,data2$X,data3$X)
y <- c(rep(1,nj),rep(2,nj),rep(3,nj))
data.cep <- cep.get(y,dat,4,7)
dim(data.cep)
}
\author{
Zeda Li \email{<zeda.li@temple.edu>}
}
\references{
Krafty, RT(2016) Discriminant Analysis of Time Series in the Presence of Within-Group Spectral Variability.  \emph{Journal of Time series analysis}
}
\seealso{
\code{\link{predict.ceplda}}, \code{\link{Lopt.get}}
}

