\name{medRV}
\Rdversion{1.1}
\alias{medRV}
\title{
medRV
}
\description{
Function returns the medRV, defined in Andersen et al. (2009).

Let \eqn{r_{t,i}} be a return (with \eqn{i=1,\ldots,M}) in period \eqn{t}.

Then, the medRV is given by
\deqn{
 \mbox{medRV}_{t}=\frac{\pi}{6-4\sqrt{3}+\pi}\left(\frac{M}{M-2}\right) \sum_{i=2}^{M-1} \mbox{med}(|r_{t,i-1}|,|r_{t,i}|, |r_{t,i+1}|)^2
} 
} 

\usage{
medRV(rdata,align.by=NULL,align.period=NULL,makeReturns=FALSE,...)
}

\arguments{
  \item{rdata}{ a zoo/xts object containing all returns in period t for one asset. }
  \item{align.by}{a string, align the tick data to "seconds"|"minutes"|"hours".}
  \item{align.period}{an integer, align the tick data to this many [seconds|minutes|hours].}  
  \item{makeReturns}{boolean, should be TRUE when rdata contains prices instead of returns. FALSE by   default.} 
  \item{...}{additional arguments.}
}

\section{Details}{

The medRV belongs to the class of realized volatility measures in this package  
that use the series of high-frequency returns \eqn{r_{t,i}} of a day \eqn{t} 
to produce an ex post estimate of the realized volatility of that day \eqn{t}. 
medRV is designed to be robust to price jumps. 
The difference between RV and medRV is an estimate of the realized jump 
variability. Disentangling the continuous and jump components in RV 
can lead to more precise volatility forecasts, 
as shown in Andersen et al. (2007) and Corsi et al. (2010).
}

\value{
numeric
}

\references{
Andersen, T. G., D. Dobrev, and E. Schaumburg (2012). Jump-robust volatility 
estimation using nearest neighbor truncation. Journal of Econometrics, 169 (1), 75-93.

Andersen, T.G., T. Bollerslev, and F. Diebold (2007). Roughing it up: including
jump components in the measurement, modelling and forecasting of return
volatility. The Review of Economics and Statistics 89 (4), 701-720.

Corsi, F., D. Pirino, and R. Reno (2010). Threshold Bipower Variation and the Impact of Jumps on Volatility Forecasting. 
Journal of Econometrics 159 (2), 276-288.
}

\author{ Jonathan Cornelissen and Kris Boudt}
\examples{
# data(sample_tdata);  
# medrv = medRV( rdata = sample_tdata$PRICE, align.by ="minutes", 
#            align.period =5, makeReturns=TRUE); 
# medrv 
}

\keyword{volatility}
