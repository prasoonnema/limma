\name{alias2Symbol}
\alias{alias2Symbol}
\alias{alias2SymbolTable}
\title{Convert Gene Aliases to Official Gene Symbols}
\description{
Maps gene alias names to official gene symbols.
}
\usage{
alias2Symbol(alias, species = "Hs", expand.symbols = FALSE)
alias2SymbolTable(alias, species = "Hs")
}
\arguments{
  \item{alias}{character vector of gene aliases}
  \item{species}{character string specifying the species.
  Possible values include \code{"Hs"} (human), \code{"Mm"} (mouse), \code{"Rn"} (rat), \code{"Dm"} (fly) or \code{"Pt"} (chimpanzee), but other values are possible if the corresponding organism package is available.}
  \item{expand.symbols}{logical.
  This affects those elements of \code{alias} that are the official gene symbol for one gene and also an alias for another gene.
  If \code{FALSE}, then these elements will just return themselves.
  If \code{TRUE}, then all the genes for which they are aliases will be returned.}
}
\details{
Aliases are mapped via NCBI Entrez Gene identity numbers using Bioconductor organism packages.

\code{alias2Symbol} maps a set of aliases to a set of symbols, without necessarily preserving order.
The output vector may be longer or shorter than the original vector, because some aliases might not be found and some aliases may map to more than one symbol.
\code{alias2SymbolTable} maps each alias to a gene symbol and returns a table with one row for each alias.
If an alias maps to more than one symbol, then the first one found is returned.

\code{species} can be any character string XX for which an organism package org.XX.eg.db exists and is installed.
The only requirement of the organism package is that it contains objects \code{org.XX.egALIAS2EG} and \code{org.XX.egSYMBOL} linking the aliases and symbols to Entrez Gene Ids.
At the time of writing (June 2016), the following organism packages are available from Bioconductor:
\tabular{lll}{
\tab Package \tab Species\cr
\tab org.Ag.eg.db \tab  Anopheles\cr
\tab org.Bt.eg.db \tab  Bovine\cr
\tab org.Ce.eg.db \tab  Worm\cr
\tab org.Cf.eg.db \tab  Canine\cr
\tab org.Dm.eg.db \tab  Fly\cr
\tab org.Dr.eg.db \tab  Zebrafish\cr
\tab org.EcK12.eg.db \tab  E coli strain K12\cr
\tab org.EcSakai.eg.db \tab  E coli strain Sakai\cr
\tab org.Gg.eg.db \tab  Chicken\cr
\tab org.Hs.eg.db \tab  Human\cr
\tab org.Mm.eg.db \tab  Mouse\cr
\tab org.Mmu.eg.db \tab  Rhesus\cr
\tab org.Pt.eg.db \tab  Chimp\cr
\tab org.Rn.eg.db \tab  Rat\cr
\tab org.Ss.eg.db \tab  Pig\cr
\tab org.Xl.eg.db \tab  Xenopus
}

}
\value{
Character vector of gene symbols.

\code{alias2SymbolTable} returns a vector of the same length and order as \code{alias}, including \code{NA} values where no gene symbol was found.
\code{alias2Symbol} returns an unordered vector that may be longer or shorter than \code{alias}.
}
\author{Gordon Smyth and Yifang Hu}
\seealso{
This function is often used to assist gene set testing, see
\link{10.GeneSetTests}.
}
\examples{
alias2Symbol(c("PUMA","NOXA","BIM"), species="Hs")
alias2Symbol("RS1", expand=TRUE)
}

\keyword{gene annotation}

