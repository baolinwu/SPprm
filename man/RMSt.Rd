% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RMS-unbalanced.R
\name{RMSt}
\alias{RMSt}
\title{Conduct estimation and RMS test for one-way random-effects ANOVA model}
\usage{
RMSt(Y, subj, rho = 9, REML = TRUE)
}
\arguments{
\item{Y}{vector of outcomes}

\item{subj}{subject id (factors). Observations with the sam id are coming from the same individual.}

\item{rho}{null threshold of acceptable squared RMS value.}

\item{REML}{using REML instead of MLE. Default to TRUE.}
}
\value{
\describe{
  \item{p.value}{ test p-values for: QMS test, score Z-test, Wald Z-test }
  \item{pars0}{ estimated null parameter values }
  \item{pars}{ estimated MLE parameter values }
}
}
\description{
We are conducting hypothesis test for a composite parameter, the RMS, defined as \eqn{\sqrt{\mu^2+\sigma_b^2+\sigma_w^2}:=\sqrt{\rho} }, where
\eqn{\mu} is the overall mean, and \eqn{(\sigma_b^2,\sigma_w^2)} are the between/within-subject variances in the
 one-way random-effects ANOVA model, \eqn{y_{ij}=\mu+u_i+\epsilon_{ij}}, where \eqn{u_i\sim N(0,\sigma_b^2) } and
 \eqn{\epsilon_{ij}\sim N(0,\sigma_w^2) }. We want to test \eqn{H_0: \rho\ge \rho_0}.
We implement a parametric Bootstrap based test with ``exact'' p-value calculation, voiding the need for Bootstrap Monte Carlo simulation.
See the reference of Bai et. al (2018). The score and Wald Z-tests, both large-sample normal approximation tests, are also implemented.
}
\examples{
s2w=1.4^2; s2b=1.7^2; mu0=-0.4
ng = c(10,2,10,10,5,7,9,10)
A = rep(1:8, times=ng)
Y = mu0 + (rnorm(8)*sqrt(s2b))[A] + rnorm(sum(ng))*sqrt(s2w)
RMSt(Y,A)
}
\references{
Bai,Y., Wang,Z., Lystig,T.C., and Wu,B. (2018) Statistical test with sample size and power calculation for paired repeated measures designs of method comparison studies.
}
