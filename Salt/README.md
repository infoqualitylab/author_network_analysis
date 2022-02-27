README

## Salt Controversy Co-Author Network Analysis

## Step-by-step guide

1. Used Python 3.9 to develop the script but should be good with Python Version >= 3.8.
2. Input file is in the data folder for reading into the dataframe (The path is already maintained and it should run when you try it on your system)
3. Run the Salt_controversy_script.py. This reads the salt controversy dataset, performs the name disambiguation, replaces the author initials wherever necessary and generates the graph objects. 
4. Further, we use NodeXL to visualize the graph. The script is written to output the nodes of the graph (author_names) and edges(author 1, author 2, number of times collaborated) in csv files(written to data folder) which can be used for visualization in NodeXL.
