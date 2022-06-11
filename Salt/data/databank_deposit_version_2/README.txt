Title: The Salt Controversy Systematic Review Reports and Primary Study Articles Network Dataset
Authors: Yuanxi Fu, Tzu-Kun Hsiao, Manasi Ballal Joshi
 
License: CC-BY
Keywords: systematic reviews; evidence synthesis; network analysis; public health; salt controversy;

Related Article 	
Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184
 
Related Article 	
Hsiao, T. K., Fu, Y., & Schneider, J. Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014 [Short paper]. 83rd Annual Meeting of the Association for Information Science and Technology. In Proceedings of the Association for Information Science and Technology Volume 57, Issue 1:e315 http://doi.org/https://doi.org/10.1002/pra2.315 Preprint: http://jodischneider.com/pubs/asist2020.pdf
 
Related Dataset
Fu, Yuanxi; Hsiao, Tzu-Kun (2020): Dataset for "Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014". University of Illinois at Urbana-Champaign. https://doi.org/10.13012/B2IDB-9222782_V1
 
Dataset Description
The salt controversy is the public health debate about whether a population-level salt reduction is beneficial. This dataset covers 14 systematic review reports (SRRs) and 68 primary study articles (PSAs) addressing the effect of sodium intake on cerebrocardiovascular disease or mortality. The systematic review reports, primary study articles, and their opinion classification (for, against, and inconclusive) were collected from Trinquart et al. (2016) (Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184 ). If a systematic review report SRR includes a primary study article PSA, the inclusion network contains a directed edge from SRR to the PSA. We extracted the inclusion criteria from the 14 systematic review reports. To construct the co-author network, we retrieved author information for all articles and performed author disambiguation. Collectively, this dataset reflects the evidence production and reuse patterns and the scientific community that performed this evidence production and reuse. 
 
FILES AND FILE FORMATS
1) article_list.csv - Unicode CSV
2) salt_cont_author.csv - Unicode CSV
3) inclusion_net_edges.csv - Unicode CSV
4) potential_inclusion_link.csv - Unicode CSV
5) systematic_review_inclusion_criteria.csv - Unicode CSV
6) Supplementary Reference List.pdf - PDF
6) inclusion_net_edges_trinquart.csv - Unicode CSV
 
ROW EXPLANATIONS
1) article_list.csv - Each row describes a systematic review report or included primary study article.
2) salt_cont_author.csv - Each row is an occurrence of one author authoring an article.
3) inclusion_net_edges.csv - Each row represents an inclusion from a systematic review report to an article.
4) potential_inclusion_link.csv - Each row shows the available evidence base of a systematic review report.
5) systematic_review_inclusion_criteria.csv - Each row is the inclusion criteria of a systematic review report.
6) Supplementary Reference List.pdf - Each item is a bibliographic record of a systematic review report or included primary study article.
7) inclusion_net_edges_trinquart.csv - Each row represents an inclusion from a systematic review report to a primary study article.
 
COLUMN HEADER EXPLANATIONS
1) article_list.csv: ID - Numeric ID of the paper
short_name - Short name assigned to each paper by Trinquart et al. (2016), usually first author's last name + publication year
type - Systematic review / primary study report
study_groupings - Groupings for related primary study reports from the same report, from Trinquart et al. (2016) (if applicable, otherwise blank)
title - Title of the paper
year - Publication year of the paper
attitude - Scientific opinion about the salt controversy from Trinquart et al. (2016)
doi - DOIs of the paper (if applicable, otherwise blank)
retracted(Y/N) - Y if the paper was retracted or withdrawn. Blank if the paper was not retracted or withdrawn.
study_design - The study design of an article, which takes the following values: Case Control, Cohort, Systematic Review, and RCT
 
2) salt_cont_author.csv: 
ID - Numeric ID of the paper
title - Title of the paper
author_given_name - The given name of the author
author_surname - The surname of the author
author_id - Unique identifier of the author, either from Scopus Author ID or assigned by us.
organizational_author - If a paper is published under the name of an organization, it is stored in this column. 
Manual - If TRUE, the author information was extracted manually. If FALSE, the author information was retrieved from the Scopus citation database. 
 
3) inclusion_net_edges.csv:
citing_ID - The numeric ID of a systematic review report
cited_ID - The numeric ID of the included article
 
4) potential_inclusion_link.csv:
This data was translated from Web Figure 4 in the data supplement of Trinquart et al. (2016). Each row indicates a systematic review report, and each column indicates a primary study. In the matrix, "p" indicates that a given primary study had been published as of the search date of a given systematic review report.
 
5)systematic_review_inclusion_criteria.csv:
ID - The numeric IDs of systematic review reports.
short_name - ID of the paper from Trinquart et al. (2016).
attitude - Its scientific opinion about the salt controversy from Trinquart et al. (2016)s.
no_of_studies_included - Number of studies included in the systematic review report.
no_of_articles_included – Number of articles included in the systematic review report.
article_included_in_Trinquart_data – Number of articles included in the Trinquart dataset.
study_design - Study designs to include, per inclusion criteria, as described in the article.
study_design_unified – Unified coding for the study_design, reduced from study_design column.
population - Populations to include, per inclusion criteria, as described in the article.
population_unified – Unified coding for population, reduced from population column.
exposure_intervention - Exposures/Interventions to include, per inclusion criteria, as described in the article.
exposure_intervention_unified – Unified coding for exposure/intervention, reduced from the "exposure_intervention" column. 
outcome - Study outcomes required for inclusion, per inclusion criteria, as described in the article. 
Language_restriction - Report languages to include, per inclusion criteria. We did not reduce "outcome" to codes like previous columns because outcomes are too heterogeneous to be reduced.
Follow_up_period - Follow-up period required for inclusion, per inclusion criteria, as described in the article. 
Follow_up_period_unified – Unified coding for follow-up period, reduced from te “follow_up_period” column. 
Notes – Notes about each entry.

DIFFERENCES BETWEEN THIS DATASET AND RELATED DATASET (Fu and Hsiao, 2020 https://doi.org/10.13012/B2IDB-9222782_V1 )
- The file Article_attr.csv was removed due to redundancy. The file article_list.csv contains all information.
- A new file salt_cont_author.csv was added
- Corrected a couple of mistakes in article_list.csv, and change all column names to lower cases for consistency. In particular, we corrected the classification of two SRRs, Graudal 2014 (from “for” to “against”) and Poggio 2014 (from “against” to “for”), whose “statements” based on which “judgment” was made were mistakenly swapped in Web Table 2 of the supplement of Trinquart et al. 2016. 
- A new column, "study_design" was added to article_list.csv.
- Acronyms "Group, H. P. T. R" and "Group, T. of H. P. C. R." were corrected to "Hypertension Prevention Trial Research Group" in Supplementary Reference List.pdf.
- The edge list file (inclusion_net_edges.csv) was verified and corrected for a couple of mistakes.
- A new file inclusion_net_edges_trinquart.csv was added to record the edge list constructed by Trinquart et al. (2016), based on their Web Figure 4 in their supplementary data file. Differences between inclusion_net_edges.csv and inclusion_net_edges_trinquart.csv are explained in the next section.

7) inclusion_net_edges_trinquart.csv:
citing_ID - The numeric ID of a systematic review report
cited_ID - The numeric ID of the included article

DIFFERENCES BETWEEN INCLUSION_NET_EDGES.CSV AND INCLUSION_NET_EDGES_TRINQUART.CSV
SRR1: identical
SRR2: identical
SRR3: identical

SRR4: Web Figure 4 has 15 edges, and our edge list has 13 edges. The differences are 2-->34 and 2-->56. Articles 34 and 56 were not found as included study articles in SRR4.

SRR5: identical
SRR6: identical

SRR7: Web Figure 4 has 13 edges, and our edge list has 12 edges. Web Figure 4 has additional edges 2 --> 34. Article 34 was not found as an included study article in the SR.

SRR8: Web Figure 4 has 23 edges, and our edge list has 21 edges. Web Figure 4 has additional edges 2-->34 and 2-->43, which were not found as included study articles in SRR8.

SRR9: Web Figure 4 has 23 edges, and our edge list has 21 edges. Web Figure 4 has additional edges 2-->34 and 2-->43, which were not found as included study articles in SRR8.

SRR10: identical

SRR11: Web Figure 4 has 26 edges, and our edge list has 27 edges. Our edge list has an additional edge 11 --> 75, which was found as an included study article in SR11 (Table F-4).

SRR12: identical

SRR13: Web Figure 4 has 28 edges, and our edge list has 26 edges. The differences:
- our edge list has 13 --> 46, 13 --> 76 that are not in the Web Figure 4. 
- Web Figure 4 has: 13 --> 34, 13 --> 42, 13 --> 55 that are not in the edge list.
Reason:
Articles 46 and 76 were found as included study articles in SRR13.
Articles 34, 42, and 55 were not found as included study articles in SRR13. Article 55 was dropped because of the lack of RCTs identified. 

SRR14: Web Figure 4 has 11 edges, and our edge list has 11 edges too. The difference:
Web Figure 4 has 14 --> 33, and our edge list has 14 --> 52 instead. 
Reason: 
Article 33 was not found as an included study article in SRR14. It was excluded (figure 2)
Article 52 was an included study article in SRR14. 
