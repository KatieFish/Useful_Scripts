#!/bin/bash

# written for paired end fastqs 
# KJF for CSHL YGG :) 

		
		
for N5 in 17
do
	for N7 in 01 02 03 04
	do	
		module load foss/2016a
		
		module load freebayes
		
		bwa index reference_genome/W303_ann_swb_11-29-17.fasta
# start by indexing your reference genome file 
		bwa aln -n 0.04 -o 1 -e -1 -d 16 -i 0 -O 5 -E 4 reference_genome/W303_ann_swb_11-29-17.fasta N5$N5\N7$N7\_read1_trimmed.fastq > N5$N5\N7$N7\_read1_.sai
		
		bwa aln -n 0.04 -o 1 -e -1 -d 16 -i 0 -O 5 -E 4 reference_genome/W303_ann_swb_11-29-17.fasta N5$N5\N7$N7\_read4_trimmed.fastq > N5$N5\N7$N7\_read4.sai
# the first two commands align the clipped fastq files from your two paired end read files separately and create a .sai file for both of them 	

		bwa sampe -n 3 reference_genome/W303_ann_swb_11-29-17.fasta N5$N5\N7$N7\_read1_.sai N5$N5\N7$N7\_read4.sai N5$N5\N7$N7\_read1_trimmed.fastq N5$N5\N7$N7\_read4_trimmed.fastq > N5$N5\N7$N7\.sam
# the above command uses both paired end files to generate one sam file 

		samtools faidx reference_genome/W303_ann_swb_11-29-17.fasta
		
		samtools view -bS N5$N5\N7$N7\.sam > N5$N5\N7$N7\.bam
		
# the above command generates a bam file from the sam file 
		samtools sort N5$N5\N7$N7\.bam N5$N5\N7$N7\-sorted.bam
		
# the above command sorts the bam file so that it is viewable
		samtools index N5$N5\N7$N7\-sorted.bam
# index your bam file 
		freebayes -f reference_genome/W303_ann_swb_11-29-17.fasta -p 2 --pooled-discrete N5$N5\N7$N7\-sorted.bam > N5$N5\N7$N7\.vcf
#n freebayes will call differences between the reference fasta you provide and your bam file. These will be sotred in your vcf. 
		
	done 
done 
