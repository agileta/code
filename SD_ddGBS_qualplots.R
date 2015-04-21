setwd(dir = "GitHub/code/")
#install.packages("vioplot")
library(vioplot)

#Read in VCF file in raw format
rawvars = read.table(file = "sd.chr18.known.vcf", sep = "\t", comment.char = "#", as.is=TRUE, na.strings = "\\.")
colnames(rawvars) = cbind("CHROM", "POS", "ID", "REF", "ALT", "QUAL", "FILTER", "INFO", "GENO", "121", "122", "129", "140", "157","16","176","258","27","352","429","87")

#Extract depths for all samples/variants
depths = data.frame(matrix(nrow=nrow(rawvars), ncol=ncol(rawvars)-9))
for(i in 10:21){
  for(j in 1:nrow(rawvars)){
    depth = unlist(strsplit(x = rawvars[j,i], split = ":"))[3]
    if(!is.na(depth)){
      depths[j,i-9] = depth
    }
    else {depths[j,(i-9)]=0}
  }
}

