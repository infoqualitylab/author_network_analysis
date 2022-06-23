Title: The Salt Controversy Systematic Review Reports and Primary Study Reports Network Dataset
Authors: Yuanxi Fu, Tzu-Kun Hsiao, Manasi Ballal Joshi
License: CC-BY
Keywords: systematic reviews; evidence synthesis; network analysis; public health; salt controversy;

Related Article 
Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184
Related Article 
Hsiao, T. K., Fu, Y., & Schneider, J. Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014 [Short report]. 83rd Annual Meeting of the Association for Information Science and Technology. In Proceedings of the Association for Information Science and Technology Volume 57, Issue 1:e315 http://doi.org/https://doi.org/10.1002/pra2.315 Preprint: http://jodischneider.com/pubs/asist2020.pdf
Related Dataset
Fu, Y., Hsiao, T.K. (2020): Dataset for "Visualizing evidence-based disagreement over time: the landscape of a public health controversy 2002-2014". University of Illinois at Urbana-Champaign. https://doi.org/10.13012/B2IDB-9222782_V1
Dataset Description
The salt controversy is the public health debate about whether a population-level salt reduction is beneficial. This dataset covers 14 systematic review reports (SRRs) and 68 primary study reports (PSRs) addressing the effect of sodium intake on cerebrocardiovascular disease or mortality. The reports and their opinion classification (for, against, and inconclusive) were from Trinquart et al. (2016) (Trinquart, L., Johns, D. M., & Galea, S. (2016). Why do we think we know what we know? A metaknowledge analysis of the salt controversy. International Journal of Epidemiology, 45(1), 251–260. https://doi.org/10.1093/ije/dyv184), which collected 68 PSRs, 14 SRRs, 11 clinical guideline reports, and 176 comments, letters, or narrative reviews as a snapshot of the status of the salt controversy as of September 2014. 

This dataset can be used to construct the inclusion network and the co-author network of the 14 SRRs and 68 PSRs. A PSR is "included" in an SRR if it is considered in the SRR's evidence synthesis. An included PSR is cited in the SSR, but not all references of an SSR are included in the evidence synthesis or PSRs. Based on which PSRs are included in which SRRs, we can construct the inclusion network. The inclusion network is a bipartite network with two types of nodes: one type represents SSRs, and the other represents PSRs. In an inclusion network, if an SRR includes a PSR, there is a directed edge from the SRR to the PSR. The attribute file (report_list.csv) includes attributes of the 82 reports, and the edge list file (inclusion_net_edges.csv) contains the edge list of the inclusion network. Notably, 11 PSRs have never been included in any SRR in the dataset. They are unused PSRs. If visualized with the inclusion network, they will appear as isolated nodes. 

We used a house-made workflow (Fu, Y. (2022). Scopus author info tool (1.0.1) [Python]. https://github.com/infoqualitylab/Scopus_author_info_collection) that uses the Scopus API and manual work to extract and disambiguate authorship information for the 82 reports. The author information file (salt_cont_author.csv) is the product of this workflow and can be used to compute the co-author network of the 82 reports. 

We also included several other files in this dataset. We collected inclusion criteria (the criteria that make a PSR eligible to be included in an SRR) and recorded them in the file systematic_review_inclusion_criteria.csv. We included a file (potential_inclusion_link.csv) recording whether a given PSR had been published as of the search date of a given SRR, which makes the PSR potentially eligible for inclusion in the SRR. We also included the bibliography of the 82 reports (supplementary_reference_list.pdf). Lastly, we discovered minor discrepancies between the inclusion relationships identified by Trinquart et al. (2016) and us. Therefore, we decided to prepare an additional edge list (inclusion_net_edges_trinquart.csv) to preserve the inclusion relationships identified by Trinquart et al. (2016). 

FILES AND FILE FORMATS
1) report_list.csv - Unicode CSV
2) salt_cont_author.csv - Unicode CSV
3) inclusion_net_edges.csv - Unicode CSV
4) potential_inclusion_link.csv - Unicode CSV
5) systematic_review_inclusion_criteria.csv - Unicode CSV
6) supplementary_reference_list.pdf - PDF
7) inclusion_net_edges_trinquart.csv - Unicode CSV

ROW EXPLANATIONS
1) report_list.csv - Each row describes an SSR or a PSR.
2) salt_cont_author.csv - Each row is an occurrence of one author authoring a report.
3) inclusion_net_edges.csv - Each row represents an inclusion of a PSR in an SRR identified by us from the full text of the SSRs. 
4) potential_inclusion_link.csv - A matrix whose column indices are SSRs and row indices are PSRs. Cells with "p" denote where PSRs were potentially eligible for inclusion in SRRs, according to the publication date of the PSRs and the dates of the last search of the SRRs. This data was collected from Web Figure 4 of the data supplement of Trinquart et al. (2016). 
5) systematic_review_inclusion_criteria.csv - Each row records the inclusion criteria of an SRR.
6) supplementary_reference_list.pdf - Each item is a bibliographic record of an SSR or a PSR.
7) inclusion_net_edges_trinquart.csv - Each row represents an inclusion of a PSR in an SRR according to Web Figure 4 of Trinquart et al. (2016).

COLUMN HEADER EXPLANATIONS
1) report_list.csv: ID - Numeric ID of the report
short_name - Short name assigned to each report by Trinquart et al. (2016), usually first author's last name + publication year
type - Systematic review report/ primary study report
study_groupings - Groupings for related PSRs from the same study, from Trinquart et al. (2016) (if applicable, otherwise blank)
title - Title of the report
year - Publication year of the report
attitude - Scientific opinion about the salt controversy from Trinquart et al. (2016) and take the value of for, against, or inconclusive. 
doi - the DOI of the report (if applicable, otherwise blank)
retracted(Y/N) - Y if the report was retracted or withdrawn, N if the report was not retracted or withdrawn.
study_design - The study design of a report, which takes the following values: Case Control Study, Cohort Study, Systematic Review, and Randomized Controlled Trial. 

2) salt_cont_author.csv: 
ID - Numeric ID of the report
title - Title of the report
author_given_name - The given name of the author
author_surname - The surname of the author
author_id - Unique identifier of the author, either from Scopus Author ID or assigned by us.
organizational_author - If a report is published under the name of an organization, it is stored in this column. Otherwise, the cell is filled with "NA."
Manual - If TRUE, the author information was extracted manually. If FALSE, the author information was retrieved from the Scopus citation database. 

3) inclusion_net_edges.csv:
citing_ID - The numeric ID of an SSR
cited_ID - The numeric ID of a PSR

4) potential_inclusion_link.csv:
This data was translated from Web Figure 4 in the data supplement of Trinquart et al. (2016). A matrix whose column indices are SSRs and row indices are PSRs. Cells with "p" denote where PSRs were potentially eligible for inclusion in SRRs, according to the publication date of the PSRs and the dates of the last search of the SRRs. This data was collected from Web Figure 4 of the data supplement of Trinquart et al. (2016). 

5)systematic_review_inclusion_criteria.csv:
ID - The numeric ID of the SSR.
short_name - ID of the SSR from Trinquart et al. (2016).
attitude - An SSR's scientific opinion about the salt controversy from Trinquart et al. (2016), which takes the value of for, against, or inconclusive.
no_of_studies_included - Number of studies included in the SSR.
no_of_reports_included – Number of PSRs included in the SSR.
report_included_in_Trinquart_data – Number of PSRs that appear in the Trinquart dataset' 68 PSRs. Some SSRs include PSRs that are not covered by Trinquart et al. (2016)'s 68 PSRs. Such SSRs reivew the effect of sodium intake on health outcomes other than cerebrocardiovascular disease or mortality. 
study_design - Study designs to include, per inclusion criteria, as described in the SSR.
study_design_unified – Unified coding for the study_design, reduced from study_design column.
population - Populations to include, per inclusion criteria, as described in the SSR.
population_unified – Unified coding for population, reduced from population column.
exposure_intervention - Exposures/Interventions to include, per inclusion criteria, as described in the SSR.
exposure_intervention_unified – Unified coding for exposure/intervention, reduced from the exposure_intervention column. 
outcome - Study outcomes required for inclusion, per inclusion criteria, as described in the SSR. We did not reduce "outcome" to codes like previous columns because outcomes are too heterogeneous to be reduced.
Language_restriction - Report languages to include, per inclusion criteria.
Follow_up_period - Follow-up period required for inclusion, per inclusion criteria, as described in the SSR. 
Follow_up_period_unified – Unified coding for follow-up period, reduced from te "follow_up_period" column. 
Notes – Additional notes about each entry.

6) inclusion_net_edges_trinquart.csv:
citing_ID - The numeric ID of an SRR.
cited_ID - The numeric ID of a PSR.

DIFFERENCES BETWEEN THIS DATASET AND RELATED DATASET (Fu and Hsiao, 2020 https://doi.org/10.13012/B2IDB-9222782_V1 )
- We removed file Article_attr.csv due to redundancy. The old file Article_list.csv contains all information.
- We renamed file Article_list.csv to report_list.csv
- We renamed file "Supplementary Reference List.pdf" to "supplementary_reference_list.pdf."
- We added a new file salt_cont_author.csv.
- We corrected a couple of mistakes in report_list.csv, and changed all column names to lower cases for consistency. In particular, we corrected the classification of two SRRs, Graudal 2014 (from "for" to "against") and Poggio 2014 (from "against" to "for"), which were mistakenly swapped in Web Table 2 of the supplement of Trinquart et al. (2016). 
- We added a new column, "study_design" to report_list.csv.
- We corrected acronyms "Group, H. P. T. R" and "Group, T. of H. P. C. R." to "Hypertension Prevention Trial Research Group" in supplementary_reference_list.pdf.
- We verified the original edge list file (inclusion_net_edges.csv) and corrected a couple of mistakes.
- We added a new file inclusion_net_edges_trinquart.csv to record the inclusion relationships identified by Trinquart et al. (2016), based on their supplementary data file's Web Figure 4. We will explain the differences between inclusion_net_edges.csv and inclusion_net_edges_trinquart.csv in the next section.

DIFFERENCES BETWEEN INCLUSION_NET_EDGES.CSV AND INCLUSION_NET_EDGES_TRINQUART.CSV

Note: inclusion_net_edges_trinquart.csv will be referred to as "Trinquart's edge list" from now on. It is based on Web Figure 4 of Trinquart et al. (2016)'s supplementary data file. Inclusion_net_edges.csv will be referred to as "our edge list" from now on. 

SRR1: identical.
SRR2: identical.
SRR3: identical.

SRR4: Trinquart's edge list has 15 edges, and our edge list has 13 edges. Trinuart's edge list has additional edges 2-->34 and 2-->56. We did not find PSR34 and PSR56 as included PSRs in SRR4.

SRR5: identical.
SRR6: identical.

SRR7: Trinquart's edge list has 13 edges, and our edge list has 12 edges. Trinquart's edge list has additional edges 2 --> 34. We did not find PSR34 as a included PSR in SRR7.

SRR8: Trinquart's edge list has 23 edges, and our edge list has 21 edges. Trinquart's edge list has additional edges 2-->34 and 2-->43. We did not find PSR34 and PSR43 as included PSRs in SRR8.

SRR9: Trinquart's edge list has 23 edges, and our edge list has 21 edges. Trinquart's edge list has additional edges 2-->34 and 2-->43. We did not find PSR34 and PSR43 as included PSRs in SRR8.

SRR10: identical.

SRR11: Trinquart's edge list has 26 edges, and our edge list has 27 edges. Our edge list has an additional edge 11 --> 75. We found PSR75 as an included PSR in SR11 (see Table F-4 of SRR11).

SRR12: identical.

SRR13: Trinquart's edge list has 28 edges, and our edge list has 26 edges. The differences:
- our edge list has 13 --> 46, 13 --> 76 that are not in the Trinquart's edge list.
- Trinquart's edge list has: 13 --> 34, 13 --> 42, 13 --> 43, 13 --> 55 that are not in our edge list.
Reason:
We found PSR46 and PSR76 as included PSRs in SRR13.
We did not find PSR34, PSR42, PSR43 and PSR55 as included PSRs in SRR13. In particular, PSR43 and PSR55 met the inclusion criteria. However, they report randomized controlled trial (RCT) studies, and only two RCT studies were identified. Therefore, the analysis of RCTs was abandoned, and PSR43 and PSR55 did not contribute to the evidence synthesis of SRR13. 

SRR14: identical.
