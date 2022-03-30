# -*- coding: utf-8 -*-
import sys,os
abspath = os.path.abspath(__file__)
dir_name = os.path.dirname(abspath)
os.chdir(dir_name)
sys.path.append("../")

chapter = int(input('Chapter number: '))

nums = [int(el) for el in input('Questions: ').split()]


folder_name = f'chapter_{chapter}'
os.makedirs(folder_name,exist_ok =True)


with open('modelo_latex.txt', 'r') as fr:
    modelo_latex = fr.read()


with open('modelo_matlab.m', 'r') as fr:
    os.chdir(rf'.\{folder_name}')
    lines = fr.read()
    for num in nums:
        filename = f"semmlow_{chapter}_{num}.m"
        with open(filename, 'w') as fw:
            fw.write(lines)
        with open(f'chapter_{chapter}.txt', 'a') as fw:
            fw.write(modelo_latex.replace('questiondash',f"{chapter}_{num}").replace('questionpoint',f"{chapter}.{num}"))
os.chdir(dir_name)
