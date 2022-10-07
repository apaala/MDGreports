# MDGreports
Reports for PacBio and Illumina

Using pacbio_wrapper.sh

    sh pacbio_wrapper.sh <path_to_pacbio_report_v0.Rmd> <run_id> <cell_id> <outdir>

Instructions:

1.	git clone https://github.com/apaala/MDGreports.git
2.	gather inputs:
a.	Rscript markdown directory (.Rmd)
b.	Run ID
c.	Cell ID
d.	Outdir
3.	Command: 
sh <path to wrapper.sh> <path to .Rmd> <run ID> <cell ID> <outdir>

ex.
sh /path/to/pacbio_wrapper.sh /path/to/MDGreports/pacbio_report_v0.Rmd runID cellID /path/to/outdir//

Using illumina_wrapper.sh

    sh illumina_wrapper.sh <path_to_pacbio_report_v0.Rmd> <run_id> <project_id> <outdir>

Instructions:

1.      git clone https://github.com/apaala/MDGreports.git
2.      gather inputs:
a.      Rscript markdown directory (.Rmd)
b.      Run ID
c.      Project ID
d.      Outdir
3.      Command:
sh <path to wrapper.sh> <path to .Rmd> <run ID> <Project ID> <outdir>

ex.
sh /path/to/illumina_wrapper.sh /path/to/MDGreports/illumina_report_v0.Rmd runID projectID /path/to/outdir//

