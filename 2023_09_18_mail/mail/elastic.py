import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from smtplib import SMTPException
import sys
import json


# Add plain text content
with open("./message.json", 'r', encoding='utf-8') as json_file:
    message = json.load(json_file)
# Address list
with open("./address.json", 'r', encoding='utf-8') as json_file:
    addressArr = json.load(json_file)
# Sent address
with open("./sent.json", 'r', encoding='utf-8') as json_file:
    sentArr = json.load(json_file)


# Create a mail object
mailObj = MIMEMultipart()
mailObj['Subject'] = message["subject"]
mailObj['From'] = 'jackson.andrew2244@gmail.com'
mailObj.attach(MIMEText(message["content"], 'plain'))

smtp_server = 'smtp.elasticemail.com'
smtp_port = 2525
smtp_username = 'jackson.andrew2244@gmail.com'
smtp_password = 'C62DB574EAB95CBB43F9F259EC9B7767DCDB'

server = smtplib.SMTP(smtp_server, smtp_port)
server.starttls()
server.login(smtp_username, smtp_password)

for index, item in enumerate(addressArr):
    if item in sentArr:
        continue
    # Set up target address
    mailObj['To'] = item
    # Set up the SMTP server connection (Gmail in this example)
    # Send the email
    try:
        server.sendmail(smtp_username, item, mailObj.as_string())
        print(f"Sent to {index}\t/ {item}")
        sentArr.append(item)
    except SMTPException as e:
        # Handle SMTP-specific exception
        print(f"SMTPException occurred: {e}")
# Close the SMTP server connection
server.quit()

with open("sent.json", "w") as json_file:
    json.dump(sentArr, json_file, indent=4)