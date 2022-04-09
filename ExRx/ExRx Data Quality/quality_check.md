File exrx_author.csv : After scopus retrieved author details, manual check and inclusion of author id's for papers that were not retrieved through scopus article name/doi

Performed data quality check
1. data_quality_title.ipynb -
   Match the titles of the articles in both the Article_list.csv and scopus retreived exrx_author.csv files.
2. data_quality_author_id_check.ipynb - 
  Check oversplitting issue, authors with same name have different id's.

After the manual changes were made a final file exrx_author_final.csv created by Manasi on 4/2/2022.

3. author_name_component_check.ipynb -
  Checked each cluster in the visualization to make sure that there are no suspiciously similar names in the same cluster. 


Final manual changes were made on the  exrx_author_final.csv file and the dataset is in the folder data/databank_deposit_v2 as of 4/9/2022.
