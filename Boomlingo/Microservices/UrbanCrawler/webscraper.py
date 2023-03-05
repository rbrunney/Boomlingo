from urllib.request import urlopen
from profanity import profanity
from bs4 import BeautifulSoup

def lambda_handler(event, context):

    search_term = event['search_term']
    return crawl_urban_dictionary(search_term)

def crawl_urban_dictionary(search_term: str):

    try:
        url = f'https://www.urbandictionary.com/define.php?term={search_term.replace(" ", "%20")}'
        page = urlopen(url)
        soup = BeautifulSoup(page, 'html.parser')
    except:
        return {
            "message" : f"Could not find {search_term.replace('%20', ' ')}"
        }
    
    definition_card = soup.find('div', {'class': {'p-5 md:p-8'}})
    definition = definition_card.find('div', {'class': {'break-words meaning mb-4'}})
    example = definition_card.find('div', {'class' : {'break-words example italic mb-4'}})
        

    return {
        "term" : search_term.replace('%20', ' '),
        "definition" : profanity.censor(definition.get_text()),
        "example" : profanity.censor(example.get_text()),
        "gif_link" : get_gif_link(search_term)
    }

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
    
    return gif_link['src']