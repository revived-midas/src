import os
import requests
import json
from dotenv import load_dotenv
from enum import Enum

load_dotenv()

class ApiClient:
	apiUri = 'https://api.elasticemail.com/v2'
	apiKey = os.getenv("API_KEY")

	def Request(method, url, data):
		data['apikey'] = ApiClient.apiKey
		if method == 'POST':
			result = requests.post(ApiClient.apiUri + url, data = data)
		elif method == 'PUT':
			result = requests.put(ApiClient.apiUri + url, data = data)
		elif method == 'GET':
			attach = ''
			for key in data:
				attach = attach + key + '=' + data[key] + '&' 
			url = url + '?' + attach[:-1]
			result = requests.get(ApiClient.apiUri + url)	
			
		jsonMy = result.json()
		
		if jsonMy['success'] is False:
			return jsonMy['error']
			
		return jsonMy['data']

def Send(subject, EEfrom, fromName, to, bodyHtml, bodyText, isTransactional):
	return ApiClient.Request('POST', '/email/send', {
		'subject': subject,
		'from': EEfrom,
		'fromName': fromName,
		'to': to,
		'bodyHtml': bodyHtml,
		'bodyText': bodyText,
		'isTransactional': isTransactional})
				
print(Send("Your Subject", "jackson.andrew2244@gmail.com", "Your Company Name", "old.hickroy2341@gmail.com", "<h1>Html Body</h1>", "Text Body", True))