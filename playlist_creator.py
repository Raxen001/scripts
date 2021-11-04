import os, sys
path_playlist = '/home/raxen/Music/Playlist/'
path_songs = '/home/raxen/Music/Playlist/'
path_config = '/home/raxen/.config/cmus/playlists/'

os.chdir(path_playlist)
playlists = os.listdir()
for i  in playlists:
    songs = os.listdir(f'{path_songs}{i}')
    with open(f'{path_config}{i}', 'w') as f:
        for j in songs:
            f.write(f"{path_songs}{i}/{j}\n")

