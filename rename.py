import sys
import os
import re

songs = os.listdir()
songs.remove('rename.py')
if 'a.sh' in songs:
    songs.remove('a.sh')
pattern = re.compile(r'''((?<=-)\w+)(\.\w+)''')
with open('a.sh', 'w') as f:
    for i in range(len(songs)):
        try:
            print(songs[i])
            mess = pattern.search(songs[i]).group(1)
            print(mess)
            ext = pattern.search(songs[i]).group(2)
            print(ext)
            new_name = '\"' + \
                songs[i][:songs[i].find(mess)-1] + ext + '\"' + '\n'
            mv = 'mv'
            old_name = '"' + songs[i] + '"'
            out = mv + ' ' + old_name + ' ' + new_name
            f.write(out)
        except:
            continue
