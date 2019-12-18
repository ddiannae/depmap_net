setwd("/home/diana/Workspace/cnww/depmap_net")

#library(RCurl)
#download <- getURL("https://ndownloader.figshare.com/files/1675766", .opts=curlOptions(followlocation = TRUE))
file <- "data/Achilles_gene_dependency.csv"
achilles <- read.csv(file)
genes <- colnames(achilles)
new.genes <- lapply(genes, FUN = function(gene){
    fname <- strsplit(gene, split = "[..]")[[1]]
    return(fname[1])
  })
new.genes <- unlist(new.genes)
colnames(achilles) <- new.genes
achilles[is.na(achilles)] <- 0
write.table(achilles, file ="data/Achilles_gene_dependency.txt", sep = "\t", 
            row.names = F, quote = F)
