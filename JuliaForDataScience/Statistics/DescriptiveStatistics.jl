using Statistics
using StatsBase

calories = [144, 151, 157, 170, 152, 145, 175, 149, 99, 113, 140, 102, 135, 149, 149, 68, 136, 144, 72, 97]
calories_sort = sort!(calories)
index = collect(1:length(calories))
calories_table = [index calories_sort]

vscodedisplay(calories_table)

describe(calories_table)

