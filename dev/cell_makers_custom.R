
cell_marker_list  <- list(
  "Lineage Marker" = list(
    "Immune Cells" = c("PTPRC"),
    "T Cells" = c("CD3D","CD3E","CD4","CD8A","CD8B"),
    "NK Cells" = c("NCAM1","KLRG1","FCGR3A","NKG7","GNLY","CD160"),
    "B/Plasma Cells" = c("CD19","MS4A1","CD79A","CD79B","SDC1","MZB1","XBP1","JCHAIN"),
    "Myeloid Cells" = c(c("LYZ","S100A8","S100A9","CD68","CD14","C1QB","C1QC")), #c("PTPRC", "CD14", "AIF1", "TYROBP", "CD163")),
    "pDC" = c("LILRA4","GZMB","JCHAIN","ITM2C","CLIC3"),
    "Mast Cells" = c("TPSAB1","TPSB2"),
    "Proliferating Cells" = c("MKI67","BIRC5","CDK1"),
    "Endothelial Cells" = c("PECAM1","VWF","ENG","MCAM"),
    "Fibroblast" = c("FAP","PDPN","COL1A2","DCN","COL3A1","COL6A1"),
    "Epithelial Cells (Stomach)" = c("EPCAM","MUC1","ERBB2","KRT8","PGC","GKN2","SLC5A5","FABP1","KRT20")
  ),
  "B/Plasma Cell Subsets" = list(
    "Naive B Cell" = c("BANK1","SELL","BACH2","FCER2","TCL1A","IL4R","CCR7"),
    "Activated B Cell" = c("CD69","NR4A2","CD83","CXCR4","NFKB1","TNF","BCL6","A4GALT"),
    "Memory B Cell" = c("BCL2","CR2","TNFRSF13B","CD53","CD82","ITGB1","S100A4","S100A10","CRIP1","CD80","TLR9","CD27","CD38"),
    "Plasma Cell" = c("JCHAIN","MZB1","XBP1","SDC1","TNFRSF17","JSRP1", "IGHM","IGHD","IGHG1","IGHG2","IGHG3","IGHG4","IGHA1","IGHA2"),
    "Plasmablast" = c("MKI67","TUBB","STMN1","TYMS", "CD74","HLA-DMA","HLA-DMB","HLA-DOA","HLA-DOB","HLA-DPA1","HLA-DPB1","HLA-DQA1","HLA-DQA2","HLA-DQB1","HLA-DQB2","HLA-DRA","HLA-DRB1")
  ),
  "CD4 & CD8 T cells" = list(
    "Naive" = c("CCR7","LEF1","SELL","TCF7","IL7R"),
    "Cytotoxic" = c("CX3CR1","PRF1","GZMA","GZMB","GZMH","GNLY","FGFBP2","CX3CR1","KLRG1","FCGR3A","NKG7","S1PR1"),
    "Memory" = c("EOMES","ANXA1","JUNB","CD69","CD44","CD40LG","NR4A1","LTB","TXNIP","S1PR1"),
    "Interferon Response" = c("IFIT1","IFIT2","IFIT3","IFI44L","OAS1","OAS3","RSAD2","CMPK2")
  ),
  "CD4T cells" = list(
    "Regulatory T cell" = c("FOXP3","IL2RA","TNFRSF18","TNFRSF4","PRDM1","CD27","BATF","CD28"),
    "T Follicular Helper Cell" = c("CTLA4","ICOS","TIGIT","PDCD1","TOX2","ITGAE")
  ),
  "CD8T cells" = list(
    "Central Memory T Cell" = c("CCR7","SELL","ANXA1","ANXA2","S1PR1","IL7R","CD74","TYROBP"),
    "Effector Memory T Cell" = c("GZMK","CCL4","CCL5","NKG7","KLRG1","LYAR","GZMM","TXNIP","FCRL6","FGFBP2","KLRD1","CX3CR1","FCGR3A"),
    "Tissue Resisdent Memory T Cell" = c("ITGAE","XCL1","ZNF683","NR4A1","KLRC1","ITGA1","KLRD1","KLRF1","GNLY","IL32"),
    "Exhausted T Cell" = c("LAYN","LAG3","TIGIT","PDCD1","HAVCR2","CTLA4","ITGAE","CXCL13","ENTPD1","GZMB","IFNG","CD27","BATF","TNFRSF9","CD28")
  ),
  "Other T cells" = list(
    "Gamma Delta  T Cell" = c("TRDV2","TRGV9"),
    "Mucosal Associated Invariant T Cell, MAIT Cell" = c("SLC4A10","KLRB1","ZBTB16","NCR3"),
    "Proliferative T Cell" = c("MKI67","TUBB"),
    "NK T Cell" = c("CD3D","CD3E","CD3G","NCAM1","KLRF1","KLRD1","FCGR3A")
  ),
  "Monocyte" = list(
    "CD14+ Monocytes" = c("CD14","VCAN","S100A8","S100A9","FCN1"),
    "CD16+ Monocytes" = c("FCGR3A","LST1","LILRB2","CDKN1C","FCN1"),
    "Monocyte_1" = c("LAIR2"),
    "Monocyte_2" = c("G0S2","NAMPT","NEAT1","AL137655","CSF3R"),
    "Monocyte_3" = c("PRF1","GNLY","KLRC4-KLRK1","TCRBV3S1","CTSW")
  ),
  "Macrophage" = list(
    "Macrophage_1" = c("INHBA","IL1RN","CCL4","CCL20"), 
    "Macrophage_2" = c("NLRP3","EREG","IL1B"),
    "Macrophage_3" = c("LYVE1","PLTP","SEPP1"),
    "Macrophage_4" = c("C1QC","C1QA","APOE","APOC1"),
    "Macrophage_5" = c("FABP5","FN1","PHLDA1","CCL2"),
    "Macrophage_6" = c("ATF3","HSPA1B","ZNF331","NR4A2")
  ),
  "Dendritic Cell" = list(
    "DC_1" = c("FCGR3A","FTL","SERPINA1","LST1","AIF1"), 
    "DC_2" = c("AXL","PPP1R14A","SIGLEC6","CD22","DAB2"),
    "DC_3" = c("GZMB","IGJ","AK128525","SERPINF1","ITM2C","LILRA4"),
    "DC_4" = c("S100A8","S100A9","VCAN","LYZ","ANXA1"), 
    "DC_5" = c("CD1C","FCER1A","CLEC10A"),
    "DC_6" = c("CLEC9A","C1ORF54","HLA-DPA1","CADM1","CAMK2D","XCR1"),
    "DC_7" = c("LAMP3","CCR7","FSCN1")
  ),	
  "Mast" = list(
    "Mast_1" = c("TPSAB1","TPSB2","KIT","CPA3")
  )
)


#

cell_marker_custom <- data.frame()

for(cell_group in names(cell_marker_list)) {

  provisional <- data.frame(
    celltype = cell_group,
    stack(cell_marker_list[[cell_group]])
  )
  
  cell_marker_custom <- rbind(
    cell_marker_custom,
    provisional
  )
  
}

#

cell_marker_custom <- cell_marker_custom %>%
  mutate(
    gene = values,
    species = 'Human',
    tissue = celltype,
    celltype = ind,
    cancer = 'Normal',
    subtype1 = NA,
    subtype2 = NA,
    subtype3 = NA,
    resource = 'Knowledge-based',
    pmid = 'Unknown'
  )

cell_marker_custom <- cell_marker_custom %>%
  select(gene, celltype, species, tissue, cancer, subtype1, subtype2, subtype3, resource, pmid
  )

write_tsv(cell_marker_custom, file = "./Test/cell_marker_custom.tsv")

