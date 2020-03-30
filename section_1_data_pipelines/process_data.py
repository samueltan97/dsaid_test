import os
import pandas as pd
import datetime


def remove_prepend_zeros(price_string):
    index = 0
    # find out the index of the first non-zero value
    while index < len(price_string) and price_string[index] == 0:
        index += 1

    # settle edge case where the entire string is just zeros
    if index == len(price_string) - 1:
        return 0.0
    else:
        return float(price_string[index:])

path = os.getcwd()
today = datetime.datetime.today()
df = pd.read_csv(path + "\\raw_data\\dataset_" + today.strftime('%d%m%y') + ".csv")

# removes all rows with empty names
df = df[df.name != '']

# converts all columns in dataframes to python list to use the power of list comprehension
name = df['name'].to_list()
price = df['price'].to_list()

# create lists that contain dirst_name, last_name, price, and above_100
first_name = [x.split(' ')[0] for x in name]
last_name = [x.split(' ')[1] for x in name]
price = [remove_prepend_zeros(str(x)) for x in price]
above_100 = [x > 100 for x in price]

# remove old columns from dataframe
df = df.drop(labels=['price', 'name'], axis=1)

# add in new columns from the lists generated above
df['first_name'] = first_name
df['last_name'] = last_name
df['price'] = price
df['above_100'] = above_100

# convert final dataframe to csv with the date appended behind
df.to_csv(path + "\\processed_data\\processed_dataset_" + today.strftime('%d%m%y') + ".csv", index=False)