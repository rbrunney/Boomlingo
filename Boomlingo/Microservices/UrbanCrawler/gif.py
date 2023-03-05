from urllib.request import urlopen
from bs4 import BeautifulSoup

def lambda_handler(event, context):

    search_term = event['search_term']
    return get_gif_link(search_term)

def get_gif_link(search_term: str):

    try:
        url = f'https://tenor.com/search/${search_term.replace(" ", "-")}-gifs'
        page = urlopen(url)
        soup = BeautifulSoup(page, 'html.parser')
    except:
        return {
            "message" : f"Could not find load at this time"
        }
    
    gif_list = soup.find('div', {'class': {'GifList'}})
    gif_column = gif_list.find('div', {'class': {'column'}})
    first_gif = gif_column.find('figure', {'class': {'GifListItem clickable'}})
    gif = first_gif.find('div', {'class': {'Gif'}})
    gif_link = gif.find('img')
    return {
        'gif_link' : gif_link['src']
    }