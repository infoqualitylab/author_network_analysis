#!/usr/bin/env python
# coding: utf-8



import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt
from collections import Counter
import itertools

def replace_auth_name(author_list, author_acry_dict):
    for i in range(len(author_list)):
        for k, v in author_acry_dict.items():
            if author_list[i] in v:
                author_list[i] = author_list[i].replace(author_list[i], k)
                
    return author_list

if __name__ ==  "__main__":
    co_auth_df = pd.read_excel("salt_cont_auth_updated_id.xlsx")
    co_auth_df['author_name'] = co_auth_df['author_given_name'] + " " + co_auth_df['author_surname']

    # removing the null value row
    co_auth_df[co_auth_df['author_name'].isna() & co_auth_df['author_given_name'].isna()].index.tolist()
    co_auth_df.drop([534], inplace=True)



    co_auth_df_copy = co_auth_df[['author_name','author_id']]
    dup_auth = pd.merge(co_auth_df_copy, co_auth_df_copy, how = "left" , left_on="author_id", right_on="author_id")
    # dup_auth
    dup_auth["dup_name"] = dup_auth[["author_name_x","author_name_y"]].values.tolist()
    dup_auth[dup_auth["author_name_x"] == "P DiPasquale"]

    author_acry_list = [tuple(sorted(list(row))) for row in dup_auth.dup_name if row[0] != row[1]]
    # print(author_acry_list)
    author_acry_dict = dict()

    for i in set(author_acry_list):
        author_acry_dict[i[0]] = i[1]
    # print(author_acry_dict)

    # Change the datatype of ID to int for forming a list of co_authors for the id
    co_auth_df.ID = co_auth_df.ID.astype("int64")

    # Collapse the author names in a list for each paper
    co_auth_list_df = co_auth_df.groupby(['ID','original_title'])['author_name'].apply(list).reset_index()

    #Replace the author name disambiguation result to replace the author initials
    co_auth_list_df.author_name = co_auth_list_df.author_name.apply(lambda x: replace_auth_name(x,  author_acry_dict))
    # print(co_auth_list_df.head())

    #Unique author names
    un_auth_names = list(set([a.strip() for b in co_auth_list_df.author_name.tolist() for a in b]))
    # un_auth_names[:10]

    edge_list = co_auth_list_df['author_name'].values.tolist()
    len(edge_list)

    #find the combination of authors collaborating on the same paper
    new = []
    for i in edge_list:
        if len(i) >=2:
            for subset in itertools.combinations(i,2):
                if len(subset) == 2:
                    new.append(subset)

    sorted_list = []
    for i in new:
        sorted_list.append(tuple(sorted(list(i))))

    #to count the number of times the two authors in a tuple collaborated with each other
    count_auth = Counter(sorted_list)

    #Initializing the graph, nodes and edges

    G = nx.Graph()
    node_names = un_auth_names
    G.add_nodes_from(node_names)

    # G.nodes()

    for k, v in count_auth.items():
        if k[0] in G.nodes() or k[1] in G.nodes():
            G.add_edge(k[0],k[1], weight = v,  length = v)


    edge_weight = nx.get_edge_attributes(G, "weight")
    edge_list = []
    for i in G.edges():
        edge_list.append([i[0],i[1], edge_weight[i]])


    edge_df = pd.DataFrame(edge_list)
    edge_df.columns = ["Auth_1","Auth_2", "Weight"]
    edge_df.to_csv("Edge_data.csv")

    node_df = pd.DataFrame(G.nodes())
    node_df.columns = ["Author_Name"]
    node_df.to_csv("node_data.csv")