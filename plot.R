library(reshape2)
library(lattice)
lats <- cbind(read.table("subject.txt",header=F,sep="\n"),read.table("onsetlatencies.txt", header=F,sep="\n"),read.table("rtlatencies.txt", header=F,sep="\n"))
lats <- data.frame(subj=lats[[1]],onset=lats[[2]],rt=lats[[3]])
lats$onset <- lats$onset + 500
lats$rt <- abs(lats$rt) 
lats$subj <- as.factor(lats$subj)
# distance to onset bzw. distance to reaction(=button press)
lats <- melt(lats,value.name="dist",variable.name="ref",id.vars="subj")

densityplot(~dist|subj,groups=ref,data=lats, auto.key=T)