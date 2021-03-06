% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recon.R
\name{recon}
\alias{recon}
\title{Convert Cepstral Coefficients into Log-Spectra.}
\usage{
recon(wts,fqs)
}
\arguments{
\item{wts}{Cepstral coefficients.}

\item{fqs}{Frequencies to evaluate the log-spectrum.}
}
\value{
\item{dsc}{The log-spectrum.}
}
\description{
Returns a log-spectrum at a given set of frequencies from a cepstrum.
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

## Convert cepstral coefficients into log-spectra
frqs <- seq(from=0, to=.5, by=1/(dim(data.cep)[2]-1))
lspec <- matrix(0,dim(data.cep)[1], length(frqs))
## rows of lspec matrix contains log-spectra
for(i in 1:dim(data.cep)[1]){
  lspec[i,] <- recon(data.cep[,i],frqs)
}
}
\author{
Robert Krafty \email{<rkrafty@pitt.edu>}
}

