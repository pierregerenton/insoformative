# insoformative
Understand the information gain by the multiple-isoform gene annotation compared to single-isoform annotation.


The purpose of this project is to know, in the context of the EarthBiogenome Project, if it is relevant to spend ressources to produce complete annotation of genome with multiple isoform by genes, or if an annotation with only one annotation by gene is enough informative. 

All script of this project are written to work with an Unix system.

## Summary

- [Summary](#summary)
- [Download](#download)
    - [Dependencies](#dependencies)
- [Steps](#steps)
    - [Select genomes](#select-genomes)


## Download

You can download the repository with the command :

`git clone https://github.com/pierregerenton/insoformative.git`

### Dependencies

#### NCBI command-line tool datasets

`datasets` is one of the NCBI command-line tool usefull to get data about metadata about different entry in the gene, genome and virus databank.\
More information about the tool and how to install it : https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/.

Outputs given in this repository used version: 16.4.5.

#### jq : parsing json file with the CLI

`jq` is a json parser. It's available on Debian-like system with :

```sh
sudo apt install jq
```

Outputs given in this repository used version: 1.6.


#### Python3

Some scripts are written with `python3`. You can install it at : https://www.python.org/downloads/.

Outputs given in this repository used version: 3.10.12.




## Steps

### I. Select genomes

```sh
sh src/select_genome.sh
```

We'll analyse 60 genomes and annotations, from 4 clades or paraphyletic groups (embryophyta or land plants, vertebrates, invertebrates and fungi).\

#### a. Search for relevant genomes

First, we browse the NCBI database to get metadata from interesting genome. A relevant genome is defined as a genome with these caracteristics:

- an annotation is available
- it's a reference genome
- the assembly level is 'chromosome'

Reports available in [`./res/1_genome_selection/assembly_reports/`](./res/1_genome_selection/assembly_reports/).

#### b. Extraction of taxID from relevant genomes.

Then, we parse the metadata to extract the taxons ID of each group.

Taxons ID available in [`./res/1_genome_selection/taxID/`](./res/1_genome_selection/taxID/).

