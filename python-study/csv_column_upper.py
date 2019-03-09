import csv
import sys
import os

MAKE_FILE_NAME = "update_csv"
if not os.path.isdir("./{}".format(MAKE_FILE_NAME)) == True:
    os.mkdir("{}".format(MAKE_FILE_NAME))

args = sys.argv
target_csv = args[1]

UPPER_COLUMN = ["reference", "store_keys", "ext_require"]
RELATION_COLUMN_NUM = []
if target_csv == "reservation.csv":
    UPPER_COLUMN.append("reply")

with open("./{}/{}".format(MAKE_FILE_NAME, target_csv), "w") as base_csv_file:
    writer = csv.writer(base_csv_file, lineterminator='\n')
    with open("./{}".format(target_csv), "r") as csv_file:
        f = csv.reader(csv_file)
        for num, row in  enumerate(f):
            if num == 0:
                for column in UPPER_COLUMN:
                    column_num = row.index(column)
                    RELATION_COLUMN_NUM.append(column_num)
            else:
                for relation_num in RELATION_COLUMN_NUM:
                    row[relation_num] = row[relation_num].upper()
                    if "\\N" in row[relation_num].upper():
                        row[relation_num] = row[relation_num].replace("\\N", "\\n")
            writer.writerow(row)
