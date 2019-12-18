setwd("/home/diana/Workspace/cnww/")
achilles <- read.csv("Achilles_gene_dependency.csv")
genes <- colnames(achilles)
new.genes <- lapply(genes, FUN = function(gene){
    fname <- strsplit(gene, split = "[..]")[[1]]
    return(fname[1])
  })
new.genes <- unlist(new.genes)
colnames(achilles) <- new.genes
library(stringr)
cell.types <- achilles[,1]
new.cell.types <- str_replace(cell.types, "-", "")
achilles[,1] <- new.cell.types
write.table(achilles, file ="Achilles_gene_dependency.txt", sep = "\t", 
            row.names = F, quote = F)
