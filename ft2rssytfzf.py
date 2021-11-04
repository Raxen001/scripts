import re
from os.path import expanduser

home = expanduser("~")
database = home + "/.config/FreeTube/profiles.db"
path_to_ytfzf = home + "/.config/ytfzf/subscriptions"


def parse():
    required = {}
    with open(database, 'r') as f:
        for i in f:
            channel_id = re.compile('"id":"(.*?)"').findall(i)
            channel_name = re.compile('"name":(".*?")').findall(i)
            group_name = channel_name.pop(0)

            for i in range(len(channel_id)):
                try:
                    if group_name not in required[channel_name[i]]['group']:
                        required[channel_name[i]]['group'].append(group_name)
                except KeyError:
                    a = {
                        'channel_id': channel_id[i],
                        'name': channel_name[i],
                        'group': [group_name]
                    }
                    required[channel_name[i]] = a
    return required


# example:
# https://www.youtube.com/feeds/videos.xml?channel_id=UCsnGwSIHyoYN0kiINAGUKxg "~Wolfgang's Channel" "Linux" "All Channel"
#
def rss():
    parsed = parse()
    urls = []

    pre = "https://www.youtube.com/feeds/videos.xml?channel_id="
    keys = parsed.keys()
    for i in keys:
        channel_id = parsed[i]['channel_id']
        group = parsed[i]['group']
        name = parsed[i]['name']
        a = pre + channel_id + ' '
        for i in group:
            a += i + ' '
        a += name + " " + '\n'
        urls.append(a)
    with open('rss.txt', 'w') as f:
        for i in urls:
            f.writelines(i)


# example:
# https://www.youtube.com/channel/UCB9_VH_CNbbH4GfKu8qh63w/videos  #DEATH BATTLE!
#
def ytfzf():
    parsed = parse()
    urls = []

    pre = "https://www.youtube.com/channel/"
    keys = parsed.keys()
    for i in keys:
        channel_id = parsed[i]['channel_id']
        name = parsed[i]['name']
        a = pre + channel_id + ' # ' + name + '\n'
        urls.append(a)
    with open(path_to_ytfzf, 'w') as f:
        for i in urls:
            f.writelines(i)


if __name__ == '__main__':
    rss()
