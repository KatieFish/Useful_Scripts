#!/bin/bash

# Trimmomatic script for paired end reads 
# KJF
# Trimmomatic is a tool that should remove Illumina adapter sequence from our Fastq reads. 

#this is a bash "for" loop. Because you've only got one sample in your folder, 
# the script will generate empty files for the other indices. That's ok, we'll just delete them. 

for N5 in 02 17
do
	for N7 in 01 02 03 04 
	do
	
java -jar trimmomatic-0.35.jar PE -phred33 N5$N5\N7$N7\SPLITREAD1.fastq N5$N5\N7$N7\SPLITREAD4.fastq N5$N5\N7$N7\_read1_paired_trimmed.fastq N5$N5\N7$N7\_read1_unpaired_trimmed.fastq N5$N5\N7$N7\_read4_paired_trimmed.fastq N5$N5\N7$N7\_read1_unpaired_trimmed.fastq ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# this will produce 2 files for each forward and reverse reads:
# 	reads in which both paired reads made it through processing (paired) 
#	and reads in which one paired read did not make it through (unpaired) 
# we're not going to use the unpaired reads, so we will remove them. 

rm *unpaired_trimmed.fastq

# now we'll rename the remaining files to make things easier
mv N5$N5\N7$N7\_read1_paired_trimmed.fastq N5$N5\N7$N7\_read1_trimmed.fastq
mv N5$N5\N7$N7\_read4_paired_trimmed.fastq N5$N5\N7$N7\_read4_trimmed.fastq
	
	done	
done
