import os
import json
import string
import pickle

class MakeReviewDataset(object):
    def __init__(self, file_name :str, parent_dir="./dataset", allow_key=False):
        self.current_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), parent_dir)
        self.abs_path = os.path.join(self.current_path, file_name)
        self.alphabet_str = [s for s in string.ascii_lowercase]
        if allow_key == True:
          self.ALLOW_SYMBOL = ["!", "?", " ", "*", "☆", "★", "(", ")"]
          self.alphabet_str += self.ALLOW_SYMBOL

    def change_str_for_alphabet_num(self, text :str):
        tmp_list = list()
        for single_str in text:
            single_str = single_str.lower()
            if single_str in self.alphabet_str:
                index_num = self.alphabet_str.index(single_str)
                tmp_list.append(index_num)
        return tmp_list

    def save_pickle(self, list_data :list, file_name :str):
        with open(os.path.join(self.current_path, file_name), 'wb') as f:
            pickle.dump(list_data, f)
            return True

    def convert(self, save_file_name :str):
        print("start convert dataset")
        READ_COLUMN = ["reviewText", "overall"]
        convert_str_lst = list()
        overall_lst = list()
        with open(self.abs_path) as f:
            data = json.load(f)
            length = len(data["data"])
            for i, review in enumerate(data["data"]):
                print("---> now process: {} / {}".format(i+1, length))
                for COLUMN in READ_COLUMN:
                    if COLUMN == "reviewText":
                        convert_str = self.change_str_for_alphabet_num(review[COLUMN])
                        convert_str_lst.append(convert_str)
                    else:
                        overall_lst.append(review[COLUMN])
        key = self.save_pickle([convert_str_lst, overall_lst], save_file_name)
        if key == True:
            return print("success convert data and make new pickle file your local env")


if __name__ == "__main__":
    FILE_NAME = "reviews_Musical_Instruments_5.json"
    obj = MakeReviewDataset(FILE_NAME)
    obj.convert("review_music_data.pickle")