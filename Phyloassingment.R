rm(list = ls())

library(ape)
library(magrittr)
library(pegas)
library(seqinr)

mybin <- load("New_DNAbin_conserved_genes_BOC_ZERO.RData") #DNA seq for all gene categories
mybin <- get(mybin[1])


genes_dnabin <- c("PITG_01255", "PITG_03156","PITG_01062","PITG_00062","PITG_03783","PITG_03523",
                "PITG_06454","PITG_17490","PITG_00271","PITG_06664","PITG_01335","PITG_09940",
                "PITG_01290","PITG_11702","PITG_01255","PITG_02430","PITG_06906","PITG_16327","PITG_15642","PITG_03898")


rxlr <- mybin$CAZy
set.seed(99)
rxlr_10 <- rxlr[sample(1:length(rxlr), 10)]

genes_dnabin <- mybin$Core[genes_dnabin]
genes_dnabin <- rxlr_10

genes_dnabin <- genes_dnabin[lapply(genes_dnabin, length ) > 0]


genes_dnabin <- lapply(genes_dnabin, function(x) x[grep("us23|us22|us8|mir|ipo", labels(x), invert = F), ])



# 
library(ape)
for (k in 1:length(genes_dnabin)){

write.nexus.data(genes_dnabin[[k]], file = paste(names(genes_dnabin[k]), ".nex", sep = ""), format = "dna", datablock = F)

}





