#!/usr/bin/env Rscript

# Getting run work directory
here <- getwd()

# Pipeline steps
main_normalize <- TRUE
main_cluster <- TRUE
cell_stratification <- TRUE
cell_annotation <- TRUE

# Rendering Rmarkdown script
if(main_normalize) {
  rmarkdown::render(,
      output_dir = here,
      output_file = "Test_cluster_report.html"
      )           
}

