library(bcbioRNASeq)  # v0.2.4
library(DESeq2)  # 1.20.0
library(magrittr)
library(tidyverse)

load("data/2018-05-14/bcb.rda")
print(bcb)

data_dir <- file.path("data", Sys.Date())

# 77 RNA-seq samples
# bcbioRNASeq object is missing 1 sample because of missing transcript, failure
# to import cleanly with tximport
sample_data <- read_tsv("SRP044860/SraRunTable.txt") %>%
    camel() %>%
    filter(assayType == "RNA-Seq") %>%
    mutate(sampleName = run) %>%
    mutate_all(as.factor) %>%
    as.data.frame() %>%
    set_rownames(.$sampleName) %>%
    .[colnames(bcb), ]

control_samples <- sample_data %>%
    filter(subjectIsAffected == "No") %>%
    pull(run) %>%
    sort()
print(control_samples)

als_samples <- sample_data %>%
    filter(subjectIsAffected == "Yes") %>%
    pull(run) %>%
    sort()
print(als_samples)

sampleData(bcb) <- sample_data
interestingGroups(bcb) <- "subjectIsAffected"
saveData(bcb, dir = data_dir)

# Coerce to DESeqDataSet
dds <- as(bcb, "DESeqDataSet")

# Ensure `subjectIsAffected` reference level is "No" (control)
dds$subjectIsAffected <- relevel(
    x = dds$subjectIsAffected,
    ref = "No"
)
design(dds) <- formula("~ subjectIsAffected")
dds <- DESeq(dds)
resultsNames(dds)
saveData(dds, dir = data_dir)

# Differential expression of affected ALS patients relative to controls
contrast <- c(
    factor = "subjectIsAffected",
    numerator = "Yes",
    denominator = "No"
)
res_unshrunken <- results(
    object = dds,
    contrast = contrast,
    alpha = 0.01
)

# coef = 2
# resultsNames(dds)[[2]]
# "subjectIsAffected_Yes_vs_No"

res_shrunken <- lfcShrink(
    dds = dds,
    contrast = contrast,
    res = res_unshrunken
)

# Label genes of interest on DEG plots
genes <- c(
    TARDBP = "ENSG00000120948",
    STMN2 = "ENSG00000104435"
)
gene2symbol <- gene2symbol(dds)

plotMeanAverage(
    object = res_shrunken,
    genes = genes,
    gene2symbol = gene2symbol
)
plotMA(res_shrunken)

plotVolcano(
    object = res_shrunken,
    genes = genes,
    gene2symbol = gene2symbol
)

res_tbl <- resultsTables(
    results = res_shrunken,
    counts = dds
)

saveData(
    sample_data,
    bcb,
    dds,
    gene2symbol,
    res_unshrunken,
    res_shrunken,
    res_tbl,
    dir = data_dir
)

# CPU intensive
rld <- varianceStabilizingTransformation(dds)
