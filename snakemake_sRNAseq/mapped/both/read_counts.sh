#!/bin/bash

for i in 21 22 23 24
do
( samtools view sRNAseq_Col_Rep1_SRR6376831_MappedOn_TAIR10_chr_all_both_${i}nt_sort.bam \
  | cut -f 1 | wc -l > sRNAseq_Col_Rep1_SRR6376831_MappedOn_TAIR10_chr_all_both_${i}nt_sort_reads.txt
  samtools view sRNAseq_Col_Rep2_SRR6376832_MappedOn_TAIR10_chr_all_both_${i}nt_sort.bam \
  | cut -f 1 | wc -l > sRNAseq_Col_Rep2_SRR6376832_MappedOn_TAIR10_chr_all_both_${i}nt_sort_reads.txt ) &
done
wait

samtools view sRNAseq_Col_Rep1_SRR6376831_MappedOn_TAIR10_chr_all_both_sort.bam \
  | cut -f 1 | wc -l > sRNAseq_Col_Rep1_SRR6376831_MappedOn_TAIR10_chr_all_both_sort_reads.txt
samtools view sRNAseq_Col_Rep2_SRR6376832_MappedOn_TAIR10_chr_all_both_sort.bam \
  | cut -f 1 | wc -l > sRNAseq_Col_Rep2_SRR6376832_MappedOn_TAIR10_chr_all_both_sort_reads.txt
