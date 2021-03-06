# Automated workflow for small RNA sequence data
Snakemake workflow for processing small RNA-seq libaries produced by Illumina small sequencing kits.

# Requirments
- demultiplex fastq files in located in `data` directory. They need to be in the form `{sample}_R1.fastq.gz`
- `Snakefile` shipped with this repository.
- `config.yaml` shipped with this repository. It contains all parameters and settings to customize the processing of the current dataset.
-  `samples.csv` listing all samples in the `data` directory withoug the `_R1.fastq.gz` suffix. The first line is the header i.e. the work `library`. An example is shipped with this repository which can be used as a template.
- Optionall: `environment.yaml` to create the software environment if conda is used.
- Installation of [snakemake](https://snakemake.readthedocs.io/en/stable/) and optionally [conda](https://conda.io/docs/)
- If conda is not used, `bowtie`, `fastqc`, `samtools` and `deeptools` need to be in the PATH.

    The above files can be downloaded as a whole by cloning the repository (which requires git):

```
git clone https://github.com/seb-mueller/snakemake_sRNAseq.git
```
Or individually for example the `Snakemake` file using `wget`:

```
wget https://raw.githubusercontent.com/seb-mueller/snakemake_sRNAseq/master/Snakefile
```

# creating conda environment
```
conda env create --file environment.yaml --name srna_mapping
```

# activate 

```
source activate srna_mapping
```
To `deactivate` the environment, run:

```
source deactivate
```

# Update:
```
git pull
conda env update --file environment.yaml --name srna_mapping
```
# Usage:

Navigate in a Unix shell to the base directory contains the files listed above plus the `data` directory including the data like int this example:

```
.
├── data
│   ├── test2_R1.fastq.gz
│   └── test3_R1.fastq.gz
├── config.yaml
├── environment.yaml
├── samples.csv
└── Snakefile
```

Then just run snakmake in base directory:


```
snakemake 
```
## useful parameters:
- `--cores` max number of threads
- `-n` dryrun
- `-p` print commands
- `--use-conda`
- `--conda-prefix ~/.myconda`
- `--forcerun postmapping` forces rerun of a given rule (e.g. `postmapping`)
 

# Output:

`trimmed`, `log` and `mapped` directory with trimming and mapping results.

