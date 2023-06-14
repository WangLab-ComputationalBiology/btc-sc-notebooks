#!/usr/bin/env Rscript

# Getting run work directory
here <- getwd()

# Pipeline steps
main_normalize <- FALSE
main_cluster <- FALSE
cell_stratification <- TRUE
cell_annotation <- FALSE

# Rendering Rmarkdown script
if(main_normalize) {
  rmarkdown::render(
      "notebook_normalize.Rmd",
      output_dir = here,
      output_file = "Test_normalize_report.html"
      )           
}

if(main_cluster) {
  rmarkdown::render(
      "notebook_cell_clustering.Rmd",
      output_dir = here,
      output_file = "Test_cluster_report.html"
      )           
}

if(cell_stratification) {
  rmarkdown::render(
    "notebook_cell_stratification.Rmd",
    params = list(
      thr_proportion = 0.20,
      n_threads = 20
    ),
    output_dir = here,
      output_file = "Test_stratification_report.html"
      )           
}

if(cell_annotation) {
  rmarkdown::render(
      "notebook_cell_annotation.Rmd",
      output_dir = here,
      output_file = "Test_annotation_report.html"
      )           
}