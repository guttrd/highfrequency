\name{JOjumptest}
\alias{JOjumptest}
\title{
Jiang and Oomen (2008) tests for the presence of jumps in the price series.
}
\description{
 
This test examines the jump in highfrequency data. It is based on theory of Jiang and Oomen (JO). They found that the difference of simple return and logarithmic return can capture one half of integrated variance if there is no jump in the underlying sample path. The null hypothesis is no jumps.

Function returns three outcomes: 1.z-test value 2.critical value under confidence level of \eqn{95\%} and 3.p-value.  

Assume there is \eqn{N} equispaced returns in period \eqn{t}.

Let \eqn{r_{t,i}} be a logarithmic return (with \eqn{i=1, \ldots,N}) in period \eqn{t}.

Let \eqn{R_{t,i}} be a simple return (with \eqn{i=1, \ldots,N}) in period \eqn{t}.

Then the JOjumptest is given by: 
\deqn{
\mbox{JOjumptest}_{t,N}= \frac{N BV_{t}}{\sqrt{\Omega_{SwV}} \left(1-\frac{RV_{t}}{SwV_{t}} \right)}
}
in which, 
\eqn{BV}: bipower variance;
\eqn{RV}: realized variance (defined by Andersen et al. (2012));
\deqn{
  \mbox{SwV}_{t}=2 \sum_{i=1}^{N}(R_{t,i}-r_{t,i})
}
\deqn{
  \Omega_{SwV}= \frac{\mu_6}{9} \frac{{N^3}{\mu_{6/p}^{-p}}}{N-p-1} \sum_{i=0}^{N-p}\prod_{k=1}^{p}|r_{t,i+k}|^{6/p}
} 
\deqn{
  \mu_{p}= \mbox{E}[|\mbox{U}|^{p}] = 2^{p/2} \frac{\Gamma(1/2(p+1))}{\Gamma(1/2)}
  % \mbox{E}[|\mbox{U}|^p]=
}
%\eqn{ \mbox{E}[|\mbox{U}|]^{\mbox{p}}}
  \eqn{U}: independent standard normal random variables
  
  p: parameter (power).
}
\usage{
JOjumptest(pdata, power=4,...)
}

\arguments{
  \item{pdata}{a zoo/xts object containing all prices in period t for one asset.}
  \item{power}{can be chosen among 4 or 6. 4 by default.}
  \item{...}{additional arguments.}
}

\value{
list
}

\details{
The theoretical framework underlying jump test is that the logarithmic price process \eqn{X_t} belongs to the class of Brownian semimartingales, which can be written as:
\deqn{
\mbox{X}_{t}=  \int_{0}^{t} a_udu + \int_{0}^{t}\sigma_{u}dW_{u} + Z_t
}
where \eqn{a} is the drift term, \eqn{\sigma} denotes the spot volatility process, \eqn{W} is a standard Brownian motion and \eqn{Z} is a jump process defined by:
\deqn{
\mbox{Z}_{t}=  \sum_{j=1}^{N_t}k_j
}
where \eqn{k_j} are nonzero random variables. The counting process can be either finite or infinite for finite or infinite activity jumps.

The Jiang and Oomen test is that: in the absence of jumps, the accumulated difference between the simple return and the log return captures one half of the integrated variance.(Theodosiou& Zikes(2009))
}

\references{
Andersen, T. G., D. Dobrev, and E. Schaumburg (2012). Jump-robust volatility estimation using nearest neighbor truncation. Journal of Econometrics, 169(1), 75- 93.

Jiang, J.G. and Oomen R.C.A (2008). Testing for jumps when asset prices are observed with noise- a "swap variance" approach. Journal of Econometrics,144(2), 352-370.

Theodosiou, M., & Zikes, F. (2009). A comprehensive comparison of alternative tests for jumps in asset prices. Unpublished manuscript, Graduate School of Business, Imperial College London.
}
\author{
Giang Nguyen, Jonathan Cornelissen and Kris Boudt
}

\examples{
data(sample_5minprices_jumps)
JOjumptest(sample_5minprices_jumps[,1], power= 6)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ highfrequency }
\keyword{ JOjumptest }
