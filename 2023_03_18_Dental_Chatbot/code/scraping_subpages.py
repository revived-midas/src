import requests
from bs4 import BeautifulSoup
import re
import nltk
from nltk.corpus import wordnet

# Define keywords related to dental
dental_keywords = ["dental"]

# Define a function to check if a given string contains dental keywords
def is_related_to_dental(text):
    # Tokenize the text into words
    words = nltk.word_tokenize(text)
    # Iterate over the words and check if they are related to dental
    for word in words:
        # Check if the word has a synset in WordNet that is related to dental
        if any(synset.name().split('.')[0] in dental_keywords for synset in wordnet.synsets(word)):
            return True
    # If none of the words are related to dental, return False
    return False

visited = {}

def get_text(url):
    # Get the HTML content of the page.
    response = requests.get(url)
    try:
        html_content = response.content
    except:
        return ""
    
    # Parse the HTML content using BeautifulSoup.
    soup = BeautifulSoup(html_content, "html.parser")
    
    # Get all the text from the page.
    text = ""
    text_elements = soup.find_all(string=True)
    
    for texts in text_elements:
        if texts.parent.name in ['style', 'script', 'head', 'title', 'meta', '[document]']:
            continue
        if not is_related_to_dental(texts):
            continue
        text += '{} '.format(texts)
    text += "\n"
    print(text)
    
    # Find all the links on the page and get their text.
    links = soup.find_all('a')
    for link in links:
        link_text = link.get_text()
        if not is_related_to_dental(link_text): link_text = ""
        link_url = link.get('href')
        if '#' in link_url: continue
        if not link_url.startswith("https://bestdentistmarketing.com"): continue
        if link_url in visited: continue
        print(link_url)
        visited[link_url] = True
        if 'http' not in link_url:
            link_url = url + link_url
        link_text += get_text(link_url) + "\n"
        text += link_text
    
    # Return the text.
    return text

all_text = get_text("https://bestdentistmarketing.com")
encoded_text = all_text.encode('utf-8')
fo = open("test.txt", "w")
fo.write(encoded_text)
fo.close()