#coding utf-8
import re

unnecessary_tags = ["title"]


def changer(image):
    with open(image, "r", encoding="utf-8") as f:
        for row in f:
            i = 0
            compile_row = re.compile(r"<{0}>.*</{0}>".format(unnecessary_tags[i]))
            result = re.sub(compile_row, "", row)

            if unnecessary_tags[i + 1]:
                i += 1
            else:
                new_name = "change_" + image
                with open(new_name, "a")


changer("アセット 3.svg")
