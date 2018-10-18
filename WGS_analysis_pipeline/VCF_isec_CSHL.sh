#!/bin/bash


# We're using the intersection (isec) tool in VCF tools to remove mutations common to all samples
# since these were experimentally evolved, mutations common to all samples were probably there at the beginning 
# and are not interesting to us as evolved mutations. 
 
# KJF for CSHL YGG

 

for N5 in 02 17
do
        for N7 in 01 02 03 04
        do
    bgzip N5$N5\N7$N7\.vcf
    bgzip common42a.vcf
    bgzip common42alpha.vcf
    
    tabix -p common42a.vcf.gz
    tabix -p common42alpha.vcf.gz
	tabix -p vcf N5$N5\N7$N7\.vcf.gz
	
	vcf-isec -c N5$N5\N7$N7\.vcf.gz common42a.vcf.gz | bgzip -c > N5$N5\N7$N7\-postisec-a.vcf.gz
	vcf-isec -c N5$N5\N7$N7\-postisec-a.vcf.gz common42alpha.vcf.gz | bgzip -c > N5$N5\N7$N7\-postisec.vcf.gz
	rm N5$N5\N7$N7\-postisec-a.vcf.gz
	gunzip N5$N5\N7$N7\-postisec.vcf.gz
	done 
done
