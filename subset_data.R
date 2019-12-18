setwd("/home/dgarcia/Workspace/depmap_net")

#library(RCurl)
#download <- getURL("https://ndownloader.figshare.com/files/1675766", .opts=curlOptions(followlocation = TRUE))
file <- "data/Achilles_gene_dependency.csv"
achilles <- read.csv(file, row.names = 1)
genes <- colnames(achilles)
new.genes <- lapply(genes, FUN = function(gene){
  fname <- strsplit(gene, split = "[..]")[[1]]
  return(fname[1])
})
new.genes <- unlist(new.genes)
colnames(achilles) <- new.genes

genes <- read.csv("data/Achilles_common_essentials.csv", stringsAsFactors = F)
new.genes <- lapply(genes[,1], FUN = function(gene){
  fname <- strsplit(gene, split = "\\s+")[[1]]
  return(fname[1])
})
new.genes <- unlist(new.genes)

achilles.subset <- achilles[, colnames(achilles) %in% new.genes]
achilles.subset[is.na(achilles.subset)] <- 0
cell_lines <- rownames(achilles.subset)
achilles.subset <- cbind(cell_lines, achilles.subset)
write.table(achilles.subset, file ="data/achilles_subset.txt", sep = "\t", 
            row.names = F, quote = F)

