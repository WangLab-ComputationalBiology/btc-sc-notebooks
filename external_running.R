#!/usr/bin/env Rscript

if(!require("annotables")) {
  devtools::install_github("stephenturner/annotables", repos = 'http://cran.us.r-project.org')
}

if(!require("HGNChelper")) {
  install.packages("HGNChelper", Ncpus = 8, repos = 'http://cran.us.r-project.org', clean = TRUE)  
}

# Getting run work directory
here <- getwd()

# Pipeline steps
main_normalize <- FALSE
main_clustering <- FALSE
cell_stratification <- FALSE
cell_annotation <- FALSE
normal_reduction <- FALSE
batch_correction <- FALSE
normal_cluster <- FALSE
normal_deg <- FALSE
malignant_deg <- FALSE
malignant_programs <- FALSE

# Command singularity
# singularity exec -B /rsrch6/home/genomic_med/affaustino/Projects/btc-scrna-pipeline/notebook/ scpackages_1.1.sif /usr/bin/sh

# Step X - Description
# Output: Test_normalize_object.RDS
if(main_normalize) {
  rmarkdown::render(
      "notebook_normalize.Rmd",
      params = list(
        input_qc_approved = "./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_ASCITES_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45P_ASCITES_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45N_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45P_RIGHT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45P_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-022_S1_CD45P_BOWEL_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-022_S1_CD45N_RIGHT_ADNEXA_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_BOWEL_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_BOWEL_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-022_S1_CD45P_RIGHT_ADNEXA_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_PELVIC_PERITONEUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_RIGHT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_LEFT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_LEFT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_LEFT_UPPER_QUADRANT_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_RIGHT_UPPER_QUADRANT_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_RIGHT_UPPER_QUADRANT_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_RIGHT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45N_RIGHT_FALLOPIAN_TUBE_seurat_object.RDS"
      ),      
      output_dir = here,
      output_file = "Test_normalize_report.html"
      )
}

# Step X - Description
# Output: Test_main_cluster_object.RDS
if(main_clustering) {
  rmarkdown::render(
      "notebook_cell_clustering.Rmd",
      params = list(
        project_object = "./data/Test_normalize_object.RDS",
        input_integration_method = 'pca'
      ),
      output_dir = here,
      output_file = "Test_cluster_report.html"
      )           
}

# Step X - Description
# Output: Test_stratification_object.RDS, Test_nonMalignant_stratification_object.RDS, Test_Malignant_stratification_object.RDS
if(cell_stratification) {
  rmarkdown::render(
    "notebook_cell_stratification.Rmd",
    params = list(
        project_object = "./data/Test_main_cluster_object.RDS",
        thr_proportion = 0.05,
        n_threads = 8
      ),
    output_dir = here,
      output_file = "Test_stratification_report.html"
    )           
}

# Step X - Description
# Output: Test_cell_annotation.RDS
if(cell_annotation) {
  rmarkdown::render(
      "notebook_cell_annotation.Rmd",
      params = list(
        project_object = "./data/Test_nonMalignant_stratification_object.RDS"
      ),
      output_dir = here,
      output_file = "Test_annotation_report.html"
      )           
}

# Step X - Description
# Output: Test_nonMalignant_reduction_object.RDS
if(normal_reduction) {
  rmarkdown::render(
      "notebook_dimensionality_reduction.Rmd",
      params = list(
          project_object = "./data/Test_cell_annotation.RDS",
          input_stratification_method = 'infercnv_label',
          input_cell_category = "Normal",
          input_step_name = "nonMalignant"
        ),
      output_dir = here,
      output_file = "Test_nonmalignant_dimensionality_report.html"
      )           
}

# Step X - Description
# Output: Test_nonMalignant_batch_object.RDS
if(batch_correction) {
  rmarkdown::render(
    "notebook_batch_correction.Rmd",
    params = list(
          project_object = "./data/Test_nonMalignant_reduction_object.RDS",
          input_integration_method = "harmony",
          input_step_name = "nonMalignant"
      ),
    output_dir = here,
    output_file = "Test_nonmalignant_report.html"
  )         
}

# Step X - Cluster nonMalignant cells
# Output: Test_nonMalignant_cluster_object.RDS
if(normal_cluster) {
  rmarkdown::render(
      "notebook_cell_clustering.Rmd",
      params = list(
          project_object = "./data/Test_nonMalignant_batch_object.RDS",
          input_integration_method = "harmony",
          input_step_name = "nonMalignant"
        ),
      output_dir = here,
      output_file = "Test_nonmalignant_cluster_report.html"
      )
}

# Step X - Description
# Output: Test_nonMalignant_deg_object.RDS
if(normal_deg) {
  rmarkdown::render(
    "notebook_differential_expression.Rmd",
    params = list(
      project_object = "./data/Test_nonMalignant_cluster_object.RDS"
    ),
    output_dir = here,
    output_file = "Test_nonmalignant_deg_report.html"
  )
}

