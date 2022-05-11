Title: The Salt Controversy Systematic Reviews and Primary Study Articles Network Dataset
Author: Yuanxi Fu, Tzu-Kun Hsiao, Manasi Ballal Joshi
 
License: CC-BY
Keywords: systematic reviews; evidence synthesis; network analysis; public health; salt controversy;
Related Article 	
Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184
 
Related Article 	
Hsiao, T. K., Fu, Y., & Schneider, J. (accepted). Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014 [Short paper]. 83rd Annual Meeting of the Association for Information Science and Technology.
 
Related Dataset
Fu, Yuanxi; Hsiao, Tzu-Kun (2020): Dataset for "Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014". University of Illinois at Urbana-Champaign. https://doi.org/10.13012/B2IDB-9222782_V1
 
Dataset Description
The salt controversy is the public health debate about whether a population-level salt reduction is beneficial. This dataset covers 14 systematic reviews and 68 primary study articles concerning the salt controversy. The systematic reviews, primary studies, and their opinion classification (for, against, and inconclusive) were collected from Trinquart (Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184). Systematic reviews were published between 2002 and 2014, and primary study articles were published between 1978 and 2014. If a systematic review SR includes a primary study article A, the network will contain a directed edge from SR to A. We extracted the inclusion criteria from the 14 systematic reviews. We also retrieved authorship data for all articles and performed author disambiguation on the authorship data.
 
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
1) article_list.csv: ID - Numeric ID of the paper
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
short_name - ID of the paper from Trinquart et al. (2016)
attitude - Its scientific opinion about the salt controversy from Trinquart et al. (2016)
no_of_studies_included - Number of studies included in the systematic review
no_of_articles_included – Number of articles included in the systematic review
article_included_in_Trinquart_data – Number of articles included in the Trinquart dataset
study_design - Study designs to include, per inclusion criteria, as described in the article
study_design_unified – unified coding for the study_design, reduced from study_design column
population - Populations to include, per inclusion criteria, as described in the article
population_unified – unified coding for population, reduced from population column
exposure_intervention - Exposures/Interventions to include, per inclusion criteria, as described in the article
exposure_intervention_unified – unified coding for exposure/intervention, reduced from the “exposure_intervention” column. 
outcome - Study outcomes required for inclusion, per inclusion criteria, as described in the article. 
Language_restriction - Report languages to include, per inclusion criteria
Follow_up_period - Follow-up period required for inclusion, per inclusion criteria, as described in the article. 
Follow_up_period_unified – unified coding for follow-up period, reduced from te “follow_up_period” column. 
Notes – notes about each entry

DIFFERENCES BETWEEN THIS DATASET AND RELATED DATASET (Fu and Hsiao, 2020)
- The file Article_attr.csv was removed due to redundancy. The file article_list.csv contains all information.
- A new file salt_cont_author.csv was added
- Corrected two mistakes in article_list.csv, and change all column names to lower cases for consistency.
- A new column, "study_design" was added to article_list.csv
- Acronyms "Group, H. P. T. R" and "Group, T. of H. P. C. R." were corrected to "Hypertension Prevention Trial Research Group" in "Supplementary Reference List.pdf."

milestones
- initial completion: April 8, 2022
- corrected the inclusion criteria: May 10, 2022

