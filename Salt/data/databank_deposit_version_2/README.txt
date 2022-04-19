
Title: Evidence Production and Reuse for the Salt Controvery
Author: Yuanxi Fu, Tzu-Kun Hsiao, Manasi Ballal Joshi

License: CC-BY

Related Article 	
Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184

Related Article 	
Hsiao, T. K., Fu, Y., & Schneider, J. (accepted). Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014 [Short paper]. 83rd Annual Meeting of the Association for Information Science and Technology.

Related Dataset
Fu, Yuanxi; Hsiao, Tzu-Kun (2020): Dataset for "Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014". University of Illinois at Urbana-Champaign. https://doi.org/10.13012/B2IDB-9222782_V1

Dataset Description
This dataset covers 14 systematic reviews and 67 primary study articles concerning the salt controversy (i.e., whether a population-level salt reduction is beneficial). Systematic reviews and primary studies, as well as their opinion classification (for, against, and inconclusive) were collected from Trinquart (Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184). Systematic reviews were published between 2002 and 2014, and primary study articles were published between 1978 and 2014. If a systematic review i include a primary study article j, the network will contain a directed edge from i to j.  
We collected additional data on these 81 articles, including their authors (disambiguated) and inclusion criteria of the systematic reviews. 

FILE FORMATS
1) article_list.csv - Unicode CSV
2) salt_cont_author.csv - Unicode CSV
3) inclusion_net_edges.csv - Unicode CSV
4) potential_inclusion_link.csv - Unicode CSV
5) systematic_review_inclusion_criteria.csv - Unicode CSV
6) Supplementary Reference List.pdf - PDF

ROW EXPLANATIONS
1) article_list.csv - Each row describes a systematic review or included article.
2) salt_cont_author.csv - Each row is an occurrence of one author authoring an article.
3) inclusion_net_edges.csv - Each row represents an inclusion from a systematic review to an article.
4) potential_inclusion_link.csv - Each row shows the available evidence base of a systematic review.
5) systematic_review_inclusion_criteria.csv - Each row is the inclusion criteria of a systematic review.
6) Supplementary Reference List.pdf - Each item is a bibliographic record of a systematic review/included paper.

COLUMN HEADER EXPLANATIONS

1) article_list.csv:
ID - Numeric ID of the paper
short_name - short name assigned to each paper by Trinquart et al. (2016), usually first author's last name + publication year
type - Systematic review / primary study report
study_groupings - Groupings for related primary study reports from the same report, from Trinquart et al. (2016) (if applicable, otherwise blank)
title - Title of the paper
year - Publication year of the paper
attitude - Scientific opinion about the salt controversy from Trinquart et al. (2016)
doi - DOIs of the paper. (if applicable, otherwise blank)
retracted(Y/N) - Whether the paper was retracted or withdrawn (Y). Blank if not retracted or withdrawn.
study_design - The study design of an article, which takes the following values: Case Control, Cohort, Systematic Review, and RCT

2) salt_cont_author.csv: 
ID - numeric ID of the paper
title - Title of the paper
author_given_name - The given name of the author
author_surname - The surname of the author
author_id - Unique identifier of the author, either from Scopus Author ID or assigned by us.
organizational_author - If a paper is published under the name of an organization, it is stored in this column. 
manual - If TRUE, the author information was extracted manually. If FALSE, the author information was retrieved from Scopus citation database. 

3) inclusion_net_edges.csv:
citing_ID - The numeric ID of a systematic review
cited_ID - The numeric ID of the included articles

4) potential_inclusion_link.csv:
This data was translated from the Sankey diagram given in Trinquart et al. (2016) as Web Figure 4. Each row indicates a systematic review and each column indicates a primary study. In the matrix, "p" indicates that a given primary study had been published as of the search date of a given systematic review.

5)systematic_review_inclusion_criteria.csv:
ID - The numeric IDs of systematic reviews
paper assigned ID - ID of the paper from Trinquart et al. (2016)
attitude - Its scientific opinion about the salt controversy from Trinquart et al. (2016)
No. of studies included - Number of articles included in the systematic review
Study design - Study designs to include, per inclusion criteria
population - Populations to include, per inclusion criteria
Exposure/Intervention - Exposures/Interventions to include, per inclusion criteria
outcome - Study outcomes required for inclusion, per inclusion criteria
Language restriction - Report languages to include, per inclusion criteria
follow-up period - Follow-up period required for inclusion, per inclusion criteria

DIFFERENCES BETWEEN THIS VERSION AND THE PREVIOUS ONE
- The file Article_attr.csv was removed due to redundancy. The file article_list.csv contains all information.
- A new file salt_cont_author.csv was added
- Corrected two mistakes in article_list.csv, and change all column names to lower cases for consistency.
- A new column, "study_design" was added to article_list.csv
- Acronyms "Group, H. P. T. R" and "Group, T. of H. P. C. R." were corrected to "Hypertension Prevention Trial Research Group" in "Supplementary Reference List.pdf."

Completion date: April 8, 2022
