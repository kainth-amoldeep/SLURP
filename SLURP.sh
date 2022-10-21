#!/bin/bash
#input primer sequences
primer1=GCTCTATCTTCTTT
primer2=CTGATATTGCTGGG
rc_primer2=CCCAGCAATATCAG
mismatch=2
temp="$1"
basename=${temp%.*}
# calculate number of reads in the parent file
parent_reads=$(wc -l ${temp} | awk '{print $1 * 0.25}')
echo $parent_reads "reads found in" $temp
# extract reads that are minimum 100 nt in length
seqkit seq -g -m 100 ${temp} > "$basename"_minimum100bp.fq 
# extract reads with q1 sequence in the first 100 bp of positive strand and allowing 2 mismatches 
cat "$basename"_minimum100bp.fq | seqkit grep -s -i -P -R 1:100 -m $mismatch -p $primer1 -o "$basename"_q1m2.fq
wc -l "$basename"_q1m2.fq | awk '{print $1 * 0.25, "reads found in '$basename'_q1m2.fq", $1*0.25/'$parent_reads'*100, "% of parent"}'
# extract reads with q3 sequence in the first 100 bp of positive strand and allowing 2 mismatches 
cat "$basename"_minimum100bp.fq | seqkit grep -s -i -P -R 1:100 -m $mismatch -p $primer2 -o "$basename"_q3m2.fq
wc -l "$basename"_q3m2.fq | awk '{print $1 * 0.25, "reads found in '$basename'_q3m2.fq", $1*0.25/'$parent_reads'*100, "% of parent"}'
# extract reads with q3rc sequence in the last 100 bp of positive strand and allowing 2 mismatches 
cat "$basename"_minimum100bp.fq | seqkit grep -s -i -P -R -100:-1 -m $mismatch -p $rc_primer2 -o "$basename"_q3m2rc.fq
wc -l "$basename"_q3m2rc.fq | awk '{print $1 * 0.25, "reads found in '$basename'_q3m2rc.fq", $1*0.25/'$parent_reads'*100, "% of parent"}'
# making reverse complement of q3m2
seqkit seq  -t dna -r -p "$basename"_q3m2.fq > "$basename"_rcq3m2.fq
# combining q1m2 and q3m2rc and removing duplicates
cat "$basename"_q1m2.fq "$basename"_q3m2rc.fq | seqkit rmdup -o "$basename"_q1m2_q3m2rc.fq
# combining q1m2_q3m2rc and rcq3m2 and removing duplicates
cat "$basename"_q1m2_q3m2rc.fq "$basename"_rcq3m2.fq | seqkit rmdup -o "$basename"_SLURP_stranded.fastq
wc -l "$basename"_SLURP_stranded.fastq | awk '{print $1 * 0.25, "reads found in '$basename'_SLURP_stranded.fq", $1*0.25/'$parent_reads'*100, "% of parent"}'
rm "$basename"_minimum100bp.fq "$basename"_q1m2.fq "$basename"_q3m2.fq "$basename"_q3m2rc.fq "$basename"_rcq3m2.fq "$basename"_q1m2_q3m2rc.fq
echo "SLURP stranding completed!"
