# v0.2.4
library(bcbioRNASeq)
bcb <- bcbioRNASeq(
    uploadDir = "bcbio/final",
    organism = "Homo sapiens",
    genomeBuild = "GRCh37",
    gffFile = "Homo_sapiens.GRCh37.87.gtf.gz",
    censorSamples = "SRR1525380",
    transformationLimit = 0
)
saveData(bcb)
