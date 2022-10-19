## SLURP (Stranding Long Unstranded Reads using Primers)

<img align="left" width="300" src="https://user-images.githubusercontent.com/66103719/196799429-bf50379c-4750-4465-926e-b121eed35e81.png">
SLURP is a bash script that aims to strand reads obtained from long-read sequencing platforms by probing for library prep primers. The reads are probed for primer 1 (polyT primer), primer 2 (strand switching primer) and the reverse complement of primer 2.<br/>The default sequence of primer 1 (polyT primer) is GCTCTATCTTCTTT. <br/>The default sequence of primer 2 (strand switching primer) is CTGATATTGCTGGG.<br/>The default sequence of the reverse complement of primer 2 is CCCAGCAATATCAG.<br/>Users may want to change the default sequences to the ones used in their library prep kit.<br/>By default, the script allows for 2 mismatches. It can be changed as per requirement (-m).<br/>The input file is a fastq file obtained from the sequencer. If the user is using a fasta file instead of a fastq file, then ignore the number of reads printed in stdout.
<br/>

#### Usage
```bash SLURP.sh <Input.fastq>```
<br/>

#### Dependencies
**seqkit**: seqkit can be obtained from (https://bioinf.shenwei.me/seqkit/) or ```conda install -c bioconda seqkit```
