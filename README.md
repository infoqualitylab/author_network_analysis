# Author Network Analysis

# ExRx
The ExRx folder contains the below folders -
  1. **raw data** : Contains the raw dataset (csv files) along with data extracted through Scopus.  
  2. **data** : This folder contains the databank depoist new and old version of data
  3. **ExRx Data Quality** : Contains the below mentioned python codes and output used to generate a final datafile 
     - File exrx_author.csv : After scopus retrieved author details, manual check and inclusion of author id's for papers that were not retrieved through scopus article name/doi
     - data_quality_title.ipynb - Match the titles of the articles in both the Article_list.csv and scopus retreived exrx_author.csv files.
     - data_quality_author_id_check.ipynb - Check oversplitting and undersplittiong issue, authors with same name have different id's.
       After the manual changes were made a final file exrx_author_final.csv created by Manasi on 4/2/2022.
     - author_name_component_check.ipynb - Checked each cluster in the visualization to make sure that there are no suspiciously similar names in the same cluster.
     - Final manual changes were made on the exrx_author_final.csv file and the dataset is in the folder **data/databank_deposit_v2** as of 4/9/2022.
      
  4. **CoAuthor Network Visualization** : The folder contains below two folders.
     
  * python_code - 
    - Generating co-author network.ipynb - A python script generates co-author visalizations (an entire graph and a main connected component graph. There are other tables that help understand the nodes and co-author network in a broader way. i.e. Degree centrality, betweness centrality, closeness_centrality, eigenvector_centrality, effective_size and top 10 authors with most number of co-authors.
    - edge_node_color_review_study_exrx.ipynb - Python script reading the data from authors and article list datasets. Replacing the different names of authors with same id with the same name. The visualizations are split into two **edge color** and **node color**. 
      **Edge color** - edge color displaying the review article percentage i.e. co-authors with 100% review or publisher 
      **Node color** - Calculated the review article type percent for each author i.e. node in the graph. Displays if the author/node of the graph is a 100% reviewer/publisher.
    - edge_node_color_publications_exrx.ipynb - Python script reading the data from authors and article list datasets. Replacing the different names of authors with same id with the same name. The difference is the authors included in the graph depends on the number of publications for each author. A threshold is set to 3 and authors with 3 or more publications are included in the graph as nodes. The visualizations are split into two **edge color** and **node color**. 
      **Edge color** - edge color displaying the review article percentage i.e. co-authors with 100% review or publisher 
      **Node color** - Calculated the review article type percent for each author i.e. node in the graph. Displays if the author/node of the graph is a 100% reviewer/publisher.
      
  ***color for the graphs edge and node can be changed in the edge_cmap(edge) or cmap (node) section as mentioned in the comment for the code.***
  
  
  * Visualizations - 
    Output for each generated graph/visualizations from the above mentioned python notebooks is present in this folder.
    
# Salt 
The ExRx folder contains the below folders -
  1. **data_prep** : Contains the raw dataset (csv files) along with data extracted through Scopus.  
  2. **data** : This folder contains the databank depoist new and old version of datasets after correction.
  3. **data quality** : Contains the below mentioned python codes and output used to generate a final datafile 
     - File after_correction.csv : After scopus retrieved author details, manual check and inclusion of author id's for papers that were not retrieved through scopus article name/doi
     - data_quality_check_zoi_question.ipynb - Match the titles of the articles in both the Article_list.csv and scopus retreived exrx_author.csv files.
     - under_splitting_checking.csv - Check oversplitting and undersplitting issue, authors with same name have different id's.
     - data_quality_check.ipynb - Checked each cluster in the visualization to make sure that there are no suspiciously similar names in the same cluster.
     - Final manual changes were made on the after_corrections.csv file and the dataset is in the folder **data/databank_deposit_v2** as of 4/9/2022.
      
  4. **CoAuthor Network Visualization** : The folder contains below two folders.
     
  * python_code - 
    - Generating co-author network-salt.ipynb - A python script generates co-author visalizations (an entire graph and a main connected component graph. There are other tables that help understand the nodes and co-author network in a broader way. i.e. Degree centrality, betweness centrality, closeness_centrality, eigenvector_centrality, effective_size and top 10 authors with most number of co-authors.
    - edge_node_color_review_study_salt.ipynb - Python script reading the data from authors and article list datasets. Replacing the different names of authors with same id with the same name. The visualizations are split into two **edge color** and **node color**. 
      **Edge color** - edge color displaying the review article percentage i.e. co-authors with 100% review or publisher 
      **Node color** - Calculated the review article type percent for each author i.e. node in the graph. Displays if the author/node of the graph is a 100% reviewer/publisher.
    - edge_node_color_publications_salt.ipynb - Python script reading the data from authors and article list datasets. Replacing the different names of authors with same id with the same name. The difference is the authors included in the graph depends on the number of publications for each author. A threshold is set to 3 and authors with 3 or more publications are included in the graph as nodes. The visualizations are split into two **edge color** and **node color**. 
      **Edge color** - edge color displaying the review article percentage i.e. co-authors with 100% review or publisher 
      **Node color** - Calculated the review article type percent for each author i.e. node in the graph. Displays if the author/node of the graph is a 100% reviewer/publisher.
   
    ***color for the graphs edge and node can be changed in the edge_cmap(edge) or cmap (node) section as mentioned in the comment for the code.***
 
    
  * Visualizations - 
    Output for each generated graph/visualizations from the above mentioned python notebooks is present in this folder.
    
   5. community_detection ?? (Yuanxi)
    
    
 
