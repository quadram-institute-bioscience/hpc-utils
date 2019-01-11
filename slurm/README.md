# Slurm wrapper

This is a simple wrapper for sending jobs to SLURM at QI.

### Installation

Place this directory in your home, adding it to the path.

The first time that *sb.pl* is run, it will attempt creating two subdirectories:
 - **~/slurm/jobs**: to store jobs scripts
 - **~/slurm/logs**: to store logs, STDERR and STDOUT

Add ~/slurm to your $PATH to ensure the ability to invoke 'sb.pl' from anywhere.

#### Optional files

If you use Miniconda create a file called ~/conda_source with the Miniconda installation path, like:
```
export PATH=/home/yourname/Minicondaconda3/bin:$PATH
```

If you want to store your e-mail address as default recipient, simply type the e-mail address in a file called `~/.slurm_default_mail`

### Usage

```
 ------------------------------------------------------------------------------------
  Prepare job for SLURM scheduler at NBI/QIB
 ------------------------------------------------------------------------------------
 General use:
 sb.pl [options]  'your unix command'

 Options:
   -d, --days  INT              Days required (0)
   -h, --hours INT              Hours required (24)
   -c, --cores INT              CPU cores required (1)
   -m, --mem   INT              Gb of RAM required (16)
   -n, --name  STR              Job name (can be autogenerated)
   -s, --source STR             Load this module, can be invoked multiple times
   -a, --after INT              After success of JOB ID
   
   --intel                      Force intel CPU
   --ei                         Use EI software catalogue (otherwise NBI)
   --conda                      Source Anaconda (requires $HOME/conda_source)

   --mail                       Send mail with job details
   --address                    Specify e-mail address 

   --save                       Save the job in /hpc-home/telatina/slurm//jobs (default: STDOUT)
   -r, --run                    Save AND run the job (default: print to STDOUT)
   -f, --nocheck                Disable filepath check 

   Job files are saved in /hpc-home/telatina/slurm//jobs
   Log files are saved in /hpc-home/telatina/slurm//logs
 ------------------------------------------------------------------------------------
```

### Examples

 - To view the script:

`sb.pl -c 6 -h 8 -s samtools-1.5 "samtools view -bS aln.sam | samtools sort -@ 6 -o aln.bam -"`

 - To run the script:

`sb.pl -c 6 -h 8 -s samtools-1.5  --run "samtools view -bS aln.sam | samtools sort -@ 6 -o aln.bam -"`

#### To specify requested time
Use the -d DAYS -h HOURS switces

#### To use a conda environment
Place a 'conda_source' file in your home, then use the `--conda` to source it, and finally `-s ENV` to require a specific environmenet

#### To use software installed as modules
Generally use as many `-s MODULE` switches as needed, they'll be taken from NBI catalogue. Also add `--ei` to switch to EI catalogue


### Logs

By default every script is saved in `~/slurm/jobs` and STDOUT/STDERR files in `~/slurm/logs`.

To search these files knowing the jobname:

`sb.pl --search JOBNAME`

	
### Author
[Andrea Telatin](https://quadram.ac.uk/people/andrea-telatin/)
