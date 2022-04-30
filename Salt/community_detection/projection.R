rm(list = ls(all.names = TRUE))
library(igraph)
library(tibble)
library(dplyr)
library(ggplot2)
library(readr)
library(RColorBrewer)

#########################
### Plotting Function ###
#########################

## function parameters
## node_color: a vector of all node colors
## bn.sr: projected network
## plot_layout: layout
## legend_clr: color sequence for legend
## legend_txt: text sequence for legend

figure_plotting <- function(node_color, 
                            bn.sr, 
                            plot_layout,
                            legend_clr, 
                            legend_txt, 
                            title_str
                            ){
  
  par(mar=c(1.0, 1.0, 1.0, 1.0))
  
  plot(bn.sr,vertex.color= node_color,
       vertex.shape="circle",
       vertex.size = 14,
       edge.width=sqrt(E(bn.sr)$weight),
       vertex.label.cex=1.0,
       vertex.label.color="black",
       vertex.size=degree(bn.sr)*2,
       layout = plot_layout, main = title_str)
  
  legend(x = -2, y = -0.5, 
         legend=legend_txt, 
         col = legend_clr, 
         pt.lwd = 2.5, 
         bg="transparent", 
         pch=c(19,19,19), 
         pt.cex=2.0, 
         cex = 1.5, 
         horiz = FALSE, 
         box.lty=0, 
         y.intersp = 0.8)
  
}

inclusion_criteria <- read_csv("data/systematic_review_inclusion_criteria.csv")

# create graph from edge list
f_edge <- 'data/inclusion_net_edges.csv'
el.df <- read.csv(file=f_edge)

bn <- graph.data.frame(el.df,directed=FALSE)
# reviews are true type and primary studies are false type
V(bn)$type <- V(bn)$name %in% el.df$citing_ID

# load full attributes list, including year, attitude and type
# data format cleaning
nodes <- data.frame("ID" = unique(unlist(el.df)))

full_node <- 'data/article_list.csv'
full_node_attr <- read.table(file=full_node, sep = ',', header = TRUE)
colnames(full_node_attr)[1] <- 'ID'

# join nodes (only inclusion network) and full node attributes
nodes <- left_join(nodes,full_node_attr, by = 'ID')

# clean leading/trailing white space
nodes$attitude <- as.character(nodes$attitude)
nodes$attitude <- trimws(nodes$attitude)

V(bn)$attitude <- nodes$attitude[V(bn)$name == nodes$ID]
V(bn)$study_design <- as.character(nodes$study_design[V(bn)$name == nodes$ID])

# make projections
bn.pr <- bipartite.projection(bn)
bn.ps <- bn.pr$proj1
bn.sr <- bn.pr$proj2

V(bn.sr)$study_design <- inclusion_criteria$study_design_unified[V(bn.sr)$name == inclusion_criteria$ID]
V(bn.sr)$population <- inclusion_criteria$population_unified[V(bn.sr)$name == inclusion_criteria$ID]
V(bn.sr)$follow_up_period <- inclusion_criteria$follow_up_period_unified[V(bn.sr)$name == inclusion_criteria$ID]
V(bn.sr)$exposure <- inclusion_criteria$exposure_intervention_unified[V(bn.sr)$name == inclusion_criteria$ID]

legend_text_attitude <- c("for", "against", "inconclusive")
my_pal_attitude <- c('#10D1FC','#FAA4DF','#F1E30E')

# color by attitude
node_color_attitude <- case_when(
  V(bn.sr)$attitude == legend_text_attitude[1] ~ my_pal_attitude[1],
  V(bn.sr)$attitude == legend_text_attitude[2] ~ my_pal_attitude[2],
  V(bn.sr)$attitude == legend_text_attitude[3] ~ my_pal_attitude[3]
)


# color by study design
my_pal_study_design <- brewer.pal(n = 5, name = "Set2")
legend_text_study_design <- c('RCT', 'Cohort', 'RCT and Cohort', 'Cohort and Case-Control', 'ALL')

node_color_study_design <- case_when(
  V(bn.sr)$study_design == legend_text_study_design[1] ~ my_pal_study_design[1],
  V(bn.sr)$study_design == legend_text_study_design[2] ~ my_pal_study_design[2],
  V(bn.sr)$study_design == legend_text_study_design[3] ~ my_pal_study_design[3],
  V(bn.sr)$study_design == legend_text_study_design[4] ~ my_pal_study_design[4],
  V(bn.sr)$study_design == legend_text_study_design[5] ~ my_pal_study_design[5]
)

# color by population
my_pal_population <- brewer.pal(n = 7, name = "Set2")
legend_text_population <- c('general population','adults',
                            'non-acutely ill adults', 'healthy adults',
                            'healthy general population', 'non-acutely ill adults and children',
                            'adults with HF')

node_color_population <- case_when(
  V(bn.sr)$population == legend_text_population[1] ~ my_pal_population[1],
  V(bn.sr)$population == legend_text_population[2] ~ my_pal_population[2],
  V(bn.sr)$population == legend_text_population[3] ~ my_pal_population[3],
  V(bn.sr)$population == legend_text_population[4] ~ my_pal_population[4],
  V(bn.sr)$population == legend_text_population[5] ~ my_pal_population[5],
  V(bn.sr)$population == legend_text_population[6] ~ my_pal_population[6],
  V(bn.sr)$population == legend_text_population[7] ~ my_pal_population[7]
)


my_pal_followup <- brewer.pal(n = 7, name = "Set2")
legend_text_followup <- c('at least 1 month',
                          'at least 6 months',
                          'at least 12 months',
                          'at least 26 months',
                          'at least 36 months',
                          'have follow-up',
                          'no restriction')

node_color_followup <- case_when(
  V(bn.sr)$follow_up_period == legend_text_followup[1] ~ my_pal_followup[1],
  V(bn.sr)$follow_up_period == legend_text_followup[2] ~ my_pal_followup[2],
  V(bn.sr)$follow_up_period == legend_text_followup[3] ~ my_pal_followup[3],
  V(bn.sr)$follow_up_period == legend_text_followup[4] ~ my_pal_followup[4],
  V(bn.sr)$follow_up_period == legend_text_followup[5] ~ my_pal_followup[5],
  V(bn.sr)$follow_up_period == legend_text_followup[6] ~ my_pal_followup[6],
  V(bn.sr)$follow_up_period == legend_text_followup[7] ~ my_pal_followup[7]
)

my_pal_exposure <- brewer.pal(n = 5, name = "Set2")
legend_text_exposure <- c('reduced sodium intake',
                          'sodium intake',
                          'reduced salt intake',
                          'salt intake',
                          'no')

node_color_exposure <- case_when(
  
  V(bn.sr)$exposure == legend_text_exposure[1] ~ my_pal_exposure[1],
  V(bn.sr)$exposure == legend_text_exposure[2] ~ my_pal_exposure[2],
  V(bn.sr)$exposure == legend_text_exposure[3] ~ my_pal_exposure[3],
  V(bn.sr)$exposure == legend_text_exposure[4] ~ my_pal_exposure[4],
  V(bn.sr)$exposure == legend_text_exposure[5] ~ my_pal_exposure[5]
  
)

png(filename = 'network_projection.png',
    units = 'in',
    width = 18,
    height = 10,
    res = 1200)

plot_layout <- igraph::layout_with_graphopt(bn.sr)

par(mfrow = c(2,3))

figure_plotting(node_color = node_color_attitude,
                bn.sr = bn.sr,
                plot_layout = plot_layout,
                legend_clr = my_pal_attitude,
                legend_txt = legend_text_attitude,
                title_str = 'Attitude'
)

figure_plotting(node_color = node_color_study_design,
                bn.sr = bn.sr,
                plot_layout = plot_layout,
                legend_clr = my_pal_study_design,
                legend_txt = legend_text_study_design,
                title_str = 'Study Design')

figure_plotting(node_color = node_color_population,
                bn.sr = bn.sr,
                plot_layout = plot_layout,
                legend_clr = my_pal_population,
                legend_txt = legend_text_population,
                title_str = 'Population')

figure_plotting(node_color = node_color_followup,
                bn.sr = bn.sr,
                plot_layout = plot_layout,
                legend_clr = my_pal_followup,
                legend_txt = legend_text_followup,
                title_str = 'Follow-up Period')

figure_plotting(node_color = node_color_exposure,
                bn.sr = bn.sr,
                plot_layout = plot_layout,
                legend_clr = my_pal_exposure,
                legend_txt = legend_text_exposure,
                title_str = 'Exposure')

dev.off()