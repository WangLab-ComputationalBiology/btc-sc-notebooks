#!/usr/bin/env Rscript

# Getting run work directory
here <- getwd()

# Pipeline steps
main_normalize <- FALSE
main_clustering <- FALSE
cell_stratification <- FALSE
cell_annotation <- FALSE
normal_reduction <- TRUE
batch_correction <- TRUE
normal_cluster <- TRUE
normal_deg <- FALSE
malignant_deg <- FALSE
malignant_programs <- FALSE

# Rendering Rmarkdown script

# Step X - Description
# Output: Test_normalize_object.RDS
if(main_normalize) {
  rmarkdown::render(
      "notebook_normalize.Rmd",
      params = list(
        project_object = "./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_ASCITES_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45P_ASCITES_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45N_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45P_RIGHT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45P_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-022_S1_CD45P_BOWEL_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-022_S1_CD45N_RIGHT_ADNEXA_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_BOWEL_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_BOWEL_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-022_S1_CD45P_RIGHT_ADNEXA_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_PELVIC_PERITONEUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_RIGHT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_LEFT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_LEFT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_LEFT_UPPER_QUADRANT_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_RIGHT_UPPER_QUADRANT_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_RIGHT_UPPER_QUADRANT_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45P_RIGHT_OVARY_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-009_S1_CD45N_INFRACOLIC_OMENTUM_seurat_object.RDS;./dev/data/normalize/SPECTRUM-OV-065_S1_CD45N_RIGHT_FALLOPIAN_TUBE_seurat_object.RDS",
      ),      
      output_dir = here,
      output_file = "Test_normalize_report.html"
      )
}

# Step X - Description
# Output: Test_cluster_object.RDS
if(main_clustering) {
  rmarkdown::render(
      "notebook_cell_clustering.Rmd",
      params = list(
        project_object = "./data/Test_normalize_object.RDS",
      ),
      output_dir = here,
      output_file = "Test_cluster_report.html"
      )           
}

# Step X - Description
# Output: Test_stratification_object.RDS
if(cell_stratification) {
  rmarkdown::render(
    "notebook_cell_stratification.Rmd",
    params = list(
        project_object = "./data/Test_stratification_object.RDS",
        thr_proportion = 0.20,
        n_threads = 20
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
        project_object = "./data/Test_stratification_object.RDS",
      ),
      output_dir = here,
      output_file = "Test_annotation_report.html"
      )           
}

# Step X - Description
# Output: Test_nonmalignant_object.RDS
if(normal_reduction) {
  rmarkdown::render(
      "notebook_dimensionality_reduction.Rmd",
      params = list(
          project_object = "./data/Test_cell_annotation.RDS",
          input_stratification_method = 'infercnv_label',
          input_cell_category = "Normal",
          input_step_name = "nonmalignant"
        ),
      output_dir = here,
      output_file = "Test_nonmalignant_dimensionality_report.html"
      )           
}

# Step X - Description
# Output: Test_batch_object.RDS
if(batch_correction) {
  rmarkdown::render(
    "notebook_batch_correction.Rmd",
    params = list(
          project_object = "./data/Test_nonmalignant_object.RDS",
          input_integration_method = "harmony",
          input_step_name = "nonmalignant"
      ),
    output_dir = here,
    output_file = "Test_nonmalignant_report.html"
  )         
}

# Step X - Description
# Output: Test_nonmalignant_cluster_object.RDS
if(normal_cluster) {
  rmarkdown::render(
      "notebook_cell_clustering.Rmd",
      params = list(
          project_object = "./data/Test_batch_object.RDS",
          input_integration_method = "harmony",
          input_step_name = "nonmalignant"
        ),
      output_dir = here,
      output_file = "Test_nonmalignant_cluster_report.html"
      )           
}