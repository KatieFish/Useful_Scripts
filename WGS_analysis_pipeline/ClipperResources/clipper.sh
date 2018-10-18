#!/bin/bash
# 02/25/28 by KFisher  Kjf214@lehigh.edu
# shell script to clip/trim FASTQ sequence files 

for N5 in 02 03 04 05 06 07 08 17
do
	for N7 in 01 02 03 04 05 06 07 08 09 10 11 12
	do
		# gunzip /share/ceph/gil213group/shared/AutodipSplitFastqs/N5$N5\N7$N7\splitreads-read-1.fastq.gz
		fastx_clipper -a CTGTCTCTTATACACATCT -i /share/ceph/gil213group/shared/AutodipSplitFastqs/N5$N5\N7$N7\splitreads-read-1.fastq -o /share/ceph/gil213group/shared/N5$N5\N7$N7\splitreads-read-1-clipped.fastq -Q33 -n 18
		date

	done	
done
