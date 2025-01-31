# I run it on the command line!

#nb genes
grep -P '\tgene\t' /data/users/ediethelm/annotation/final_annotation/filtered.genes.renamed.final.gff3 | wc -l
# 27330 --> good

#nb mRNA
grep -P '\tmRNA\t' /data/users/ediethelm/annotation/final_annotation/filtered.genes.renamed.final.gff3 | wc -l
# 30185

#nb annotated genes
grep -P '\tgene\t' /data/users/ediethelm/annotation/final_annotation/filtered.genes.renamed.final.gff3 | grep 'InterPro' | wc -l
# 21696

#gene length
grep -P '\tgene\t' /data/users/ediethelm/annotation/final_annotation/filtered.genes.renamed.final.gff3 | awk '{diff = $5 - $4; sum += diff; if (NR == 1) {min = max = diff} else {if (diff < min) min = diff; if (diff > max) max = diff}} END {print "Min:", min, "Max:", max, "Mean:", sum / NR}'
# Min: 5 Max: 199882 Mean: 2321.4

# mRNA length
grep -P '\tmRNA\t' /data/users/ediethelm/annotation/final_annotation/filtered.genes.renamed.final.gff3 | awk '{diff = $5 - $4; sum += diff; if (NR == 1) {min = max = diff} else {if (diff < min) min = diff; if (diff > max) max = diff}} END {print "Min:", min, "Max:", max, "Mean:", sum / NR}'
# Min: 5 Max: 199882 Mean: 2377.78

# genes without blast hit
grep -P 'Protein of unknown function' maker_proteins.fasta.Uniprot | wc -l
#8181

# genes with blast hit
grep -P 'Similar to' maker_proteins.fasta.Uniprot | wc -l
#22004