from __future__ import print_function

def get_multiplication_tables(num):
    table = []
    for i in range(num):
        table.append([])
        cur_num = i + 1
        for j in range(num):
            table[i].append(cur_num + j*cur_num)
    return table

def _get_whitespace(num):
    if num < 10:
        return "  "
    elif num < 100:
        return " "
    else:
        return ""
        

if __name__ == "__main__":
    tables = get_multiplication_tables(12)
    for row in tables:
        for i in range(len(row)):
            print('{:4}'.format(row[i]), end="")
        print()

