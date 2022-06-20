Title: The Salt Controversy Systematic Review Reports and Primary Study Reports Network Dataset
Authors: Yuanxi Fu, Tzu-Kun Hsiao, Manasi Ballal Joshi
 
License: CC-BY
Keywords: systematic reviews; evidence synthesis; network analysis; public health; salt controversy;

Related Article 	
Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184
 
Related Article 	
Hsiao, T. K., Fu, Y., & Schneider, J. Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014 [Short report]. 83rd Annual Meeting of the Association for Information Science and Technology. In Proceedings of the Association for Information Science and Technology Volume 57, Issue 1:e315 http://doi.org/https://doi.org/10.1002/pra2.315 Preprint: http://jodischneider.com/pubs/asist2020.pdf
 
Related Dataset
Fu, Yuanxi; Hsiao, Tzu-Kun (2020): Dataset for "Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014". University of Illinois at Urbana-Champaign. https://doi.org/10.13012/B2IDB-9222782_V1
 
Dataset Description
The salt controversy is the public health debate about whether a population-level salt reduction is beneficial. This dataset covers 14 systematic review reports (SRRs) and 68 primary study reports (PSRs) addressing the effect of sodium intake on cerebrocardiovascular disease or mortality. The systematic review reports, primary study reports, and their opinion classification (for, against, and inconclusive) were collected from Trinquart et al. (2016) (Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184). A PSR is "included" in a systematic review if it is considered in the evidence sysnthesis toward reaching a final conclusion regarding the scientific question to be answered by a SRR. The inclusion network is a bipartite network with two types of nodes, one representing SSRs and one representing PSRs. In a inclusion network, if a SRR includes a PSR, there is a directed edge from the SRR to the PSR. We extracted the inclusion criteria from the 14 systematic review reports. To construct the co-author network, we retrieved author information for all articles and performed author disambiguation. Collectively, this dataset reflects the evidence production and reuse patterns and the scientific community that performed this evidence production and reuse.
 
FILES AND FILE FORMATS
1) report_list.csv - Unicode CSV
2) salt_cont_author.csv - Unicode CSV
3) inclusion_net_edges.csv - Unicode CSV
4) potential_inclusion_link.csv - Unicode CSV
5) systematic_review_inclusion_criteria.csv - Unicode CSV
6) Supplementary Reference List.pdf - PDF
6) inclusion_net_edges_trinquart.csv - Unicode CSV
 
ROW EXPLANATIONS
1) report_list.csv - Each row describes an SSR or a PSR.
2) salt_cont_author.csv - Each row is an occurrence of one author authoring a report.
3) inclusion_net_edges.csv - Each row represents an inclusion of a PSR in an SRR.
4) potential_inclusion_link.csv - A matrix showing systematic reviews in columns and primary studies in rows.  Cells with "p" denote where primary study reports were potentially eligible for systematic review reports, according to the publication date of the primary studies and the dates of last search in systematic reviews. This data was collected from Trinquart et al. (2016). 
5) systematic_review_inclusion_criteria.csv - Each row is the inclusion criteria of a systematic review report.
6) Supplementary Reference List.pdf - Each item is a bibliographic record of an SSR or a included PSR.
7) inclusion_net_edges_trinquart.csv - Each row represents an inclusion of a PSR in an SRR.
 
COLUMN HEADER EXPLANATIONS
1) report_list.csv: ID - Numeric ID of the report
short_name - Short name assigned to each report by Trinquart et al. (2016), usually first author's last name + publication year
type - Systematic review report/ primary study report
study_groupings - Groupings for related primary study reports from the same report, from Trinquart et al. (2016) (if applicable, otherwise blank)
title - Title of the report
year - Publication year of the report
attitude - Scientific opinion about the salt controversy from Trinquart et al. (2016)
doi - DOIs of the report (if applicable, otherwise blank)
retracted(Y/N) - Y if the report was retracted or withdrawn. Blank if the report was not retracted or withdrawn.
study_design - The study design of a report, which takes the following values: Case Control Study, Cohort Study, Systematic Review, and Randomized Controlled Trial. 
 
2) salt_cont_author.csv: 
ID - Numeric ID of the report
title - Title of the report
author_given_name - The given name of the author
author_surname - The surname of the author
author_id - Unique identifier of the author, either from Scopus Author ID or assigned by us.
organizational_author - If a report is published under the name of an organization, it is stored in this column. 
Manual - If TRUE, the author information was extracted manually. If FALSE, the author information was retrieved from the Scopus citation database. 
 
3) inclusion_net_edges.csv:
citing_ID - The numeric ID of an SSR
cited_ID - The numeric ID of a PSR
 
4) potential_inclusion_link.csv:
This data was translated from Trinquart's edge list in the data supplement of Trinquart et al. (2016). Each row indicates a systematic review report, and each column indicates a primary study. In the matrix, "p" indicates that a given primary study had been published as of the search date of a given systematic review report.
 
5)systematic_review_inclusion_criteria.csv:
ID - The numeric IDs of systematic review reports.
short_name - ID of the report from Trinquart et al. (2016).
attitude - Its scientific opinion about the salt controversy from Trinquart et al. (2016)s.
no_of_studies_included - Number of studies included in the systematic review report.
no_of_reports_included – Number of PSRs included in the systematic review report.
report_included_in_Trinquart_data – Number of PSRs that are also included in the Trinquart dataset' 68 PSRs.
study_design - Study designs to include, per inclusion criteria, as described in the SSR.
study_design_unified – Unified coding for the study_design, reduced from study_design column.
population - Populations to include, per inclusion criteria, as described in the SSR.
population_unified – Unified coding for population, reduced from population column.
exposure_intervention - Exposures/Interventions to include, per inclusion criteria, as described in the SSR.
exposure_intervention_unified – Unified coding for exposure/intervention, reduced from the "exposure_intervention" column. 
outcome - Study outcomes required for inclusion, per inclusion criteria, as described in the SSR. 
Language_restriction - Report languages to include, per inclusion criteria. We did not reduce "outcome" to codes like previous columns because outcomes are too heterogeneous to be reduced.
Follow_up_period - Follow-up period required for inclusion, per inclusion criteria, as described in the SSR. 
Follow_up_period_unified – Unified coding for follow-up period, reduced from te “follow_up_period” column. 
Notes – Notes about each entry.

DIFFERENCES BETWEEN THIS DATASET AND RELATED DATASET (Fu and Hsiao, 2020 https://doi.org/10.13012/B2IDB-9222782_V1 )
- The file Article_attr.csv was removed due to redundancy. The old file article_list.csv contains all information.
- The file article_list.csv was renamed report_list.csv
- A new file salt_cont_author.csv was added
- Corrected a couple of mistakes in report_list.csv, and change all column names to lower cases for consistency. In particular, we corrected the classification of two SRRs, Graudal 2014 (from “for” to “against”) and Poggio 2014 (from “against” to “for”), whose “statements” based on which “judgment” was made were mistakenly swapped in Web Table 2 of the supplement of Trinquart et al. 2016. 
- A new column, "study_design" was added to report_list.csv.
- Acronyms "Group, H. P. T. R" and "Group, T. of H. P. C. R." were corrected to "Hypertension Prevention Trial Research Group" in Supplementary Reference List.pdf.
- The edge list file (inclusion_net_edges.csv) was verified and corrected for a couple of mistakes.
- A new file inclusion_net_edges_trinquart.csv was added to record the adjacency matrix constructed by Trinquart et al. (2016), based on their Trinquart's edge list in their supplementary data file. Differences between inclusion_net_edges.csv and inclusion_net_edges_trinquart.csv are explained in the next section.

7) inclusion_net_edges_trinquart.csv:
citing_ID - The numeric ID of an SRR.
cited_ID - The numeric ID of a PSR.

DIFFERENCES BETWEEN INCLUSION_NET_EDGES.CSV AND INCLUSION_NET_EDGES_TRINQUART.CSV

Note: inclusion_net_edges_trinquart.csv will be referred as "Trinquart's edge list" from now on. It is translate from Web Figure 4 of Trinquart et al. (2016). Inclusion_net_edges.csv will be reffered to as "our edge list" from now on. 

SRR1: identical
SRR2: identical
SRR3: identical

SRR4: Trinquart's edge list has 15 edges, and our edge list has 13 edges. Trinuart's edge list has addtional edges 2-->34 and 2-->56. We did not find PSR34 and PSR56 as included PSRs in SRR4.

SRR5: identical
SRR6: identical

SRR7: Trinquart's edge list has 13 edges, and our edge list has 12 edges. Trinquart's edge list has additional edges 2 --> 34. We did not find PSR34 as a included PSR in SRR7.

SRR8: Trinquart's edge list has 23 edges, and our edge list has 21 edges. Trinquart's edge list has additional edges 2-->34 and 2-->43. We did not find PSR34 and PSR43 as included PSRs in SRR8.

SRR9: Trinquart's edge list has 23 edges, and our edge list has 21 edges. Trinquart's edge list has additional edges 2-->34 and 2-->43. We did not find PSR34 and PSR43 as included PSRs in SRR8.

SRR10: identical

SRR11: Trinquart's edge list has 26 edges, and our edge list has 27 edges. Our edge list has an additional edge 11 --> 75. We found PSR75 as an included PSR in SR11 (see Table F-4 of SRR11).

SRR12: identical

SRR13: Trinquart's edge list has 28 edges, and our edge list has 26 edges. The differences:
- our edge list has 13 --> 46, 13 --> 76 that are not in the Trinquart's edge list. 
- Trinquart's edge list has: 13 --> 34, 13 --> 42, 13 --> 55 that are not in the edge list.
Reason:
We found PSR46 and PSR76 as included PSRs in SRR13.
We did not find PSR34, PSR42, and PSR55 as included PSRs in SRR13. In particular, PSR55 met the inclusion criteria. However, since it is a report reporting a randomized controlled trial (RCT) study and two RCT studies were identified. The analysis of RCTs were abandoned, and PSR55 did not contribute to evidence synthesis and the final conclusion reached by SRR13.   

SRR14: Trinquart's edge list has 11 edges, and our edge list has 11 edges too. The difference:
Trinquart's edge list has 14 --> 33, and our edge list has 14 --> 52 instead. 
Reason: 
We did not find PSR33 as an included PSR in SRR14. It was identified by excluded (see Figure 2 of SRR14)
We found PSR52 as an included PSR in SRR14. 
