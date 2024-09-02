#!/bin/python3

import sys

def read_frequency_file(filename):
    freq = {}
    with open(filename, 'r') as file:
        for line in file:
            key, value = line.strip().replace('[', '').replace(']', '').split(' = ')
            freq[key] = int(value)
    return freq

def process_names_file(filename, freq):
    result = {}
    with open(filename, 'r') as file:
        for line in file:
            key = line.strip()
            if key in freq:
                f = freq[key]
                if f not in result:
                    result[f] = []
                result[f].append(key)
    return result

def print_sorted_result(result):
    for f in sorted(result.keys()):
        for key in result[f]:
            print(f"[freq={f}] {key}")

def main(args):
    freq_file = args[0]
    name_file = args[1]

    freq = read_frequency_file(freq_file)
    result = process_names_file(name_file, freq)
    print_sorted_result(result)

if __name__ == '__main__':
    main(sys.argv[1:])
