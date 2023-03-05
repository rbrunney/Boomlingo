from urllib.request import urlopen
from profanity import profanity
from bs4 import BeautifulSoup

def lambda_handler(event, context):
    return get_word_of_day()

def get_word_of_day():

    try:
        url = f'https://www.urbandictionary.com/'
        page = urlopen(url)
        soup = BeautifulSoup(page, 'html.parser')
    except:
        return {
            "message" : f"Could not find load at this time"
        }
    
    definition_card = soup.find('div', {'class': {'p-5 md:p-8'}})
    term = definition_card.find('div', {'class': {'mb-8 flex'}}).text
    definition = definition_card.find('div', {'class': {'break-words meaning mb-4'}})
    example = definition_card.find('div', {'class' : {'break-words example italic mb-4'}})
        

    return {
        "term" : term,
        "definition" : profanity.censor(definition.get_text()),
        "example" : profanity.censor(example.get_text()),
        "gif_link" : get_gif_link(term)
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