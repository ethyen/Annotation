library(GENESPACE)
args <- commandArgs(trailingOnly = TRUE)
# get the folder where the genespace files are
wd <- args[1]
gpar <- init_genespace(wd = wd, path2mcscanx = "/data/users/ediethelm/annotation/final_annotation/MCScanX", nCores = 20, verbose = TRUE)
out <- run_genespace(gpar, overwrite = TRUE)