OrigBeta <- read.csv('in.csv', header = FALSE)
betas <- as.matrix(OrigBeta)
WavDecRes = list()
for (k in 1:nrow(betas)){
  WavDecRes[[k]]= wd(betas[k,], filter.number = 1, family = 'DaubExPhase')
  plot(WavDecRes[[k]])
}