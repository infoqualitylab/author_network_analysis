#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt
from fuzzywuzzy import fuzz
from fuzzywuzzy import process
from collections import Counter
import itertools


# In[116]:


# co_auth_df = pd.read_excel("salt_cont_auth.xlsx")
co_auth_df = pd.read_excel("salt_cont_auth_updated_id.xlsx")


# Combining the first and last name of the authors

# In[117]:


co_auth_df['author_name'] = co_auth_df['author_given_name'] + " " + co_auth_df['author_surname']


# #### Checking if there are any null values for the author names

# In[118]:


co_auth_df[co_auth_df['author_name'].isna() & co_auth_df['author_given_name'].isna()].index.tolist()
co_auth_df.drop([534], inplace=True)


# In[119]:


author_name_list = co_auth_df['author_name'].to_list()
author_name_list[:10]


# ###### Use of fuzzywuzzy to set a threshold and find the acronyms, shortforms for the author names

# In[91]:


# score_sort1 = [(x,) + i
#              for x in author_name_list
#              for i in process.extract(x, author_name_list, scorer=fuzz.token_set_ratio)
#               ]
# score_sort1


# In[92]:


# df = pd.DataFrame(score_sort1, columns= ["Original name", "Matching Name", "Ratio"])
# df.to_excel("sat_author_name_excel.xlsx", index=False)


# In[120]:


# Change the datatype of ID to int for forming a list of co_authors for the id
co_auth_df.ID = co_auth_df.ID.astype("int64")
co_auth_list_df = co_auth_df.groupby(['ID','original_title'])['author_name'].apply(list).reset_index()
co_auth_list_df


# In[101]:


# co_auth_df[co_auth_df.author_id.isna()]
co_auth_df[co_auth_df.author_surname == "Aburto"]


# In[121]:


co_auth_df_copy = co_auth_df[['author_name','author_id']]
co_auth_df_copy = co_auth_df_copy[~co_auth_df_copy.author_id.isna()]

dup_auth = pd.merge(co_auth_df_copy, co_auth_df_copy, how = "left" , left_on="author_id", right_on="author_id")
dup_auth
dup_auth["dup_name"] = dup_auth[["author_name_x","author_name_y"]].values.tolist()

author_acry_list = [tuple(sorted(list(row))) for row in dup_auth.dup_name if row[0] != row[1]]

author_acry_dict = dict()

for i in set(author_acry_list):
    author_acry_dict[i[0]] = i[1]
    
# print(author_acry_dict)


# In[104]:


#old version of fuzzy word matching

# dup_df = pd.read_csv("duplicate_name.csv")

# dup_dict = pd.Series(dup_df.Dup.values, index = dup_df.Og).to_dict()
# dup_dict


# In[122]:


def replace_auth_name(author_list, author_acry_dict):
    for i in range(len(author_list)):
        for k, v in author_acry_dict.items():
            if author_list[i] in v:
                author_list[i] = author_list[i].replace(author_list[i], k)
                
    return author_list


# In[123]:


co_auth_list_df.author_name = co_auth_list_df.author_name.apply(lambda x: replace_auth_name(x, dup_dict))
# co_auth_list_df.head()


# In[124]:


un_auth_names = list(set([a.strip() for b in co_auth_list_df.author_name.tolist() for a in b]))
un_auth_names[:10]


# In[125]:


edge_list = co_auth_list_df['author_name'].values.tolist()
len(edge_list)


# Total number of papers are 81 and to find the combinations for the code to run in an efficient way do the below

# In[126]:


new = []
for i in edge_list:
    if len(i) >=2:
        for subset in itertools.combinations(i,2):
            if len(subset) == 2:
                new.append(subset)


# In[21]:


sorted_list = []
# individual_authors = []
for i in new:
    sorted_list.append(tuple(sorted(list(i))))
#     for j in i:
#         individual_authors.append(j)


# In[112]:


count_auth = Counter(sorted_list)
# updated_auth_nodes = []

# indi_auth_count = Counter(individual_authors)
# for k, v in sorted(indi_auth_count.items(), key = lambda x : x[1], reverse=True):
#     if v >= 20:
#         updated_auth_nodes.append(k)

# len(updated_auth_nodes)


# In[113]:


sorted(count_auth.items(), key = lambda x : x[1], reverse=True)


# In[114]:


node_names = un_auth_names
G = nx.Graph()
G.add_nodes_from(node_names)

for k, v in count_auth.items():
    if k[0] in G.nodes() or k[1] in G.nodes():
        G.add_edge(k[0],k[1], weight = v,  length = v)
        

d = nx.degree_centrality(G)

sorted(d.items(), key = lambda x : x[1], reverse = True)


# In[115]:


plt.figure(figsize=(300, 300))

# pos = nx.spring_layout(G)
# pos = nx.nx_agraph.graphviz_layout(G)
edges = G.edges()
weights = [G[u][v]['weight'] for u,v in edges]
nx.draw(G, font_size = 30, nodelist=dict(d).keys(), node_size=[v * 10000 for v in dict(d).values()], with_labels = True, 
        width = weights)
plt.savefig('auth.jpg')


# In[18]:


from netwulf import visualize
styled_network, config = visualize(G)
plt.savefig('auth1.jpg')


# In[128]:


get_ipython().system('jupyter nbconvert --to script Salt Controversy.ipynb')


# In[ ]:




