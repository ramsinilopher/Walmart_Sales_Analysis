#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from sqlalchemy import create_engine
get_ipython().system('pip install pymysql')



# In[2]:


df = pd.read_csv(r"C:\Users\ramsi\Downloads\Walmart.csv")


# In[3]:


df.head()


# In[4]:


df.shape


# In[5]:


df.describe()


# In[6]:


df.info()


# In[7]:


df.duplicated().sum()


# In[8]:


df.drop_duplicates(inplace=True)


# In[9]:


df.isnull().sum()


# In[10]:


#dropping all rows with null values
df.dropna(inplace=True)


# In[11]:


df.isnull().sum()


# In[12]:


df.shape


# In[13]:


#change datatype
df['unit_price'] = df['unit_price'].str.replace(r'\$', '', regex=True).astype(float)


# In[14]:


df.head()


# In[15]:


# 2. Convert date and time to datetime
df["date"] = pd.to_datetime(df["date"], format="%d/%m/%y")
df["time"] = pd.to_datetime(df["time"], format="%H:%M:%S").dt.time


# In[16]:


df.info()


# In[17]:


df['total_price'] = df['unit_price'] * df['quantity']
df.sample(5)


# In[18]:


# Saving Cleaned Data
df.to_csv("Walmart_Cleaned_Data.csv",index=False)


# In[19]:


df = pd.read_csv("Walmart_Cleaned_Data.csv")


# In[20]:


username = 'root'
password = 'Root'
host = 'localhost'
database = 'walmart_db'

engine = create_engine(f"mysql+pymysql://{username}:{password}@{host}/{database}")


# In[21]:


df.to_sql(name="walmart_data", con=engine, if_exists='replace', index=False)


# In[22]:


df = pd.read_sql("SELECT * FROM walmart_data", con=engine)
df


# In[ ]:




