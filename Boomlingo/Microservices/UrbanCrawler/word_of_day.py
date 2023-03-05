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
        "example" : profanity.censor(example.get_text())
    }