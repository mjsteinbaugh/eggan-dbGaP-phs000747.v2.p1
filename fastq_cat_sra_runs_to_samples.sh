# Concatenate the SRA run files (SRR*) per sample (SRS*)
# Michael Steinbaugh
# 2018-06-05



# Remove any existing sample (SRS) files, if present
rm -rf SRS*.fastq.gz



# IBBE samples (6 total) ====
# SRS666488 (9)
SRS666488=("SRR1525290" "SRR1525291" "SRR1525292" "SRR1525293" "SRR1525294" "SRR1525295" "SRR1525296" "SRR1525297" "SRR1525298")
cat $( IFS=,; eval echo \{"${SRS666488[*]}"\}_1.fastq.gz ) > SRS666488_1.fastq.gz
cat $( IFS=,; eval echo \{"${SRS666488[*]}"\}_2.fastq.gz ) > SRS666488_2.fastq.gz

# SRS666489 (11)
SRS666489="SRR1525308,SRR1525309,SRR1525310,SRR1525311,SRR1525312,SRR1525313,SRR1525314,SRR1525315,SRR1525316,SRR1525317,SRR1525318"
cat $( IFS=,; eval echo \{"${SRS666489[*]}"\}_1.fastq.gz ) > SRS666489_1.fastq.gz
cat $( IFS=,; eval echo \{"${SRS666489[*]}"\}_2.fastq.gz ) > SRS666489_2.fastq.gz

# SRS666490 (9)
SRS666490="SRR1525323,SRR1525324,SRR1525325,SRR1525326,SRR1525327,SRR1525328,SRR1525329,SRR1525330,SRR1525331"
cat $( IFS=,; eval echo \{"${SRS666490[*]}"\}_1.fastq.gz ) > SRS666490_1.fastq.gz
cat $( IFS=,; eval echo \{"${SRS666490[*]}"\}_2.fastq.gz ) > SRS666490_2.fastq.gz

# SRS666491 (16)
SRS666491="SRR1525342,SRR1525343,SRR1525344,SRR1525345,SRR1525346,SRR1525347,SRR1525348,SRR1525349,SRR1525350,SRR1525351,SRR1525352,SRR1525353,SRR1525354,SRR1525355,SRR1525356,SRR1525357"
cat $( IFS=,; eval echo \{"${SRS666491[*]}"\}_1.fastq.gz ) > SRS666491_1.fastq.gz
cat $( IFS=,; eval echo \{"${SRS666491[*]}"\}_2.fastq.gz ) > SRS666491_2.fastq.gz

# SRS666492 (10)
SRS666492="SRR1525361,SRR1525362,SRR1525363,SRR1525364,SRR1525365,SRR1525366,SRR1525367,SRR1525368,SRR1525369,SRR1525370"
cat $( IFS=,; eval echo \{"${SRS666492[*]}"\}_1.fastq.gz ) > SRS666492_1.fastq.gz
cat $( IFS=,; eval echo \{"${SRS666492[*]}"\}_2.fastq.gz ) > SRS666492_2.fastq.gz

# SRS666493 (10)
SRS666493="SRR1525381,SRR1525382,SRR1525383,SRR1525384,SRR1525385,SRR1525386,SRR1525387,SRR1525388,SRR1525389,SRR1525390"
cat $( IFS=,; eval echo \{"${SRS666493[*]}"\}_1.fastq.gz ) > SRS666493_1.fastq.gz
cat $( IFS=,; eval echo \{"${SRS666493[*]}"\}_2.fastq.gz ) > SRS666493_2.fastq.gz



# NINDS samples (11 total) ====
SRS2676882="SRR6279056"
ln -s SRR6279056_1.fastq.gz SRS2676882_1.fastq.gz
ln -s SRR6279056_2.fastq.gz SRS2676882_2.fastq.gz

SRS2676883="SRR6279057"
ln -s SRR6279057_1.fastq.gz SRS2676883_1.fastq.gz
ln -s SRR6279057_2.fastq.gz SRS2676883_2.fastq.gz

SRS2676884="SRR6279058"
ln -s SRR6279058_1.fastq.gz SRS2676884_1.fastq.gz
ln -s SRR6279058_2.fastq.gz SRS2676884_2.fastq.gz

SRS2676885="SRR6279059"
ln -s SRR6279059_1.fastq.gz SRS2676885_1.fastq.gz
ln -s SRR6279059_2.fastq.gz SRS2676885_2.fastq.gz

SRS2676886="SRR6279060"
ln -s SRR6279060_1.fastq.gz SRS2676886_1.fastq.gz
ln -s SRR6279060_2.fastq.gz SRS2676886_2.fastq.gz

SRS2676887="SRR6279061"
ln -s SRR6279061_1.fastq.gz SRS2676887_1.fastq.gz
ln -s SRR6279061_2.fastq.gz SRS2676887_2.fastq.gz

SRS2676888="SRR6279062"
ln -s SRR6279062_1.fastq.gz SRS2676888_1.fastq.gz
ln -s SRR6279062_2.fastq.gz SRS2676888_2.fastq.gz

SRS2676889="SRR6279063"
ln -s SRR6279063_1.fastq.gz SRS2676889_1.fastq.gz
ln -s SRR6279063_2.fastq.gz SRS2676889_2.fastq.gz

SRS2676890="SRR6279064"
ln -s SRR6279064_1.fastq.gz SRS2676890_1.fastq.gz
ln -s SRR6279064_2.fastq.gz SRS2676890_2.fastq.gz

SRS2676891="SRR6279065"
ln -s SRR6279065_1.fastq.gz SRS2676891_1.fastq.gz
ln -s SRR6279065_2.fastq.gz SRS2676891_2.fastq.gz

SRS2676892="SRR6279066"
ln -s SRR6279066_1.fastq.gz SRS2676892_1.fastq.gz
ln -s SRR6279066_2.fastq.gz SRS2676892_2.fastq.gz

