% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/maxnodf.R
\name{maxnodf}
\alias{maxnodf}
\title{Calculate the maximum nestedness of a bipartite network}
\usage{
maxnodf(web, quality = 0)
}
\arguments{
\item{web}{Either a numeric matrix describing a bipartite network (a bipartite incidence matrix where elements are positive numbers if nodes interact, and 0 otherwise) 
or a numeric vector of length 3 of the form web = c(#Rows, #Columns, #Links).}

\item{quality}{An optional quality parameter to control the tradeoff between computation time and result quality. Can be 0, 1 or 2.}
}
\value{
Returns a list of length 2, where the first element ('max_nodf') is the maximum nestedness of the network and the second element ('max_nodf_mtx') is the incidence matrix corresponding to this maximum nestedness.
}
\description{
Calculates the maximum NODF that be achieved in a network with a given number of rows, columns and links.
}
\details{
For a given network, \code{maxnodf} calculates the maximum nestedness that can be achieved in a network with a given number of rows, columns and links, subject to the constraint that all rows and columns must have at least one link (i.e. marginal totals must always be >= 1). 
This allows nestedness values to be normalised as \eqn{NODF/max(NODF)} following Song et al (2017). To control for connectance and network size, Song et al. (2017) suggest an additional normalisation that
can be used: \eqn{(NODF/max(NODF))/(C * log(S))} where C is the network connectance and S is the geometric mean of the number of plants and pollinators in the network.

\code{maxnodf} has three algorithms for finding the maximum nestedness of a bipartite network. These can be set using the \code{quality} argument. Lower quality settings are faster, but find worse optima. Higher quality settings
are slower, but find better optima.
\itemize{
\item{\code{quality} = 0, uses a greedy algorithm.}
\item{\code{quality} = 1, uses a greedy algorithm plus hillclimbing.}
\item{\code{quality} = 2, uses a simulated annealing algorithm, with the greedy algorithm output as the start point. Best results, but requires the most computation time.}
}
}
\examples{
maxnodf(matrix(1.0, 12, 10))
maxnodf(c(14, 13, 52), 2)
}
\references{
Song, C., Rohr, R.P. and Saavedra, S., 2017. Why are some plant–pollinator networks more nested than others? Journal of Animal Ecology, 86(6), pp.1417-1424
}
