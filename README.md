## SLURP (Stranding Long Unstranded Reads using Primers)
<img align="left" width="400" src="https://github.com/kainth-amoldeep/SLURP/assets/66103719/6747b53a-3f45-4f29-9011-6d504da3e378">
SLURP is a stand-alone pipeline to strand reads obtained from long-read sequencing platforms by probing for library prep primers. The reads are probed for first strand synthesis primer (primer 1; with a TTT 3'-end), strand switching primer (primer 2; with a GGG 3'-end) and the reverse complement of primer 2.

#### Usage
```bash SLURP.sh <Input.fastq>```
<br/>
<br/>The default sequence of primer 1 (with a TTT 3'-end) is GCTCTATCTTCTTT. <br/>The default sequence of primer 2 (strand switching primer) is CTGATATTGCTGGG.<br/>The default sequence of the reverse complement of primer 2 is CCCAGCAATATCAG.<br/>Users may want to change the default sequences to the ones used in their library prep kit.<br/>By default, the script allows for 2 mismatches. It can be changed as per the requirement.<br/>The input file is a fastq file obtained from the sequencer. If the user is using a fasta file instead of a fastq file, then ignore the number of reads printed in stdout.
<br/>
#### Dependencies
**seqkit**: seqkit can be obtained from (https://bioinf.shenwei.me/seqkit/) or ```conda install -c bioconda seqkit```

#### Citation
If you use or discuss this method, please cite: <br/>
Kainth AS, Haddad GA, Hall JM, Ruthenburg AJ (2023) Merging short and stranded long reads improves transcript assembly. PLoS Comput Biol 19(10): e1011576. https://doi.org/10.1371/journal.pcbi.1011576
