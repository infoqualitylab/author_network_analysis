rm(list = ls(all.names = TRUE))
library(igraph)
# library(tibble)
library(dplyr)
library(RColorBrewer)

# add two new shapes
# #######################################################

# triangle vertex shape
mytriangle <- function(coords, v=NULL, params) {
  vertex.color <- params("vertex", "color")
  if (length(vertex.color) != 1 && !is.null(v)) {
    vertex.color <- vertex.color[v]
  }
  vertex.size <- 1/200 * params("vertex", "size")
  if (length(vertex.size) != 1 && !is.null(v)) {
    vertex.size <- vertex.size[v]
  }
  
  symbols(x=coords[,1], y=coords[,2], bg=vertex.color,
          stars=cbind(vertex.size, vertex.size, vertex.size),
          add=TRUE, inches=FALSE)
}

# clips as a circle
add_shape("triangle", clip=shapes("circle")$clip,
          plot=mytriangle)

# add star vertex shape

# generic star vertex shape, with a parameter for number of rays
mystar <- function(coords, v=NULL, params) {
  vertex.color <- params("vertex", "color")
  if (length(vertex.color) != 1 && !is.null(v)) {
    vertex.color <- vertex.color[v]
  }
  vertex.size  <- 1/200 * params("vertex", "size")
  if (length(vertex.size) != 1 && !is.null(v)) {
    vertex.size <- vertex.size[v]
  }
  norays <- params("vertex", "norays")
  if (length(norays) != 1 && !is.null(v)) {
    norays <- norays[v]
  }
  
  mapply(coords[,1], coords[,2], vertex.color, vertex.size, norays,
         FUN=function(x, y, bg, size, nor) {
           symbols(x=x, y=y, bg=bg,
                   stars=matrix(c(size,size/2), nrow=1, ncol=nor*2),
                   add=TRUE, inches=FALSE)
         })
}
# no clipping, edges will be below the vertices anyway
add_shape("star", clip=shape_noclip,
          plot=mystar, parameters=list(vertex.norays=5))

# ##################################################################

# load data
edge_file <- 'data/salt_controversy/inclusion_net_edges.csv'
edge_list <- read.csv(file=edge_file)

node_attr_file <- 'data/salt_controversy/article_list.csv'
node_list <- read.csv(node_attr_file)

# clean leading/trailing white space
node_list$attitude <- as.character(node_list$attitude)
node_list$attitude <- trimws(node_list$attitude)
node_list$attitude <- as.factor(node_list$attitude)

inclusion_net <- graph_from_data_frame(d = edge_list, vertices = node_list, directed = T)
deg = degree(inclusion_net, mode="in")

node_shape <- case_when(
  V(inclusion_net)$study_design == "Case Control" ~ "star",
  V(inclusion_net)$study_design == "RCT" ~ "circle",
  V(inclusion_net)$study_design == "Cohort" ~ "triangle",
  V(inclusion_net)$study_design == "Systematic Review" ~ "square"
)

node_pal <- RColorBrewer::brewer.pal(3, 'Spectral')
color_for <- node_pal[3]
color_against <- node_pal[1]
color_inconslusive <- node_pal[2]

node_color <- case_when(
  V(inclusion_net)$attitude == "for" ~ color_for,
  V(inclusion_net)$attitude == "against" ~ color_against,
  V(inclusion_net)$attitude == "inconclusive" ~ color_inconslusive,
)

# vertex_label <- c("SR1", "SR2", "SR3", "SR4","SR5",
#                                 "SR6", "SR7", "SR8", "SR9","SR10",
#                                 "SR11", "SR12", "SR13", "SR14", )

#########################
## Community Detection ##
#########################

# calculate enrichness of a type of study in a community
inclusion_net_2 <- graph_from_data_frame(d = edge_list, vertices = node_list, directed = FALSE)

# btw <- cluster_edge_betweenness(inclusion_net_2)
# evc <- cluster_leading_eigen(inclusion_net_2) 
# fgc <- cluster_fast_greedy(inclusion_net_2)
# inf <- infomap.community(inclusion_net_2)
# lpc <- label.propagation.community(inclusion_net_2)
# mlc <- multilevel.community(inclusion_net_2)
# sgc <- spinglass.community(inclusion_net_2)
wtc <- walktrap.community(inclusion_net_2)

###################
## Visualization ##
###################
plot_layout <-  igraph::layout_with_fr(inclusion_net)
# plot_layout <- igraph::layout.graphopt(inclusion_net)
# plot_layout <- igraph::layout.kamada.kawai(inclusion_net)
# plot_layout <- igraph::layout.lgl(inclusion_net)
# plot_layout <- igraph::layout.random(inclusion_net)
png(filename = "community_full.png", units = 'in', width = 16, height = 8, res = 1200)

par(mar=c(1,1,1,1))

plot(inclusion_net, vertex.size=14,
     vertex.label.font= 2,
     edge.arrow.width = 0.8, 
     edge.arrow.size = 0.8,
     vertex.color = node_color,
     vertex.shape = node_shape,
     layout = plot_layout,
     mark.groups = list(unlist(wtc[1]), unlist(wtc[2]), unlist(wtc[3])),
     mark.col = c('gray90', 'gray90', 'gray90'),
     mark.border= 'black'
)

# plot(inclusion_net, vertex.size=14,
#      vertex.label.font= 2,
#      edge.arrow.width = 0.05, 
#      edge.arrow.size = 0.05,
#      vertex.color = node_color,
#      vertex.shape = node_shape,
#      layout = plot_layout,
#      mark.groups = list(unlist(wtc[1]), unlist(wtc[2]), unlist(wtc[3])),
#      mark.col = c('gray90', 'gray90', 'gray90'),
#      mark.border= 'black'
# )

legend_clr = c(color_against, color_for, color_inconslusive, 'black', 'black', 'black', 'black')
legend_txt = c("Contradictory", "Supportive", "Inconclusive", "Systematic Review", "RCT", "Cohort", "Case Control")
legend(x=1.5, y = 0.5, legend=legend_txt, col = legend_clr, pt.lwd = 2.5, bg="transparent",
       pch=c(19,19,19,0,1,2,11), pt.cex=1.5, cex = 1.0, horiz = FALSE, box.lty=0)

dev.off()
