#!/bin/bash

# Obtained from Greg Lang, glang@lehigh.edu, 10/19/2015

# Modified by Sean Buskirk, swb5000@gmail.com, 2/23/2018

# --FIRST ROUND OF SPLITTING--

# Split read1 by N5

barcode_splitter --bcfile /share/ceph/gil213group/shared/N5barcodes.txt /share/ceph/gil213group/shared/read1.fastq.gz /share/ceph/gil213group/shared/read3_N5index.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/read1_ --suffix .fastq --mismatches 1
gzip read1_*.fastq

date

# Split read2_N7index by N5

barcode_splitter --bcfile /share/ceph/gil213group/shared/N5barcodes.txt /share/ceph/gil213group/shared/read2_N7index.fastq.gz /share/ceph/gil213group/shared/read3_N5index.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/read2_N7index_ --suffix .fastq --mismatches 1
gzip read2_*.fastq

date

# --SECOND ROUND OF SPLITTING--

# Split N517 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N517splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N517splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N517 --suffix .fastq --mismatches 1

date

# Split N502 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N502splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N502splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N502 --suffix .fastq --mismatches 1

date

# Split N503 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N503splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N503splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N503 --suffix .fastq --mismatches 1

date

# Split N504 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N504splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N504splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N504 --suffix .fastq --mismatches 1

date

# Split N505 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N505splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N505splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N505 --suffix .fastq --mismatches 1

date

# Split N506 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N506splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N506splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N506 --suffix .fastq --mismatches 1

date

# Split N507 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N507splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N507splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N507 --suffix .fastq --mismatches 1

date

# Split N508 by N7

barcode_splitter --bcfile /share/ceph/gil213group/shared/N7barcodes.txt /share/ceph/gil213group/shared/read1_N508splitreads-read-1.fastq.gz /share/ceph/gil213group/shared/read2_N7index_N508splitreads-read-1.fastq.gz --idxread 2 --prefix /share/ceph/gil213group/shared/N508 --suffix .fastq --mismatches 1

date

