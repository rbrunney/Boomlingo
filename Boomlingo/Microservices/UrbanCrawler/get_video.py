from urllib.request import urlopen, Request
from bs4 import BeautifulSoup

def lambda_handler(event, context):

    search_term = event['search_term']

    return crawl_urban_dictionary(search_term.replace(' ', '%20'))

def crawl_urban_dictionary(search_term):

    try:
        url = f'https://www.memedroid.com/search?query={search_term}'
        print(url)
        request = Request(url)
        request.add_header('User-Agent', 'Mozilla/5.0')
        page = urlopen(url)
        soup = BeautifulSoup(page, 'html.parser')
    except:
        return {
            "message" : f"Could not find {search_term.replace(' ', '%20')}"
        }
    
    youtube_short = soup.find('img', {'class': {'img-responsive grey-background'}})

    print(youtube_short)
        
    return {
    }

print(lambda_handler({'search_term' : input('[SEARCH] Enter Term to Find ')}, {}))